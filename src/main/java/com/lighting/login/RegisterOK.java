package com.lighting.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lighting.login.model.MemberDAO;
import com.lighting.login.model.MemberDTO;

@WebServlet("/login/registerok.do")
public class RegisterOK extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 인코딩 설정
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        try {
            // 폼에서 전달된 파라미터 읽기 
            String id = req.getParameter("id");
            String pw = req.getParameter("pw");
            String name = req.getParameter("name");
            String nickname = req.getParameter("nickname");
            String birthday = req.getParameter("birthday");
            String tel = req.getParameter("tel");
            String email = req.getParameter("email");
            String gender = req.getParameter("gender");


            // DTO 객체에 값 설정
            MemberDTO dto = new MemberDTO();
            dto.setId(id);
            dto.setPw(pw);
            dto.setName(name);
            dto.setNickname(nickname);
            dto.setNickname(birthday);
            dto.setTel(tel);
            dto.setEmail(email);
            dto.setGender(gender);

            // DAO를 통한 회원 가입 처리
            MemberDAO dao = new MemberDAO();
            int result = dao.addMember(dto);
            dao.close();

            // 처리 결과에 따른 리다이렉트 및 응답
            if (result == 1) {
                resp.sendRedirect("/project/index.do");
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
