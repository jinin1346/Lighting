package com.lighting.mypage;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.mypage.model.MeetingDAO;
import com.lighting.mypage.model.MemberDTO;

@WebServlet("/mypage/giveevaluation.do")
public class GiveEvaluation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int hostSeq = 1; // 테스트용

        MeetingDAO dao = new MeetingDAO();
        int meetingSeq = dao.getLatestMeetingSeqByHostWithParticipants(hostSeq);
        List<MemberDTO> attendees = dao.getApprovedParticipants(meetingSeq, hostSeq);

        req.setAttribute("meetingSeq", meetingSeq);
        req.setAttribute("attendees", attendees);
        req.setAttribute("evaluationCount", attendees.size());

        System.out.println("모임 시퀀스: " + meetingSeq);
        System.out.println("참석자 수: " + attendees.size());

        req.getRequestDispatcher("/WEB-INF/views/mypage/giveevaluation.jsp").forward(req, resp);
    }
}