package com.lighting.chat;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chat/chatview.do")

public class ChatView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //ChatView.java
        HttpSession session = req.getSession();
        String tblMemberSeq = (String) session.getAttribute("auth");
        

        if(tblMemberSeq == null) {
            // 로그인되지 않은 경우, 로그인 페이지로 리다이렉트 처리
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }
        
        
        // ChatRoomDAO를 이용하여 사용자가 참여 중인 채팅방 목록을 조회합니다.
        ChatRoomDAO chatRoomDAO = new ChatRoomDAO();
        List<ChatDTO> chatRooms = chatRoomDAO.getChatRooms(tblMemberSeq);
        chatRoomDAO.close();
        
        // 조회한 채팅방 목록을 request attribute에 저장합니다.
        req.setAttribute("chatRooms", chatRooms);
        
        
        //req.getRequestDispatcher("/WEB-INF/views/chat/chatview.jsp").forward(req, resp);
        req.getRequestDispatcher("/WEB-INF/views/chat/chatview2.jsp").forward(req, resp);

    }

}