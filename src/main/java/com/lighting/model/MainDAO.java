package com.lighting.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MainDAO {
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    public MainDAO() {
        
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
    
    public List<MainDTO> getMeetingList() {
        try {
            
            List<MainDTO> list = new ArrayList<MainDTO>();
            
            /*
            testQuery
            select mp.tblMeetingPostSeq, mp.title, mp.photoFileName as meetingPhoto, mp.capacity,m.photoFileName as memberPhoto, m.nickname
            from tblMeetingPost mp
            join tblMember m on mp.tblMemberSeq = m.tblMemberSeq;
            */
            

            
            
            String sql = "select mp.tblMeetingPostSeq, mp.title, mp.photoFileName as meetingPhoto, mp.capacity,m.photoFileName as memberPhoto, m.nickname "
                    + "from tblMeetingPost mp "
                    + "join  tblMember m on mp.tblMemberSeq = m.tblMemberSeq order by tblMeetingPostSeq";
            
            rs = stat.executeQuery(sql);
            
            while (rs.next()) {
                //레코드 1줄 > DTO 1개
                MainDTO dto = new MainDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setMeetingPhoto(rs.getString("meetingPhoto"));
                dto.setCapacity(rs.getString("capacity"));
                dto.setMemberPhoto(rs.getString("memberPhoto"));
                dto.setNickname(rs.getString("nickname"));
                
                list.add(dto);
            }
            
            rs.close();
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<MainDTO> searchMeetingPosts(String searchKeyword) {
        try {
            
            List<MainDTO> list = new ArrayList<MainDTO>();
            String sql = "select mp.tblMeetingPostSeq, mp.title, mp.photoFileName as meetingPhoto, mp.capacity,m.photoFileName as memberPhoto, m.nickname "
                    + "from tblMeetingPost mp "
                    + "join  tblMember m on mp.tblMemberSeq = m.tblMemberSeq "
                    + "where title like ? or content like ? "
                    +"order by tblMeetingPostSeq";
            
            pstat = conn.prepareStatement(sql);
            
            String pattern = "%" + searchKeyword + "%";
            pstat.setString(1, pattern);
            pstat.setString(2, pattern);
            
            rs = pstat.executeQuery();
            
            while (rs.next()) {
                MainDTO dto = new MainDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setMeetingPhoto(rs.getString("meetingPhoto"));
                dto.setCapacity(rs.getString("capacity"));
                dto.setMemberPhoto(rs.getString("memberPhoto"));
                dto.setNickname(rs.getString("nickname"));
                
                list.add(dto);
            }
            
            rs.close();
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertSearchHistory(String searchKeyword, String tblMemberSeq, String tblCategorySubSeq) {
        try {
            String sql = "insert into tblSearchHistory (tblSearchHistorySeq,searchKeyword,tblMemberSeq,tblCategorySubSeq) "
                    + "values(seqSearchHistory.nextval,?,?,?)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, searchKeyword);
            pstat.setString(2, tblMemberSeq);
            pstat.setString(3, tblCategorySubSeq);
            int result = pstat.executeUpdate();
            System.out.println(result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    public void insertInterestScore(String tblMemberSeq, String tblCategorySubSeq) {
        try {
            String sql = "insert into tblinterest (tblinterestseq, tblmemberseq, tblcategorysubseq, score) "
                    + "values(seqInterest.nextval,?,?,10)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, tblMemberSeq);
            pstat.setString(2, tblCategorySubSeq);
            int result = pstat.executeUpdate();
            System.out.println(result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}





















