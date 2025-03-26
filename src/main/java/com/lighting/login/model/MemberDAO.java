package com.lighting.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
    
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    public MemberDAO() {
        
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
    
    public int addMember(MemberDTO dto) {
        
        try {
            
            String sql = "insert into tblMember (tblMemberSeq, id, pw, name, nickname,birthday,"
                    + "tel,email,gender,photoFileName,registrationDate,status) "
                    + "values ( default,?, ?, ?, ?,?, ?, ?, ?,'basicProfile.png',default, default)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());
            pstat.setString(3, dto.getName());
            pstat.setString(4, dto.getNickname());
            pstat.setString(5, dto.getBirthday());
            pstat.setString(6, dto.getTel());
            pstat.setString(7, dto.getEmail());
            pstat.setString(8, dto.getGender());
            
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    
    public void close() {
        try {
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

}
