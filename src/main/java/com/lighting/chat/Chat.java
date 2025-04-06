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
        String tblMemberSeq = (String) session.getAttribute("auth");
        System.out.println("Post요청의 tblmemseq : "+tblMemberSeq);
        
        if(tblMemberSeq == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = resp.getWriter();
            out.write("Unauthorized: 로그인 필요");
            out.flush();
            return;
        }
        
     // 클라이언트로부터 상대방의 닉네임(nickname)와 메시지(content) 전달 받음
        String nickname = req.getParameter("nickname");
        String content = req.getParameter("content");

        System.out.println("상대방 닉네임"+nickname);
        System.out.println("적은 메시지 : "+content);
        
        if(nickname == null || content == null || nickname.isEmpty() || content.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = resp.getWriter();
            out.write("Bad Request: partnerId 와 message 필수");
            out.flush();
            return;
        }
        
        
     // 두 회원 간의 채팅방 번호 확인; 없으면 생성
        System.out.println("check");
        //dsadasd
        String chatRoomSeq = chatRoomDAO.getChatRoomSeq(tblMemberSeq, nickname);
        System.out.println("check");
        
        System.out.println("채ㅣㅇ방번호 널이면!"+chatRoomSeq);
        
        if(chatRoomSeq == null) {
            chatRoomSeq = chatRoomDAO.createChatRoom(tblMemberSeq, nickname);
        }
        System.out.println("챝팅방 번호 222"+chatRoomSeq);
        
        // 채팅내역에 메시지 삽입 (status: '0'은 읽지 않음)
        chatDAO.insertChatHistory(chatRoomSeq, tblMemberSeq, content, "0");
        
        PrintWriter out = resp.getWriter();
        out.write("메시지 전송 완료");
        out.flush();
    }
    
       
    
 // GET 요청: 특정 채팅방의 채팅내역 조회 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //session.setAttribute("auth", "913");
        String tblMemberSeq = (String)session.getAttribute("auth");
        
        
        System.out.println("1. Get요청의 tblmemseq : "+tblMemberSeq);
        
        
        if(tblMemberSeq == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            PrintWriter out = response.getWriter();
            out.write("Unauthorized: 로그인 필요");
            out.flush();
            return;
        }
        
        String nickname = request.getParameter("nickname");
        
        
        System.out.println("2. Get안의 nickname : "+ nickname);
        
        
        if(nickname == null || nickname.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.write("Bad Request: nickname 필수");
            out.flush();
            return;
        }
        
        
        String chatRoomSeq = chatRoomDAO.getChatRoomSeq(tblMemberSeq, nickname);
        
        
        
        System.out.println("3. Get일때 chatRoomSeq : "+chatRoomSeq);
        
        
        
        
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
        String mySeq = tblMemberSeq;  // 세션에 저장된 내 회원 seq
        for(ChatDTO dto : messages) {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("chatHistorySeq", dto.getTblChatHistorySeq());
            jsonObj.put("chatRoomSeq", dto.getTblChatRoomSeq());
            // 내가 보낸 메시지면 "나:" 출력, 아니면 파라미터로 받은 상대방 닉네임 사용
            if(mySeq.equals(dto.getTblMemberSeq())) {
                 jsonObj.put("sender", "나");
            } else {
                 jsonObj.put("sender", nickname);
            }
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