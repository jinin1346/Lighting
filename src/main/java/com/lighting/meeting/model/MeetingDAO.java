package com.lighting.meeting.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MeetingDAO {

    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    public MeetingDAO() {
        
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

    public List<CategorySubDTO> getCategories(String tblCategoryMainSeq) {

        try {
            List<CategorySubDTO> list = new ArrayList<CategorySubDTO>();
            
            String sql = "select * from tblCategorySub where tblCategoryMainSeq = ? order by tblCategorySubSeq asc";
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, tblCategoryMainSeq);
            
            rs = pstat.executeQuery();
            
            while (rs.next()) {
                CategorySubDTO dto = new CategorySubDTO();
                dto.setCategoryName(rs.getString("CategoryName"));
                dto.setTblCategoryMainSeq(rs.getString("TblCategoryMainSeq"));
                dto.setTblCategorySubSeq(rs.getString("TblCategorySubSeq"));
                list.add(dto);
            }
            
            this.close();
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    
}

























