package com.dummy.move;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/attendMeeting.do")
public class AttendMeeting extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttendMeeting.java
		

		req.getRequestDispatcher("/WEB-INF/views/attendMeeting.jsp").forward(req, resp);
	}

}
