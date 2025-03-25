package com.lighting.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerrole.do")
public class RegisterRole extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //RegisterRole.java
        

        req.getRequestDispatcher("/WEB-INF/views/registerrole.jsp").forward(req, resp);
    }

}
