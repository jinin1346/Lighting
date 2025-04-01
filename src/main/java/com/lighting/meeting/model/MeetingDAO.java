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

    public int addLocationCoordinate(MeetingPostDTO dto) {
        
        try {
            
            String sql = "select max(tblMeetingPostSeq) as tblMeetingPostSeq from tblMeetingPost";
            String tblMeetingPostSeq = "";
            
            rs = stat.executeQuery(sql);
            
            if (rs.next()) {
                tblMeetingPostSeq = rs.getString(1);
                
                sql = """
                        insert into tblLocationCoordinate values (?, ?, ?)
                        """;
                
                pstat = conn.prepareStatement(sql);
                pstat.setString(1, tblMeetingPostSeq);
                pstat.setString(2, dto.getLatitude());
                pstat.setString(3, dto.getLongitude());
                
                return pstat.executeUpdate();
                
            } 
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public MemberDTO getMemberInfo(String tblMeetingPostSeq) {

        try {
            
            MemberDTO dto = new MemberDTO();
            String sql = "select * from tblMember where tblMemberSeq ="
                    + "(select tblMemberSeq from tblMeetingPost where tblMeetingPostSeq = ?)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, tblMeetingPostSeq);
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setTblMemberSeq(rs.getString("tblMemberSeq"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPhotoFileName(rs.getString("PhotoFileName"));
                dto.setGender(rs.getString("gender"));
            }
            
            sql = "select nvl(round(avg(score), 1), 0) as score from tblEvaluation where evaluatedMemberSeq = ?";
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMemberSeq());
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setScore(rs.getString("score"));
            }
            
            sql = "select sido, gugun from tblActivityRegionCoordinate where tblActivityRegionCoordinateSeq = (select tblActivityRegionCoordinateSeq from tblActivityRegion where tblMemberSeq = ?)";
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMemberSeq());
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setSido(rs.getString("sido"));
                dto.setGugun(rs.getString("gugun"));
            }
            
            return dto;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public MeetingPostDTO getPostInfo(String tblMeetingPostSeq) {

        try {
            
            MeetingPostDTO dto = new MeetingPostDTO();
            String sql = "select * from tblMeetingPost where tblMeetingPostSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, tblMeetingPostSeq);
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setTitle(rs.getString("Title"));
                dto.setContent(rs.getString("Content"));
                dto.setPostDate(rs.getString("PostDate"));
                dto.setLocation(rs.getString("Location"));
                dto.setCapacity(rs.getString("Capacity"));
                dto.setStartTime(rs.getString("StartTime"));
                dto.setPhotoFileName(rs.getString("PhotoFileName"));
            }
            
            sql = "select * from tblLocationCoordinate where tblMeetingPostSeq = ?";
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, tblMeetingPostSeq);
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setLatitude(rs.getString("Latitude"));
                dto.setLongitude(rs.getString("Longitude"));
            }
            
            return dto;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public List<MemberDTO> getParticipantInfo(String tblMeetingPostSeq) {
        
        try {
            
            List<MemberDTO> list = new ArrayList<MemberDTO>();
            
            String sql = "select a.tblMemberSeq as tblMemberSeq, photoFileName from tblParticipationRequest a join tblMember b on a.tblMemberSeq = b.tblMemberSeq where tblMeetingPostSeq = ? and approvalStatus = 'Y'";
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, tblMeetingPostSeq);
            
            rs = pstat.executeQuery();
            
            while (rs.next()) {
                MemberDTO dto = new MemberDTO();
                dto.setTblMemberSeq(rs.getString("TblMemberSeq"));
                dto.setPhotoFileName(rs.getString("photoFileName"));
                list.add(dto);
            }
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public int addWish(WishlistDTO dto) {
        
        try {
            String sql = """
                    insert into tblWishlist values (seqWishList.nextVal, ?, ?)
                    """;
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getTblMemberSeq());
            pstat.setString(2, dto.getTblMeetingPostSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int deleteWish(WishlistDTO dto) {
        
        try {
            String sql = """
                    delete from tblWishlist where tblMemberSeq = ? and tblMeetingPostSeq = ?
                    """;
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getTblMemberSeq());
            pstat.setString(2, dto.getTblMeetingPostSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }


    
}

























