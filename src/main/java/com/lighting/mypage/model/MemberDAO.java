package com.lighting.mypage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

    private Connection conn;
    private PreparedStatement pstat;
    private ResultSet rs;

    public MemberDAO() {
        try {
            Context ctx = new InitialContext();
            Context env = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) env.lookup("jdbc/pool");
            conn = ds.getConnection();
            
            System.out.println("DB 연결 성공: " + conn);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstat != null) pstat.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public MemberDTO getMemberById(String id) {
        
        MemberDTO dto = null;

        try {
            String sql = "SELECT tblMemberSeq, id, nickname, email, photoFileName "
                       + "FROM tblMember WHERE id = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, id);
            rs = pstat.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setTblMemberSeq(rs.getInt("tblMemberSeq"));
                dto.setId(rs.getString("id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setEmail(rs.getString("email"));
                dto.setPhotoFileName(rs.getString("photoFileName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close();
        }

        return dto;
    }
}
