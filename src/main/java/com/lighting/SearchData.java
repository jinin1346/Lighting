package com.lighting;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        String tblCategorySubSeq = req.getParameter("tblCategorySubSeq");

        
        //1. 회원 검색조회 + tblSearchHistory insert
        HttpSession session = req.getSession(true);
        session.setAttribute("auth", "1"); //인증티켓
        
        // 세션 확인 : 회원이면 세션에 auth 속성이 있음
        //HttpSession session = req.getSession(false);
        MainDAO dao = new MainDAO();

        if (session != null && session.getAttribute("auth") != null) {
            // 세션에 저장된 값(auth)이 회원 번호라고 가정
            String tblMemberSeq = (String) session.getAttribute("auth");
            // 회원의 검색 기록을 tblSearchHistory에 저장 
            dao.insertSearchHistory(searchKeyword, tblMemberSeq, tblCategorySubSeq);
            //회원  tblInterest에 관심 점수 추가\
            dao.insertInterestScore(tblMemberSeq, tblCategorySubSeq);
        }
        
        
        //2. 회원 + 비회원의 검색어를 통한 게시글 조회
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
        
        
        
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr);
        writer.close();
        
        


    }

}