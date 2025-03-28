package com.dummy.move;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/holdMeeting.do")
public class HoldMeeting extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//HoldMeeting.java
		

		req.getRequestDispatcher("/WEB-INF/views/holdMeeting.jsp").forward(req, resp);
	}

}

