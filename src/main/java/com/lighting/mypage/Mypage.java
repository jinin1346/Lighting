package com.lighting.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.lighting.mypage.model.*;

@WebServlet("/mypage/mypage.do")
public class Mypage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1. 상태값 및 정렬값 받기
        String status = req.getParameter("status");
        if (status == null) status = "joined";

        String sort = req.getParameter("sort");
        if (sort == null) sort = "recentOrder";

        // ✅ 로그인된 사용자 seq (현재는 테스트용으로 1 고정)
        int testUserSeq = 1;

        // 2. 세션 처리 (임시 닉네임 등)
        HttpSession session = req.getSession();
        if (session.getAttribute("userNickname") == null) {
            session.setAttribute("evaluationIcon", "마스터.png");
            session.setAttribute("userNickname", "테스트닉네임");
            session.setAttribute("userId", "테스트아이디");
        }

        // 3. 모임 목록 조회
        MeetingDAO meetingDAO = new MeetingDAO();
        ArrayList<MeetingDTO> meetingList;

        switch (status) {
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
        }

        req.setAttribute("meetingList", meetingList);
        req.setAttribute("status", status);
        req.setAttribute("sort", sort);

        // 4. 친구 목록
        FriendDAO friendDAO = new FriendDAO();
        ArrayList<FriendDTO> friendList = friendDAO.getFriendList(testUserSeq);
        req.setAttribute("friendList", friendList);

        // 5. 차단 목록
        BlockDAO blockDAO = new BlockDAO();
        ArrayList<BlockDTO> blockList = blockDAO.getBlockList(testUserSeq);
        req.setAttribute("blockList", blockList);

        // 6. 회원 기본 정보
        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.getMemberBySeq(testUserSeq);
        req.setAttribute("member", member);

        // 7. 평가 점수 및 등급 아이콘
        EvaluationDAO evaDAO = new EvaluationDAO();
        double avgScore = evaDAO.getAverageScore(testUserSeq);

        String gradeIcon = "실버.png";
        if (avgScore >= 4) gradeIcon = "마스터.png";
        else if (avgScore >= 3) gradeIcon = "다이아.png";
        else if (avgScore >= 2) gradeIcon = "골드.png";

        req.setAttribute("avgScore", String.format("%.1f", avgScore));
        req.setAttribute("gradeIcon", gradeIcon);

        // 8. 포워딩
        req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
    }
}
