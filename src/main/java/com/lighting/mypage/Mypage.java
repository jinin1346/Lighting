package com.lighting.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mypage/mypage.do")
public class Mypage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String status = (String) session.getAttribute("status");

        if (status == null){
            session.setAttribute("status", "joined");
        } 

		req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(req, resp);
	}

}
