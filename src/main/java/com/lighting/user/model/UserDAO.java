package com.lighting.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
    
    public UserDTO login(UserDTO dto) {
        try {
            
            String sql = "select * from tblmember where id = ? and pw = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());
            
            rs = pstat.executeQuery();
            
            System.out.println(rs);
            System.out.println("1234");
            
            if (rs.next()) {
                System.out.println("67878");
                //로그인 성공
                UserDTO result = new UserDTO();
                
                result.setTblMemberSeq(rs.getString("tblMemberSeq"));
                //result.setName(rs.getString("name"));
                System.out.println(result);
                
                return result;
                
            } else {
                //로그인 실패
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
