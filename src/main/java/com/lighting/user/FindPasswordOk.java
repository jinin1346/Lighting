package com.lighting.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/findpasswordok.do")
public class FindPasswordOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		

		req.getRequestDispatcher("/WEB-INF/views/user/findpasswordok.jsp").forward(req, resp);
	}

}
