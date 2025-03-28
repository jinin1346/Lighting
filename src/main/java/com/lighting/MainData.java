package com.lighting;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lighting.model.MainDAO;
import com.lighting.model.MainDTO;

@WebServlet("/maindata.do")

public class MainData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //MainData.java
        
        MainDAO dao = new MainDAO();
        List<MainDTO> meetingList = dao.getMeetingList(); 
        
        JSONArray arr = new JSONArray();
        for(MainDTO dto : meetingList) {
            JSONObject obj = new JSONObject();
            obj.put("meetingphoto", dto.getTblMeetingPostSeq());
            obj.put("meetingphoto", dto.getTblMemberSeq());
            obj.put("meetingphoto", dto.getTblCategorySubSeq());
            obj.put("meetingphoto", dto.getMeetingPhoto());
            obj.put("meetingphoto", dto.getTitle());
            obj.put("meetingphoto", dto.getMemberPhoto());
            obj.put("meetingphoto", dto.getNickname());
            obj.put("meetingphoto", dto.getCapacity());
            
            arr.add(obj);
            
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr);
        writer.close();
        

    }

}