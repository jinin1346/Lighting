package com.lighting.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.user.model.UserDAO;
import com.lighting.user.model.UserDTO;

@WebServlet("/user/registerok.do")
public class RegisterOK extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RegisterOK.java
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
		
		
		try {
			// 회원 정보 파라미터 읽기
            String id = req.getParameter("id");
            String pw = req.getParameter("pw");
            String name = req.getParameter("name");
            String nickname = req.getParameter("nickname");
            String birthday = req.getParameter("birthday");
            String tel = req.getParameter("tel");
            String email = req.getParameter("email");
            String gender = req.getParameter("gender");
/*            String city = req.getParameter("city");
            String district = req.getParameter("district");*/
            
            UserDAO dao=new UserDAO();
            
            UserDTO dto= new UserDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setNickname(nickname);
			dto.setTel(tel);
			dto.setEmail(email);
			dto.setGender(gender);
			
			int result=dao.addUser(dto);
			dao.close();
			
			if (result==1) {
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

				


	}

}
