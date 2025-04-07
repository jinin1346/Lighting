package com.lighting;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.lighting.model.MainDAO;

@WebServlet("/weatherdata.do")

public class WeatherData extends HttpServlet {

    private static final String API_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
    private static final String AUTH_KEY = "j6HKCi8s4LL9mRV%2FFfnurB8qjGDnvcJkoWOnJXH8q1VIqhraXMaTUGgtv7FDv7Sp2DhrSaDGzvNo599YB16w%2BQ%3D%3D";
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //WeatherData.java
        String location = "서울특별시 서초구"; // 기본값
        double latitude = 37.5;  // 기본 위도
        double longitude = 127.0; // 기본 경도
        
        HttpSession session = req.getSession(false);
        MainDAO dao = new MainDAO();
        if (session != null && session.getAttribute("auth") != null) {
            
            String tblMemberSeq = (String) session.getAttribute("auth");
            //위치 가져옴
            location = dao.getUserLocation(tblMemberSeq);
            System.out.println(location);
            
            //  위도/경도 가져옴
            // coords[0]: latitude, coords[1]: longitude
            double[] coords = dao.getUserCoordinates(tblMemberSeq); 
            if (coords != null && coords.length == 2) {
                latitude = coords[0];
                longitude = coords[1];
            }
        }
        
        dao.close();
        
        
        // 위도/경도를 nx, ny 좌표로 변환 (LCC DFS 좌표변환)
        int[] xy = convertToXY(latitude, longitude);
        int nx = xy[0];
        int ny = xy[1];
        
        /*
         * //변경하기!!! 임시 
         * String baseDate = "20250402"; // 예: 2025년 4월 2일 (YYYYMMDD)
         * String baseTime = "1200"; // 예: 12시 (HHMM)
         */        
        
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String baseDate = dateFormat.format(cal.getTime());

        int hour = cal.get(Calendar.HOUR_OF_DAY);
        int previousHour = (hour - 1 + 24) % 24;
        String baseTime = String.format("%02d00", previousHour);
        
        
        String temperature = "";
        String precipitationType = "";
        
        
     // 기상청 API 호출
        try {
            String nxStr = Integer.toString(nx);
            String nyStr = Integer.toString(ny);
            StringBuilder urlBuilder = new StringBuilder(API_URL);
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + AUTH_KEY);
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=10");
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=1");
            urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=JSON");
            urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nxStr, "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(nyStr, "UTF-8"));
            
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            String result = sb.toString();
        
            
            // JSON 파싱
            JSONParser parser = new JSONParser();
            JSONObject root = (JSONObject) parser.parse(result);
            JSONObject response = (JSONObject) root.get("response");
            JSONObject body = (JSONObject) response.get("body");
            JSONObject items = (JSONObject) body.get("items");
            JSONArray itemArray = (JSONArray) items.get("item");
            
            for (Object obj : itemArray) {
                JSONObject item = (JSONObject) obj;
                String category = (String) item.get("category");
                String obsrValue = item.get("obsrValue").toString();
                // 온도: T1H
                if ("T1H".equals(category)) {
                    temperature = obsrValue;
                }
                // 강수형태: PTY (0: 없음, 1: 비, 2: 비/눈, 3: 눈, 등)
                if ("PTY".equals(category)) {
                    precipitationType = obsrValue;
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
            
        
        // 결과 JSON 구성
        JSONObject obj = new JSONObject();
        obj.put("location", location);
        obj.put("temperature", temperature);
        obj.put("precipitationType", precipitationType);
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter writer = resp.getWriter();
        writer.print(obj);
        writer.close();

    }
    
    
    
 // Java로 구현한 LCC DFS 좌표변환 (위경도 -> 격자 좌표)
    private int[] convertToXY(double lat, double lng) {
        double RE = 6371.00877;  // 지구 반경 (km)
        double GRID = 5.0;       // 격자 간격 (km)
        double SLAT1 = 30.0;     // 투영 위도1 (degree)
        double SLAT2 = 60.0;     // 투영 위도2 (degree)
        double OLON = 126.0;     // 기준점 경도 (degree)
        double OLAT = 38.0;      // 기준점 위도 (degree)
        int XO = 43;             // 기준점 X좌표 (GRID)
        int YO = 136;            // 기준점 Y좌표 (GRID)
        
        double DEGRAD = Math.PI / 180.0;
        
        double re = RE / GRID;
        double slat1Rad = SLAT1 * DEGRAD;
        double slat2Rad = SLAT2 * DEGRAD;
        double olonRad = OLON * DEGRAD;
        double olatRad = OLAT * DEGRAD;
        
        double sn = Math.tan(Math.PI * 0.25 + slat2Rad * 0.5) / Math.tan(Math.PI * 0.25 + slat1Rad * 0.5);
        sn = Math.log(Math.cos(slat1Rad) / Math.cos(slat2Rad)) / Math.log(sn);
        double sf = Math.tan(Math.PI * 0.25 + slat1Rad * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat1Rad) / sn;
        double ro = Math.tan(Math.PI * 0.25 + olatRad * 0.5);
        ro = re * sf / Math.pow(ro, sn);
        
        double ra = Math.tan(Math.PI * 0.25 + lat * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        double theta = lng * DEGRAD - olonRad;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        int nx = (int)Math.floor(ra * Math.sin(theta) + XO + 0.5);
        int ny = (int)Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
        return new int[]{nx, ny};
    }
    
    
    

}