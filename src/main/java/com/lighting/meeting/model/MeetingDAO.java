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
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public List<ActivityRegionCoordinateDTO> getActivityRegionCoordinate(String tblMemberSeq) {
        
        try {
            List<ActivityRegionCoordinateDTO> list = new ArrayList<ActivityRegionCoordinateDTO>();
            
            String sql = "select latitude, longitude from tblActivityRegionCoordinate a join tblActivityRegion b on a.tblActivityRegionCoordinateSeq = b.tblActivityRegionCoordinateSeq where b.tblMemberSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, tblMemberSeq);
            
            rs = pstat.executeQuery();
            
            while (rs.next()) {
                ActivityRegionCoordinateDTO dto = new ActivityRegionCoordinateDTO();
                dto.setLatitude(rs.getString("latitude"));
                dto.setLongitude(rs.getString("longitude"));
                list.add(dto);
            }
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public int add(MeetingPostDTO dto) {
        
        try {
            String sql = """
                    insert into tblMeetingPost values (
                        seqMeetingPost.nextval,
                        ?,
                        ?,
                        default,
                        ?,
                        ?,
                        TO_DATE(?, 'YYYY-MM-DD HH24:MI'),
                        TO_DATE(?, 'YYYY-MM-DD HH24:MI') + 2/24,
                        ?,
                        ?,
                        ?)
                    """;
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getTitle());
            pstat.setString(2, dto.getContent());
            pstat.setString(3, dto.getLocation());
            pstat.setString(4, dto.getCapacity());
            pstat.setString(5, dto.getStartTime());
            pstat.setString(6, dto.getStartTime());//FIXME endTime 고쳐야 함 
            
            String photoFileName = "";
            if (dto.getPhotoFileName().equals("") || dto.getPhotoFileName() == null) {
                photoFileName = "basic스포츠유산소.png";
            } else {
                photoFileName = dto.getPhotoFileName();
            }
            
            pstat.setString(7, photoFileName);
            pstat.setString(8, dto.getTblMemberSeq());
            pstat.setString(9, dto.getTblCategorySubSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    
}

























