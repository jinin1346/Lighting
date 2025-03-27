package com.lighting.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteaccount.do")
public class DeleteAccount extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DeleteAccount.java
		

		req.getRequestDispatcher("/WEB-INF/views/deleteaccount.jsp").forward(req, resp);
	}

}

