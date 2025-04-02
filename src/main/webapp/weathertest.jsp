<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌표 변환 테스트</title>
    <script language="javascript">
        //<!-- LCC DFS 좌표변환을 위한 기초 자료
        var RE = 6371.00877; // 지구 반경(km)
        var GRID = 5.0; // 격자 간격(km)
        var SLAT1 = 30.0; // 투영 위도1(degree)
        var SLAT2 = 60.0; // 투영 위도2(degree)
        var OLON = 126.0; // 기준점 경도(degree)
        var OLAT = 38.0; // 기준점 위도(degree)
        var XO = 43; // 기준점 X좌표(GRID)
        var YO = 136; // 기준점 Y좌표(GRID)
        
        // LCC DFS 좌표변환 함수
        // code: "toXY"(위경도 -> 격자 좌표), "toLL"(격자 좌표 -> 위경도)
        function dfs_xy_conv(code, v1, v2) {
            var DEGRAD = Math.PI / 180.0;
            var RADDEG = 180.0 / Math.PI;
    
            var re = RE / GRID;
            var slat1 = SLAT1 * DEGRAD;
            var slat2 = SLAT2 * DEGRAD;
            var olon = OLON * DEGRAD;
            var olat = OLAT * DEGRAD;
    
            var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
            sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
            var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
            sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
            var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
            ro = re * sf / Math.pow(ro, sn);
            var rs = {};
    
            if (code == "toXY") {
                // 입력받은 위도, 경도를 그대로 저장
                rs['lat'] = v1;
                rs['lng'] = v2;
                var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
                ra = re * sf / Math.pow(ra, sn);
                var theta = v2 * DEGRAD - olon;
                if (theta > Math.PI) theta -= 2.0 * Math.PI;
                if (theta < -Math.PI) theta += 2.0 * Math.PI;
                theta *= sn;
                rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
                rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
            } else {
                // 격자 좌표를 위경도로 변환하는 경우
                rs['x'] = v1;
                rs['y'] = v2;
                var xn = v1 - XO;
                var yn = ro - v2 + YO;
                var ra = Math.sqrt(xn * xn + yn * yn);
                if (sn < 0.0) ra = -ra;
                var alat = Math.pow((re * sf / ra), (1.0 / sn));
                alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
    
                var theta;
                if (Math.abs(xn) <= 0.0) {
                    theta = 0.0;
                } else {
                    if (Math.abs(yn) <= 0.0) {
                        theta = Math.PI * 0.5;
                        if (xn < 0.0) theta = -theta;
                    } else {
                        theta = Math.atan2(xn, yn);
                    }
                }
                var alon = theta / sn + olon;
                rs['lat'] = alat * RADDEG;
                rs['lng'] = alon * RADDEG;
            }
            return rs;
        }
        //-->
    </script>
    <script language="javascript">
        // 페이지가 로드되면 위도/경도 정보를 입력하여 격자 좌표로 변환 후 결과를 출력
        window.onload = function(){
            // 위도와 경도 (예: 서울시청 부근)
            var rs = dfs_xy_conv("toXY", "37.4979", "127.0276");
            console.log("입력 위도: " + rs.lat + ", 입력 경도: " + rs.lng);
            console.log("변환된 X: " + rs.x + ", 변환된 Y: " + rs.y);
            
            // HTML에 결과 표시
            document.getElementById("result").innerHTML = 
                "<p>입력 위도: " + rs.lat + ", 입력 경도: " + rs.lng + "</p>" +
                "<p>변환된 X: " + rs.x + ", 변환된 Y: " + rs.y + "</p>";
        };
    </script>
</head>
<body>
    <h1>좌표 변환 테스트</h1>
    <div id="result"></div>
</body>
</html>
