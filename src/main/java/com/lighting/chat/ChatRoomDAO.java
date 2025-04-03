package com.lighting.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatRoomDAO {
    
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    public ChatRoomDAO() {
            
        try {
            
            Context ctx = new InitialContext();
            Context env = (Context)ctx.lookup("java:comp/env");
            DataSource ds = (DataSource)env.lookup("jdbc/pool");
            
            conn = ds.getConnection();
            stat = conn.createStatement();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
            
    }
    
    public void close() {
        try {
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    public String getChatRoomSeq(String creatorId, String nickname) {
        String chatRoomSeq = null;
        System.out.println(creatorId);
        System.out.println(nickname);
        try {
            String sql = "SELECT tblChatRoomSeq FROM tblChatRoom  "
                    + "WHERE (chatCreatorSeq = ? AND chatPartnerSeq = (select tblmemberseq from tblmember where nickname=?)) "
                    + "OR (chatCreatorSeq = (select tblmemberseq from tblmember where nickname=?) AND chatPartnerSeq = ?)";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, creatorId);
            pstat.setString(2, nickname);
            pstat.setString(3, nickname);
            pstat.setString(4, creatorId);
            rs = pstat.executeQuery();
            if (rs.next()) {
                chatRoomSeq = rs.getString("tblChatRoomSeq");
            }
            System.out.println("getChatRoomSeq의채팅방seq : "+chatRoomSeq);
            return chatRoomSeq;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chatRoomSeq;
    }
    
    /**
     * 두 회원 간의 채팅방이 없을 경우 새로 생성하고, 생성된 채팅방 시퀀스를 반환합니다.
     */
    public String createChatRoom(String creatorId, String nickname) {
        System.out.println("createChatRoom의 시작");
        System.out.println("보낸 사람 seq"+creatorId);
        System.out.println("받는 사람 닉네임 : "+nickname);
        String generatedChatRoomSeq = null;
        try {
            String sql = "INSERT INTO tblChatRoom (tblChatRoomSeq, chatCreatorSeq, chatPartnerSeq, createDate) "
                    + "VALUES (seqChatRoom.nextval, ?, (select tblmemberseq from tblmember where nickname=?), sysdate);";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, creatorId);
            pstat.setString(2, nickname);
            pstat.executeUpdate();
            generatedChatRoomSeq = getChatRoomSeq(creatorId, nickname);
            System.out.println("생성된 방 번호"+generatedChatRoomSeq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedChatRoomSeq;
    }
    
    
}
