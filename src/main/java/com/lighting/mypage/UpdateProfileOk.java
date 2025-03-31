package com.lighting.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/updateprofileok.do")
public class UpdateProfileOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		resp.setContentType("text/html");
	    PrintWriter out = resp.getWriter();
	    out.println("<script type='text/javascript'>");
//	    결과에 따라 피드백
	    out.println("alert('complete');");
//	    
	    out.println("window.close();");
	    out.println("</script>");
	    out.close();
	}

}
