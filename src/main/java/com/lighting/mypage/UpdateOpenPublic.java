package com.lighting.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.mypage.model.MemberDAO;

@WebServlet("/mypage/updateopenpublic.do")
public class UpdateOpenPublic extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userSeq = 1; // 로그인 구현 시 세션에서 받아오기
        String statusStr = req.getParameter("status");
        
        if (statusStr == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        int status = Integer.parseInt(statusStr);

        MemberDAO dao = new MemberDAO();
        int result = dao.updatePublicStatus(userSeq, status);

        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = resp.getWriter();
        if (result == 1) {
            writer.println("<script>alert('공개 여부가 성공적으로 변경되었습니다.'); window.close(); </script>");
        } else {
            writer.println("<script>alert('공개 여부 변경에 실패했습니다.'); history.back();</script>");
        }
        writer.close();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.getRequestDispatcher("/WEB-INF/views/mypage/updateopenpublic.jsp").forward(req, resp);
    }
}