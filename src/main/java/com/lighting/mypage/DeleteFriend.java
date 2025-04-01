package com.lighting.mypage;

import com.lighting.mypage.model.FriendDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/mypage/deletefriend.do")
public class DeleteFriend extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 여기서는 테스트로 사용자 번호를 1로 고정합니다.
        int userSeq = 1;
        
        // Ajax 요청으로 전달된 friendId 파라미터를 가져옵니다.
        int friendId = Integer.parseInt(req.getParameter("friendId"));
        
        FriendDAO friendDAO = new FriendDAO();
        boolean result = friendDAO.deleteFriend(userSeq, friendId);
        
        resp.setContentType("application/json;charset=UTF-8");
        if(result) {
            resp.getWriter().write("{\"status\":\"success\"}");
        } else {
            resp.getWriter().write("{\"status\":\"fail\"}");
        }
    }
}
