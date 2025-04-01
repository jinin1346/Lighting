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

@WebServlet("/maindata.do")

public class MainData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //MainData.java
        MainDAO dao = new MainDAO();
        String categorySubSeq = req.getParameter("tblCategorySubSeq");
        
        
        String showAll = req.getParameter("showAll");
        
        //1. 회원 캍테고리 시퀀스 + tblInterest insert
        HttpSession session = req.getSession(true);
        //session.setAttribute("auth", "1"); //인증티켓
        if(session.getAttribute("auth") == null) {
            session.setAttribute("auth", "1");
        }
        
        // 세션 확인 : 회원이면 세션에 auth 속성이 있음
        //HttpSession session = req.getSession(false);
        String tblMemberSeq = (session != null) ? (String) session.getAttribute("auth") : null;

        
     // showAll이 "true"이면 전체 목록을 보여주도록 하고, 그렇지 않으면 관심 기반 로직을 실행
        List<MainDTO> meetingList;
        if ("true".equals(showAll)) {
            meetingList = dao.getMeetingList();
        } else {
            // 회원인 경우, 요청 파라미터가 없으면 tblinterest에서 회원의 최고 점수 카테고리 조회
            if(tblMemberSeq != null && (categorySubSeq == null || categorySubSeq.trim().isEmpty())) {
                categorySubSeq = dao.getHighestInterestCategory(tblMemberSeq);
            }
            
            // 회원이면서 카테고리 시퀀스가 전달된 경우 tblInterest에 insert 실행
            if (categorySubSeq != null && !categorySubSeq.trim().isEmpty() && tblMemberSeq != null) {
                dao.insertInterestScore(tblMemberSeq, categorySubSeq);
            }
            
            if (categorySubSeq != null && !categorySubSeq.trim().isEmpty()) {
                meetingList = dao.getMeetingListByCategory(categorySubSeq);
            } else {
                meetingList = dao.getMeetingList();
            }
        }
        
        /*
        // 회원인 경우, 요청 파라미터가 없으면 tblinterest에서 회원의 최고 점수 카테고리 조회
        if(tblMemberSeq != null && (categorySubSeq == null || categorySubSeq.trim().isEmpty())) {
            categorySubSeq = dao.getHighestInterestCategory(tblMemberSeq);
        }
        
        
        // 회원이면서 카테고리 시퀀스가 전달된 경우 tblInterest에 insert 실행
        if (categorySubSeq != null && !categorySubSeq.trim().isEmpty() && tblMemberSeq != null) {
            dao.insertInterestScore(tblMemberSeq, categorySubSeq);
        }
        
        
        
        //중분류 누르면 뜨는것, 비회원
        //캍테고리 시퀀스가 있으면 조회, 없으면 전체조회
        List<MainDTO> meetingList;
        
        if (categorySubSeq != null && !categorySubSeq.trim().isEmpty()) {
            meetingList = dao.getMeetingListByCategory(categorySubSeq);
        } else {
            meetingList = dao.getMeetingList();
        }
        
        
        */
        
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
        
        
        
        

        dao.close();
        
        
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr);
        writer.close();
        

    }

}