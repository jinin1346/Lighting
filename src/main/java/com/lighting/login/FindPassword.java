package com.lighting.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/findpassword.do")
public class FindPassword extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FindPassword.java
		

		req.getRequestDispatcher("/WEB-INF/views/findpassword.jsp").forward(req, resp);
	}

}
