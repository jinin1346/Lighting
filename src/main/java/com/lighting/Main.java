package com.lighting;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.model.MainDAO;
import com.lighting.model.MainDTO;

@WebServlet("/main.do")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    MainDAO dao = new MainDAO();
        List<MainDTO> meetingList = dao.getMeetingList();
        req.setAttribute("meetingList", meetingList);
        
        
		req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
	}  

}