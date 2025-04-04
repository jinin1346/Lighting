package com.lighting.meeting;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/meeting/read.do")
public class Read extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
        String tblMeetingPostSeq = req.getParameter("tblMeetingPostSeq");

        if (tblMeetingPostSeq == null || tblMeetingPostSeq.trim().isEmpty()) {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            writer.print("""
                    <script>
                        location.href = '/lighting/mypage/mypage.do';
                    </script>
                    """);
            writer.close();
            return;
        }
	    
        req.setAttribute("tblMeetingPostSeq", tblMeetingPostSeq);
		req.getRequestDispatcher("/WEB-INF/views/meeting/read.jsp").forward(req, resp);
	}

}
