package com.lighting.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/updateopenpublic.do")
public class UpdateOpenPublic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //UpdateOpenStatus.java
        

        req.getRequestDispatcher("/WEB-INF/views/mypage/updateopenpublic.jsp").forward(req, resp);
    }
}
