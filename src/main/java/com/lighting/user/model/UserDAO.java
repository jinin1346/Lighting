package com.lighting.user.model;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {

    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    public UserDAO() {
        
        try {
            
            Context ctx = new InitialContext();
            Context env = (Context)ctx.lookup("java:comp/env");
            DataSource ds = (DataSource)env.lookup("jdbc/pool");
            
            conn = ds.getConnection();
            stat = (Statement) conn.createStatement();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    

    // 아이디 중복 검사
    public boolean isDuplicateId(String id) {
        String query = "SELECT COUNT(*) FROM users WHERE id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // 중복된 아이디가 있으면 true
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 회원 정보를 추가하는 메서드
    public int addMember(MemberDTO memberDto) {
        String query = "INSERT INTO tblMember (id, pw, name, nickname, birthday, tel, email, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, memberDto.getId());
            stmt.setString(2, memberDto.getPw());
            stmt.setString(3, memberDto.getName());
            stmt.setString(4, memberDto.getNickname());
            stmt.setString(5, memberDto.getBirthday());
            stmt.setString(6, memberDto.getTel());
            stmt.setString(7, memberDto.getEmail());
            stmt.setString(8, memberDto.getGender());
            
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1); // 삽입된 회원의 ID 반환
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 실패
    }

    // 자원 해제 메서드
    public void close() {
        try {
            if (conn != null) {
            	conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}