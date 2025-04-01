package com.lighting.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lighting.mypage.model.BlockDAO;
import com.lighting.mypage.model.BlockDTO;
import com.lighting.mypage.model.FriendDAO;
import com.lighting.mypage.model.FriendDTO;
import com.lighting.mypage.model.MeetingDAO;
import com.lighting.mypage.model.MeetingDTO;

@WebServlet("/mypage/mypage.do")
public class Mypage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // URL 파라미터로 상태(status)와 정렬(sort) 값을 받음
        String status = req.getParameter("status");
        if(status == null) {
            status = "joined";  // 기본 상태: 내가 참여한 모임 보기
        }
        String sort = req.getParameter("sort");
        if(sort == null) {
            sort = "recentOrder"; // 기본 정렬: 최신순
        }
        int testUserSeq = 1; // 테스트용, 실제로는 로그인 세션 등에서 가져옴
        
        HttpSession session = req.getSession();
        if(session.getAttribute("userNickname") == null) {
            session.setAttribute("evaluationIcon", "마스터.png");
            session.setAttribute("userNickname", "테스트닉네임");
            session.setAttribute("userId", "테스트아이디");
        }
        
        MeetingDAO meetingDAO = new MeetingDAO();
        ArrayList<MeetingDTO> meetingList = null;
        switch(status) {
            case "joined":
                meetingList = meetingDAO.getJoinedMeetings(testUserSeq, sort);
                break;
            case "written":
                meetingList = meetingDAO.getWrittenMeetings(testUserSeq, sort);
                break;
            case "wish":
                meetingList = meetingDAO.getWishMeetings(testUserSeq, sort);
                break;
            case "requesting":
                meetingList = meetingDAO.getRequestingMeetings(testUserSeq, sort);
                break;
            case "requested":
                meetingList = meetingDAO.getRequestedMeetings(testUserSeq, sort);
                break;
            default:
                meetingList = meetingDAO.getJoinedMeetings(testUserSeq, sort);
                break;
        }   
        
        // 친구 목록 조회 추가
        FriendDAO friendDAO = new FriendDAO();
        ArrayList<FriendDTO> friendList = friendDAO.getFriendList(1);
        req.setAttribute("friendList", friendList);
        
     // ✅ 차단 목록 조회
        BlockDAO blockDAO = new BlockDAO();
        ArrayList<BlockDTO> blockList = blockDAO.getBlockList(testUserSeq);
        req.setAttribute("blockList", blockList);
        
        req.setAttribute("meetingList", meetingList);
        req.setAttribute("status", status);
        req.setAttribute("sort", sort);
        req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
    }
}
