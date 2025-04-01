package com.lighting.mypage;

import com.lighting.mypage.model.BlockDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/mypage/unblock.do")
public class UnblockFriend extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userSeq = 1; // 실제 로그인 사용자는 세션에서 가져올 것
        int blockedId = Integer.parseInt(req.getParameter("blockedId"));

        /*
         * System.out.println("🚨 unblock.do 호출됨"); System.out.println("➡️ userSeq: " +
         * userSeq + ", blockedId: " + blockedId);
         */

        BlockDAO dao = new BlockDAO();
        boolean result = dao.unblockUser(userSeq, blockedId);

        /*
         * System.out.println("🔄 DAO 처리 결과: " + result);
         */
        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write("{\"status\":\"" + (result ? "success" : "fail") + "\"}");
    }
}