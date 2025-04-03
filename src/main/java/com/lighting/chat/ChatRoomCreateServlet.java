package com.lighting.chat;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChatRoomCreateServlet")
public class ChatRoomCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String tblMemberSeq = (String) session.getAttribute("auth");
        String nickname = req.getParameter("nickname");
        
        // ChatRoomDAO를 통해 채팅방 생성
        ChatRoomDAO dao = new ChatRoomDAO();
        String generatedChatRoomSeq = dao.createChatRoom(tblMemberSeq, nickname);
        dao.close();
        
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        // 생성 성공 시 채팅방 시퀀스를 반환, 실패 시 error 메시지 전달
        if(generatedChatRoomSeq != null) {
            out.print("{\"tblChatRoomSeq\":\"" + generatedChatRoomSeq + "\"}");
        } else {
            out.print("{\"error\":\"채팅방 생성 실패\"}");
        }
        out.flush();
    }
}
