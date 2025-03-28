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
        
        int MemSeq = 0; // insert 한  회원 시퀀스를 저장
        System.out.println("check");
        try {
            
            String sql = "insert into tblMember (tblMemberSeq, id, pw, name, nickname,birthday,tel,email,gender,photoFileName,registrationDate,status) values (seqMember.nextVal,?, ?, ?, ?, ?, ?, ?, ?,'basicProfile.png',default, default)";
            
            //String sql = "insert into tblMember (tblMemberSeq, id, pw, name, nickname, birthday, tel, email, gender, photoFileName, registrationDate, status) values (seqMember.nextVal, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?,'basicProfile.png', default, default)";
            
            String birthday = dto.getBirthday();
            
            birthday = birthday.substring(0,4) + "-" + birthday.substring(4,6) + "-" + birthday.substring(6);
            System.out.println(birthday);
            
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());
            pstat.setString(3, dto.getName());
            pstat.setString(4, dto.getNickname());
            // YYYY MM DD
            // 0123 45 67
            pstat.setString(5, birthday);
            pstat.setString(6, dto.getTel());
            pstat.setString(7, dto.getEmail());
            pstat.setString(8, dto.getGender());
            System.out.println(11);
            // 회원 정보를 삽입하고, 삽입된 행의 수 반환
            int result = pstat.executeUpdate();
            System.out.println(11);
            
            // 정상삽입 되면
            if(result > 0) {
                //최근 넣은 tblMemberSeq
                String sql2 = "select max(tblMemberSeq) as maxSeq from tblMember";
                pstat = conn.prepareStatement(sql2);
                rs = pstat.executeQuery();
                if(rs.next()){
                    MemSeq = rs.getInt("maxSeq");
                }
            }
            return MemSeq;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    
    
    public int addActivityRegionCoordinate(MemberDTO memberDto) {
        int JusoSeq = 0;
        try {
            String sql = "select tblActivityRegionCoordinateSeq from tblActivityRegionCoordinate where sido = ? and gugun = ?";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, memberDto.getSido());     // "서울특별시"
            pstat.setString(2, memberDto.getGugun());   // "강남구"
            System.out.println(123);
            rs = pstat.executeQuery();
            System.out.println(1234);
            if (rs.next()) {
                JusoSeq = rs.getInt("tblActivityRegionCoordinateSeq");
                System.out.println(JusoSeq);
            }System.out.println(JusoSeq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JusoSeq;
        
    }

    
    
    public void close() {
        try {
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public MemberDTO login(MemberDTO dto) {

        try {

            String sql = "select * from tblMember where id =? and pw = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());

            rs = pstat.executeQuery();

            if (rs.next()) {
                //로그인 성공
                MemberDTO result = new MemberDTO();

                result.setId(rs.getString("id"));
                result.setName(rs.getString("name"));

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
