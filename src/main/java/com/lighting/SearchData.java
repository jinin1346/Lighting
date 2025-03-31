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

@WebServlet("/searchdata.do")

public class SearchData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //SearchData.java
        System.out.println("333");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        String searchKeyword = req.getParameter("searchKeyword");
        String categorySubSeqStr = req.getParameter("tblCategorySubSeq");

        
        MainDAO dao = new MainDAO();
        //1. 비회원의 검색어를 통한 게시글 조회
        List<MainDTO> meetingList = dao.searchMeetingPosts(searchKeyword); 
        
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
        
        //2. 회원의 게시글 조회 + tblSearchHistory insert
        
        
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr);
        writer.close();
        
        


    }

}