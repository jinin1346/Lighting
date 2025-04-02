package com.lighting.meeting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.meeting.model.MeetingDAO;
import com.lighting.meeting.model.WishlistDTO;

@WebServlet("/meeting/deletewish.do")
public class DeleteWish extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.setCharacterEncoding("UTF-8");
        String tblMeetingPostSeq = req.getParameter("tblMeetingPostSeq");
        String loginedtblMemberSeq = req.getParameter("loginedtblMemberSeq");
        
        WishlistDTO dto = new WishlistDTO();
        MeetingDAO dao = new MeetingDAO();
        
        dto.setTblMeetingPostSeq(tblMeetingPostSeq);
        dto.setTblMemberSeq(loginedtblMemberSeq);
        
        int result = dao.deleteWish(dto);
        
        dao.close();
    }

}
