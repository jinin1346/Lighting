package com.lighting.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ActivityRegionDAO {
    
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public ActivityRegionDAO() {
        
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
    
    public int insertActivityRegion(ActivityRegionDTO dto) {
        int result = 0;
        String sql = "insert into tblActivityRegion (tblMemberSeq, tblActivityRegionCoordinateSeq) VALUES (?, ?)";
        try {
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, dto.getTblMemberSeq());
            pstat.setInt(2, dto.getTblActivityRegionCoordinateSeq());
            result = pstat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return result;
    }
    
    public void close() {
        try {
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
