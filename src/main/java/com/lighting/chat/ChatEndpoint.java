package com.lighting.chat;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@ServerEndpoint(value = "/chat/{chatRoomSeq}", configurator = ChatEndpointConfigurator.class)
public class ChatEndpoint {

    // 각 채팅방(chatRoomSeq)에 연결된 세션들을 저장합니다.
    private static ConcurrentHashMap<String, Set<Session>> chatRooms = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("chatRoomSeq") String chatRoomSeq) {
        // WebSocket Session에서 HttpSession을 가져옵니다.
        HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
        String tblMemberSeq = (httpSession != null) ? (String) httpSession.getAttribute("auth") : null;
        
        chatRooms.putIfAbsent(chatRoomSeq, new CopyOnWriteArraySet<>());
        Set<Session> sessions = chatRooms.get(chatRoomSeq);
        // 1:1 채팅 방에서는 최대 두 개의 세션만 허용하도록 합니다.
        if(sessions.size() >= 2) {
            try {
                session.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
            System.out.println("채팅방 " + chatRoomSeq + "에 이미 두 명의 사용자가 접속 중입니다.");
            return;
        }
        
        chatRooms.get(chatRoomSeq).add(session);
        System.out.println("접속된 세션, 채팅방번호: " + chatRoomSeq + ", 회원 시퀀스: " + tblMemberSeq);
    }


    @OnMessage
    public void onMessage(String message, Session session, @PathParam("chatRoomSeq") String chatRoomSeq) {
        try {
            // WebSocket Session에서 HttpSession을 가져옵니다.
            HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
            String tblMemberSeq = (httpSession != null) ? (String) httpSession.getAttribute("auth") : null;

            
            // 클라이언트로부터 JSON 형태의 메시지 수신 (예: {"sender":"나", "content":"안녕하세요"})
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(message);
            String sender = (String) json.get("sender");
            String content = (String) json.get("content");

            // 실시간 전송을 위한 응답 메시지 구성 (타임스탬프 포함)
            JSONObject response = new JSONObject();
            response.put("sender", sender);
            response.put("content", content);
            response.put("timestamp", System.currentTimeMillis());

            // 데이터베이스에 채팅 기록 저장 
            ChatDAO chatDAO = new ChatDAO();
            System.out.println("DB채팅방번호입니다 : "+chatRoomSeq);
            chatDAO.insertChatHistory(chatRoomSeq, tblMemberSeq, content, "0");

            // 같은 채팅방에 있는 모든 클라이언트에 메시지 전송
            Set<Session> sessions = chatRooms.get(chatRoomSeq);
            for (Session s : sessions) {
                if(s.isOpen()){
                    s.getBasicRemote().sendText(response.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("chatRoomSeq") String chatRoomSeq) {
        Set<Session> sessions = chatRooms.get(chatRoomSeq);
        if(sessions != null) {
            sessions.remove(session);
        }
        System.out.println("연결 종료, 채팅방번호: " + chatRoomSeq);
    }

    @OnError
    public void onError(Session session, Throwable throwable, @PathParam("chatRoomSeq") String chatRoomSeq) {
        System.out.println("오류 발생, 채팅방번호: " + chatRoomSeq);
        throwable.printStackTrace();
    }
}
