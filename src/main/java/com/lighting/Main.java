package com.lighting;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lighting.model.MainDAO;
import com.lighting.model.MainDTO;

@WebServlet("/main.do")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
	    HttpSession session = req.getSession();
        
        //session.setAttribute("auth", "2");
        //session.setAttribute("auth", result.getTblMemberSeq());
	    
	    MainDAO dao = new MainDAO();
	    String tblMemberSeq = (String) session.getAttribute("auth");
        String categorySubSeq = null;
        
        if(tblMemberSeq != null) {
            categorySubSeq = dao.getHighestInterestCategory(tblMemberSeq);
        }
        
        List<MainDTO> meetingList;
     // 최고 관심 카테고리가 있으면 해당 카테고리 기준 조회, 없으면 전체 리스트 조회
        if (categorySubSeq != null && !categorySubSeq.trim().isEmpty()) {
            meetingList = dao.getMeetingListByCategory(categorySubSeq);
        } else {
            meetingList = dao.getMeetingList();
        }
        dao.close();
        
        req.setAttribute("meetingList", meetingList);
        req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
	}  

}