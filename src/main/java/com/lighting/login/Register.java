package com.lighting.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.login.model.MemberDTO;

@WebServlet("/login/register.do")

public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        


        req.getRequestDispatcher("/WEB-INF/views/login/register.jsp").forward(req, resp);

    }

}