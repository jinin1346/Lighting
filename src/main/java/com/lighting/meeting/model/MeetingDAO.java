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

import com.lighting.meeting.MySetScoreImage;

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
                MySetScoreImage temp = new MySetScoreImage();
                dto.setScoreImage(temp.mySetScoreImage(dto.getScore()));
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
                dto.setEndTime(rs.getString("EndTime"));
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
            
            String sql = """
    select 
        b.tblMemberSeq as tblMemberSeq,
        b.nickname as nickname,
        b.photoFileName as photoFileName,
        (select nvl(avg(score), 0) as score from tblEvaluation where evaluatedMemberSeq = b.tblMemberSeq) as score
    from tblParticipationRequest a 
        join tblMember b on a.tblMemberSeq = b.tblMemberSeq 
            where a.tblMeetingPostSeq = ? and a.approvalStatus = 'Y'
            """;
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, tblMeetingPostSeq);
            
            rs = pstat.executeQuery();
            
            while (rs.next()) {
                MemberDTO dto = new MemberDTO();
                dto.setTblMemberSeq(rs.getString("TblMemberSeq"));
                dto.setPhotoFileName(rs.getString("photoFileName"));
                dto.setNickname(rs.getString("Nickname"));
                dto.setScore(rs.getString("score"));
                
                MySetScoreImage temp = new MySetScoreImage();
                dto.setScoreImage(temp.mySetScoreImage(dto.getScore()));
                
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

    public int getWish(WishlistDTO dto) {
        
        try {
            
            String sql = "select count(*) as cnt from tblWishlist where tblMemberSeq = ? and tblMeetingPostSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMemberSeq());
            pstat.setString(2, dto.getTblMeetingPostSeq());
            
            rs = pstat.executeQuery();
            int result = 0;
            
            if (rs.next()) {
                result = Integer.parseInt(rs.getString("cnt"));
            }
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int addParticipationRequest(ParticipationRequestDTO dto) {
        
        try {
            
            String sql = "";
            
            sql = "insert into tblParticipationRequest values (seqParticipationRequest.nextVal, ?, ?, null)";
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMeetingPostSeq());
            pstat.setString(2, dto.getTblMemberSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int getParticipationRequest(ParticipationRequestDTO dto) {
        
            try {
            
            String sql = "select count(*) as cnt from tblParticipationRequest where tblMemberSeq = ? and tblMeetingPostSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMemberSeq());
            pstat.setString(2, dto.getTblMeetingPostSeq());
            
            rs = pstat.executeQuery();
            int result = 0;
            
            if (rs.next()) {
                result = Integer.parseInt(rs.getString("cnt"));
            }
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int delete(String tblMeetingPostSeq) {
        
        try {
            //글에 해당하는 좌표 지우기(자식레코드)
            String sql = "delete from tblLocationCoordinate where tblMeetingPostseq = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, tblMeetingPostSeq);
            
            int result = pstat.executeUpdate();
            if(result != 0) {
                
                sql = "delete from tblMeetingPost where tblMeetingPostSeq = ?";
                
                pstat = conn.prepareStatement(sql);
                pstat.setString(1, tblMeetingPostSeq);
                //글 지우기
                return pstat.executeUpdate();
                
            } else {
                
                System.err.println("삭제 실패!!");
            }
            
            return 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public MemberDTO getMemberInfo(MemberDTO dto) {
        
        try {
            
            String sql = """
                    select (select nvl(round(avg(score), 1), 0) as score from tblEvaluation where evaluatedMemberSeq = ?) as score, nickname, sido, gugun, photoFileName 
    from tblMember a join tblActivityRegion b on a.tblMemberSeq = b.tblMemberSeq 
        join tblActivityRegionCoordinate c on b.tblActivityRegionCoordinateSeq = c.tblActivityRegionCoordinateSeq
            where a.tblMemberSeq = ?
                    """;
            
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getTblMemberSeq());
            pstat.setString(2, dto.getTblMemberSeq());
            
            rs = pstat.executeQuery();
            
            if(rs.next()) {
                dto.setScore(rs.getString("score"));
                dto.setNickname(rs.getString("nickname"));
                dto.setSido(rs.getString("sido"));
                dto.setGugun(rs.getString("gugun"));
                dto.setPhotoFileName(rs.getString("photoFileName"));
            }
            
            return dto;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }

    public int getFriendRequest(FriendRequestDTO dto) {
        
        try {
            
            int cnt = 0;
            String sql = "select count(*) as cnt from tblFriendRequest where requestingMemberSeq = ? and requestedMemberSeq = ?";
            //첫번째 쿼리 내가 신청할 사람이 이미 나에게 신청 했는지?
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getRequestedMemberSeq());    //신청받은 사람
            pstat.setString(2, dto.getRequestingMemberSeq());   //신청한 사람
            
            rs = pstat.executeQuery();
            
            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }
            
            if (cnt == 1) {//상대가 이미 나에게 신청함
                return 1;
            }
            
            sql = "select * from tblFriendRequest where requestingMemberSeq = ? and requestedMemberSeq = ?";
            pstat = conn.prepareStatement(sql);
            
            pstat.setString(1, dto.getRequestingMemberSeq());   //신청한 사람
            pstat.setString(2, dto.getRequestedMemberSeq());    //신청받은 사람
            
            rs = pstat.executeQuery();
            String approvalStatus;
            
            
            if (rs.next()) {
                //레코드가 있음
                approvalStatus = rs.getString("approvalStatus");
                
                if (approvalStatus == null) {//대기중
                    return 2;
                } else if (approvalStatus.equals("Y")) {//이미 친구
                    return 3;
                } else if (approvalStatus.equals("N")) {//거절 당함
                    return 4;
                }
                
            } else {//레코드가 없음 >> 상대가 나에게 신청X, 내가 상대에게 신청X
                return 5;
            }
            
            return 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int addFriendRequest(FriendRequestDTO dto) {
        
        try {
            String sql = "insert into tblFriendRequest values (seqFriendRequest.nextVal, ?, ?, null)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getRequestingMemberSeq());
            pstat.setString(2, dto.getRequestedMemberSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
        
    }

    public int getBlockList(BlockListDTO dto) {
        
        int result = 0;
        
        try {
            String sql = "select * from tblBlockList where blockerMemberSeq = ? and blockedMemberSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getBlockerMemberSeq());
            pstat.setString(2, dto.getBlockedMemberSeq());

            rs = pstat.executeQuery();
            
            if (rs.next()) {
                result = 1;
            }
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    public int addBlockList(BlockListDTO dto) {
        
        try {
            String sql = "insert into tblBlockList values(?, ?, default)";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getBlockerMemberSeq());
            pstat.setString(2, dto.getBlockedMemberSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    public int deleteBlockList(BlockListDTO dto) {
        
        try {
            String sql = "delete from tblBlockList where blockerMemberSeq = ? and blockedMemberSeq = ?";
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getBlockerMemberSeq());
            pstat.setString(2, dto.getBlockedMemberSeq());
            
            return pstat.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }

    
}

























