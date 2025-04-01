package com.lighting.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.lighting.mypage.model.EvaluationDAO;

@WebServlet("/mypage/evaluation.do")
public class Evaluation extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1. 파라미터 받기
        int friendId = Integer.parseInt(req.getParameter("friendId"));

        // 2. DAO를 통해 평균 점수 조회
        EvaluationDAO dao = new EvaluationDAO();
        double avgScore = dao.getAverageScore(friendId); // 예: 3.8
        
        /*
         * System.out.println(avgScore);
         */
        
        // 3. JSON 응답 설정
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // 4. 결과 JSON으로 출력
        PrintWriter out = resp.getWriter();
        out.print("{\"score\":" + avgScore + "}");
        out.flush();  // 버퍼에 있는 내용을 강제로 전송
        out.close();  // 출력 스트림 닫기
    }
}
