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
        System.out.println("12");
        MainDAO dao = new MainDAO();
        List<MainDTO> meetingList = dao.getMeetingList(); 
        
        JSONArray arr = new JSONArray();
        for(MainDTO dto : meetingList) {
            JSONObject obj = new JSONObject();
            obj.put("tblMeetingPostSeq", dto.getTblMeetingPostSeq());
            obj.put("tblMemberSeq", dto.getTblMemberSeq());
            obj.put("tblCategorySubSeq", dto.getTblCategorySubSeq());
            obj.put("meetingPhoto", dto.getMeetingPhoto());
            obj.put("title", dto.getTitle());
            obj.put("memberPhoto", dto.getMemberPhoto());
            obj.put("nickname", dto.getNickname());
            obj.put("capacity", dto.getCapacity());
            
            arr.add(obj);
            
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr);
        writer.close();
        

    }

}