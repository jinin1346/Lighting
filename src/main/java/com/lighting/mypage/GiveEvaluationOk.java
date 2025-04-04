package com.lighting.mypage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet("/mypage/evaluationok.do")
public class GiveEvaluationOk extends HttpServlet {
    private DataSource getDataSource() throws NamingException {
        InitialContext ctx = new InitialContext();
        return (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int meetingSeq = Integer.parseInt(req.getParameter("meetingSeq"));
        int count = Integer.parseInt(req.getParameter("evaluationCount"));
        HttpSession session = req.getSession();
        int evaluator = session.getAttribute("userSeq") != null ? (Integer) session.getAttribute("userSeq") : 1;

        try (Connection conn = getDataSource().getConnection();
             PreparedStatement pstat = conn.prepareStatement(
                 "INSERT INTO tblEvaluation (tblMeetingSeq, evaluatorMemberSeq, evaluatedMemberSeq, score) VALUES (?, ?, ?, ?)")
        ) {
            for (int i = 0; i < count; i++) {
                String scoreStr = req.getParameter("rating_" + i);
                String userId = req.getParameter("userId_" + i);
                if (scoreStr == null || userId == null) continue;

                int score = Integer.parseInt(scoreStr);
                int targetSeq = getMemberSeqById(userId, conn);
                if (targetSeq == -1) continue;

                pstat.setInt(1, meetingSeq);
                pstat.setInt(2, evaluator);
                pstat.setInt(3, targetSeq);
                pstat.setInt(4, score);
                pstat.addBatch();
                

            }
            pstat.executeBatch();
            /*
             * resp.sendRedirect(req.getContextPath() + "/mypage/mypage.do?status=joined");
             */
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{\"result\":\"success\"}");
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("DB 오류 발생: " + e.getMessage());
        }
    }

    private int getMemberSeqById(String id, Connection conn) throws SQLException {
        String sql = "SELECT tblMemberSeq FROM tblMember WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next() ? rs.getInt("tblMemberSeq") : -1;
        }
    }
}