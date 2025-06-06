package com.lighting.meeting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.meeting.model.FriendRequestDTO;
import com.lighting.meeting.model.MeetingDAO;

@WebServlet("/meeting/acceptfriendrequest.do")
public class AcceptFriendRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.setCharacterEncoding("UTF-8");
        String requestingMemberSeq = req.getParameter("requestingMemberSeq");
        String requestedMemberSeq = req.getParameter("requestedMemberSeq");
        
        FriendRequestDTO dto = new FriendRequestDTO();
        MeetingDAO dao = new MeetingDAO();
        
        dto.setRequestedMemberSeq(requestedMemberSeq);
        dto.setRequestingMemberSeq(requestingMemberSeq);
        
        int result = dao.acceptFriendRequest(dto);
        dao.close();
        
    }

}
