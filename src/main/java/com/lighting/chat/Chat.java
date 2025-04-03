package com.lighting.chat;

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


@WebServlet("/chat/chat.do")

public class Chat extends HttpServlet {

    
    private static final long serialVersionUID = 1L;
    private ChatDAO chatDAO;
    private ChatRoomDAO chatRoomDAO;
    
    
    @Override
    public void init() throws ServletException {
        chatDAO = new ChatDAO();
        chatRoomDAO = new ChatRoomDAO();
    }
    
    
    // POST: 채팅 메시지 저장
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Chat.java
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain; charset=UTF-8");
        
        
        HttpSession session = req.getSession();
        //session.setAttribute("auth", "913");
        String tblMemberSeq = (String) session.getAttribute("auth");
        if(tblMemberSeq == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = resp.getWriter();
            out.write("Unauthorized: 로그인 필요");
            out.flush();
            return;
        }
        
     // 클라이언트로부터 상대방의 닉네임(nickname)와 메시지(content) 전달 받음
        String nickname = req.getParameter("nickname");
        System.out.println("상대방 닉네임"+nickname);
        String message = req.getParameter("message");
        System.out.println("적은 메시지 : "+message);
        if(nickname == null || message == null || nickname.isEmpty() || message.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = resp.getWriter();
            out.write("Bad Request: partnerId 와 message 필수");
            out.flush();
            return;
        }
        String creatorId = tblMemberSeq;
        
        
     // 두 회원 간의 채팅방 번호 확인; 없으면 생성
        System.out.println("check");
        //dsadasd
        String chatRoomSeq = chatRoomDAO.getChatRoomSeq(creatorId, nickname);
        System.out.println("check");
        
        System.out.println("채ㅣㅇ방번호 널이면!"+chatRoomSeq);
        
        if(chatRoomSeq == null) {
            chatRoomSeq = chatRoomDAO.createChatRoom(creatorId, nickname);
        }
        System.out.println("챝팅방 번호 222"+chatRoomSeq);
        
        // 채팅내역에 메시지 삽입 (status: '0'은 읽지 않음)
        chatDAO.insertChatHistory(chatRoomSeq, creatorId, message, "0");
        
        PrintWriter out = resp.getWriter();
        out.write("메시지 전송 완료");
        out.flush();
    }
    
       
    
 // GET 요청: 특정 채팅방의 채팅내역 조회 (파라미터: partnerId)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //session.setAttribute("auth", "913");
        String loggedInMemberSeq = (String)session.getAttribute("auth");
        if(loggedInMemberSeq == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = response.getWriter();
            out.write("Unauthorized: 로그인 필요");
            out.flush();
            return;
        }
        
        String nickname = request.getParameter("nickname");
        if(nickname == null || nickname.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.write("Bad Request: nickname 필수");
            out.flush();
            return;
        }
        
        String creatorId = loggedInMemberSeq;
        
        String chatRoomSeq = chatRoomDAO.getChatRoomSeq(creatorId, nickname);
        // 채팅방이 없으면 빈 결과 리턴
        if(chatRoomSeq == null) {
            JSONArray jsonArray = new JSONArray();
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.write(jsonArray.toString());
            out.flush();
            return;
        }
        System.out.println("채팅방 널");
        
        List<ChatDTO> messages = chatDAO.getChatHistory(chatRoomSeq);
        JSONArray jsonArray = new JSONArray();
        for(ChatDTO dto : messages) {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("chatHistorySeq", dto.getTblChatHistorySeq());
            jsonObj.put("chatRoomSeq", dto.getTblChatRoomSeq());
            jsonObj.put("memberSeq", dto.getTblMemberSeq());
            jsonObj.put("content", dto.getContent());
            jsonObj.put("postDate", dto.getPostDate().toString());
            jsonObj.put("status", dto.getStatus());
            jsonArray.add(jsonObj);
        }
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write(jsonArray.toString());
        out.flush();
    }
    

}