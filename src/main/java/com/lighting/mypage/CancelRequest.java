package com.lighting.mypage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/mypage/cancelRequest.do")
public class CancelRequest extends HttpServlet {

    private DataSource getDataSource() throws NamingException {
         InitialContext ctx = new InitialContext();
         return (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
         int requestSeq = Integer.parseInt(req.getParameter("requestSeq"));
         String sql = "DELETE FROM tblParticipationRequest WHERE tblParticipationRequestSeq = ?";

         try (Connection conn = getDataSource().getConnection();
              PreparedStatement stat = conn.prepareStatement(sql)) {
              stat.setInt(1, requestSeq);
              int result = stat.executeUpdate();
              resp.setContentType("application/json;charset=UTF-8");
              if(result > 0){
                  resp.getWriter().write("{\"status\":\"success\"}");
              } else {
                  resp.getWriter().write("{\"status\":\"fail\"}");
              }
         } catch(SQLException | NamingException e){
              e.printStackTrace();
              resp.setContentType("application/json;charset=UTF-8");
              resp.getWriter().write("{\"status\":\"error\"}");
         }
    }
}
