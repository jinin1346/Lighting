package com.lighting.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/evaluationok.do")
public class EvaluationOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EvaluationOk.java
		//DB 접근하기
		

		req.getRequestDispatcher("/WEB-INF/views/mypage/evaluationok.jsp").forward(req, resp);
	}

}
