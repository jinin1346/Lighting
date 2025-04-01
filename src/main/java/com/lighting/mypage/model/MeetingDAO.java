package com.lighting.mypage.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MeetingDAO {

    private Connection conn;
    private PreparedStatement pstat;
    private ResultSet rs;

    public MeetingDAO() {
        try {
            Context ctx = new InitialContext();
            Context env = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) env.lookup("jdbc/pool");
            conn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstat != null) pstat.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 1. 내가 참여한 모임 보기 (joined)
    public ArrayList<MeetingDTO> getJoinedMeetings(int userSeq, String sort) {
        ArrayList<MeetingDTO> list = new ArrayList<>();
        try {
            String orderBy = "ORDER BY startTime DESC"; // 기본: 최신순
            switch(sort) {
                case "koreanOrder": orderBy = "ORDER BY title ASC"; break;
                case "moreCapOrder": orderBy = "ORDER BY capacity DESC"; break;
                case "lessCapOrder": orderBy = "ORDER BY capacity ASC"; break;
                case "oldestOrder": orderBy = "ORDER BY startTime ASC"; break; // ** 수정됨: m.startTime -> startTime
            }
            String sql = "SELECT tblMeetingPostSeq, title, location, capacity, " +
                         "TO_CHAR(startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime " +
                         "FROM tblMeetingPost WHERE tblMemberSeq = ? " + orderBy;
            
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, userSeq);
            rs = pstat.executeQuery();
            while (rs.next()) {
                MeetingDTO dto = new MeetingDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setLocation(rs.getString("location"));
                dto.setCapacity(rs.getInt("capacity"));
                dto.setStartTime(rs.getString("startTime"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    
    // 2. 내가 작성한 글 보기 (written)
    // (여기서는 게시일(postDate) 기준 정렬 – MeetingDTO의 startTime 필드에 게시일 문자열을 저장)
    public ArrayList<MeetingDTO> getWrittenMeetings(int userSeq, String sort) {
        ArrayList<MeetingDTO> list = new ArrayList<>();
        try {
            String orderBy = "ORDER BY postDate DESC"; // 기본: 최신 게시
            switch(sort) {
                case "koreanOrder": orderBy = "ORDER BY title ASC"; break;
                case "moreCapOrder": orderBy = "ORDER BY capacity DESC"; break;
                case "lessCapOrder": orderBy = "ORDER BY capacity ASC"; break;
                case "oldestOrder": orderBy = "ORDER BY postDate ASC"; break;
            }
            String sql = "SELECT tblMeetingPostSeq, title, location, capacity, " +
                         "TO_CHAR(postDate, 'YYYY\"년 \"MM\"월 \"DD\"일\"') AS postDate " +
                         "FROM tblMeetingPost WHERE tblMemberSeq = ? " + orderBy;
            
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, userSeq);
            rs = pstat.executeQuery();
            while (rs.next()) {
                MeetingDTO dto = new MeetingDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setLocation(rs.getString("location"));
                dto.setCapacity(rs.getInt("capacity"));
                // 게시일을 startTime 필드에 저장 (DTO에 별도 필드가 없다면)
                dto.setStartTime(rs.getString("postDate"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    
    // 3. 내가 찜한 모임 보기 (wish)
    public ArrayList<MeetingDTO> getWishMeetings(int userSeq, String sort) {
        ArrayList<MeetingDTO> list = new ArrayList<>();
        try {
            String orderBy = "ORDER BY m.startTime DESC"; // 기본: 최신순
            switch(sort) {
                case "koreanOrder": orderBy = "ORDER BY m.title ASC"; break;
                case "moreCapOrder": orderBy = "ORDER BY m.capacity DESC"; break;
                case "lessCapOrder": orderBy = "ORDER BY m.capacity ASC"; break;
                case "oldestOrder": orderBy = "ORDER BY m.startTime ASC"; break;
            }
            String sql = "SELECT m.tblMeetingPostSeq, m.title, m.location, m.capacity, " +
                         "TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime " +
                         "FROM tblMeetingPost m JOIN tblWishlist w " +
                         "ON m.tblMeetingPostSeq = w.tblMeetingPostSeq " +
                         "WHERE w.tblMemberSeq = ? " + orderBy;
            
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, userSeq);
            rs = pstat.executeQuery();
            while (rs.next()) {
                MeetingDTO dto = new MeetingDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setLocation(rs.getString("location"));
                dto.setCapacity(rs.getInt("capacity"));
                dto.setStartTime(rs.getString("startTime"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    
    // 4. 내가 신청한 모임 보기 (requesting)
    public ArrayList<MeetingDTO> getRequestingMeetings(int userSeq, String sort) {
        ArrayList<MeetingDTO> list = new ArrayList<>();
        try {
            String orderBy = "ORDER BY m.startTime DESC"; // 기본: 최신순
            switch(sort) {
                case "koreanOrder": orderBy = "ORDER BY m.title ASC"; break;
                case "moreCapOrder": orderBy = "ORDER BY m.capacity DESC"; break;
                case "lessCapOrder": orderBy = "ORDER BY m.capacity ASC"; break;
                case "oldestOrder": orderBy = "ORDER BY m.startTime ASC"; break;
            }
            String sql = "SELECT m.tblMeetingPostSeq, m.title, m.location, m.capacity, " +
                         "TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime " +
                         "FROM tblMeetingPost m JOIN tblParticipationRequest pr " +
                         "ON m.tblMeetingPostSeq = pr.tblMeetingPostSeq " +
                         "WHERE pr.tblMemberSeq = ? " + orderBy;
            
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, userSeq);
            rs = pstat.executeQuery();
            while (rs.next()) {
                MeetingDTO dto = new MeetingDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setLocation(rs.getString("location"));
                dto.setCapacity(rs.getInt("capacity"));
                dto.setStartTime(rs.getString("startTime"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
    
    // 5. 내가 만든 모임 신청 보기 (requested)
    // 즉, 내가 작성한 모임 게시글 중에서 신청 받은 내역
    public ArrayList<MeetingDTO> getRequestedMeetings(int userSeq, String sort) {
        ArrayList<MeetingDTO> list = new ArrayList<>();
        try {
            // ** 수정됨: ORDER BY에서 m.startTime 대신 startTime(alias) 사용
            String orderBy = "ORDER BY startTime DESC"; // 기본: 최신순
            switch(sort) {
                case "koreanOrder": orderBy = "ORDER BY m.title ASC"; break;
                case "moreCapOrder": orderBy = "ORDER BY m.capacity DESC"; break;
                case "lessCapOrder": orderBy = "ORDER BY m.capacity ASC"; break;
                case "oldestOrder": orderBy = "ORDER BY startTime ASC"; break; // ** 수정됨: m.startTime -> startTime
            }
            String sql = "SELECT DISTINCT m.tblMeetingPostSeq, m.title, m.location, m.capacity, " +
                         "TO_CHAR(m.startTime, 'YYYY\"년 \"FMMM\"월 \"FMDD\"일\"') AS startTime " +
                         "FROM tblMeetingPost m JOIN tblParticipationRequest pr " +
                         "ON m.tblMeetingPostSeq = pr.tblMeetingPostSeq " +
                         "WHERE m.tblMemberSeq = ? " + orderBy;
            
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, userSeq);
            rs = pstat.executeQuery();
            while (rs.next()) {
                MeetingDTO dto = new MeetingDTO();
                dto.setTblMeetingPostSeq(rs.getString("tblMeetingPostSeq"));
                dto.setTitle(rs.getString("title"));
                dto.setLocation(rs.getString("location"));
                dto.setCapacity(rs.getInt("capacity"));
                dto.setStartTime(rs.getString("startTime"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }
}
