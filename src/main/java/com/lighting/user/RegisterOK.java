package com.lighting.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.user.model.MemberDTO;
import com.lighting.user.model.UserDAO;

import lombok.Getter;
import lombok.Setter;


@WebServlet("/login/registerok.do")
public class RegisterOK extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    	/*인코딩 설정*/
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        try {
            // 회원 정보 파라미터 읽기
            String id = req.getParameter("id");
        /*    System.out.println(id);*/
            String pw = req.getParameter("pw");
            String name = req.getParameter("name");
            String nickname = req.getParameter("nickname");
            String birthday = req.getParameter("birthday");
            String tel = req.getParameter("tel");
            String email = req.getParameter("email");
            String gender = req.getParameter("gender");
/*            String city = req.getParameter("city");
            String district = req.getParameter("district");*/
            

          /*  System.out.println(birthday);*/
            
            try {
                // 회원 정보 DTO에 값 설정
                MemberDTO memberDto = new MemberDTO();
                memberDto.setId(id);
                memberDto.setPw(pw);
                memberDto.setName(name);
                memberDto.setNickname(nickname);
                memberDto.setBirthday(birthday);
                memberDto.setTel(tel);
                memberDto.setEmail(email);
                memberDto.setGender(gender);
				/*
				 * memberDto.setSido(city); memberDto.setGugun(district);
				 */ 

				
				 UserDAO userDAO = new UserDAO(); 
				 
                // 아이디 중복 검사
                if (userDAO.isDuplicateId(id)) {
                    PrintWriter writer = resp.getWriter();
                    writer.print("<script>alert('중복된 아이디입니다. 다른 아이디를 선택해 주세요.'); history.back();</script>");
                    writer.close();
                    return;
                }

                // 회원정보 저장
                int memberSeq = userDAO.addMember(memberDto);  // 회원 정보 추가

				/*
				 * // 사진 정보를 추가하는 부분 (예시) PhotoDAO photoDAO = new PhotoDAO(); if (photoUrl !=
				 * null && !photoUrl.isEmpty()) { photoDAO.addPhoto(memberSeq, photoUrl); // 사진
				 * URL을 추가 }
				 */
                
                // DAO 자원 해제
                userDAO.close();
				/* photoDAO.close(); */
                

                // 회원가입 성공 여부에 따른 처리
                if (memberSeq > 0) {
                    resp.sendRedirect("/lighting/user/registerfinish.jsp");  // 회원가입 성공 후, 완료 페이지로 리다이렉트
                } else {
                    PrintWriter writer = resp.getWriter();
                    writer.print("<script>alert('회원가입에 실패했습니다.'); history.back();</script>");
                    writer.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
                PrintWriter writer = resp.getWriter();
                writer.print("<script>alert('회원가입 처리 중 오류가 발생했습니다.'); history.back();</script>");
                writer.close();
            }
        } finally {
        	//자원 해제
    }
    }
    // 아이디 유효성 검사 메서드
    private boolean isValidId(String id) {
        // 정규 표현식: ^[a-zA-Z0-9_]{4,20}$ (영문, 숫자, _만 가능, 4자 ~ 20자)
        return id != null && id.matches("^[a-zA-Z0-9_]{4,20}$");
    }
    
    
}