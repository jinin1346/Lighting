package com.lighting.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/updatepassword.do")
public class UpdatePassword extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		

		req.getRequestDispatcher("/WEB-INF/views/mypage/updatepassword.jsp").forward(req, resp);
	}

}
