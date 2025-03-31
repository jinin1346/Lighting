package com.lighting.meeting;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/meeting/addok.do")
public class AddOk extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        // 수정된 부분: ServletContext를 사용하여 실제 경로를 얻음
        ServletContext application = req.getServletContext();
        String saveDirectory = application.getRealPath("/images"); // 파일 저장 경로 (webapp/images)

        System.out.println(saveDirectory);
        
        int maxPostSize = 1024 * 1024 * 10; // 10MB
        String encoding = "UTF-8";
        DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

        MultipartRequest multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, policy);

        String photoFileName = multi.getFilesystemName("photoFileName"); // 서버에 저장된 파일 이름
        File file = multi.getFile("photoFileName"); // File 객체

        // 1. 폼 데이터 받기
        String tblCategorySubSeq = multi.getParameter("tblCategorySubSeq");
        String title = multi.getParameter("title");
        String date = multi.getParameter("date");
        String time = multi.getParameter("time");
        String startTime = date + " " + time;
        String capacity = multi.getParameter("capacity");
        String location = multi.getParameter("location");
        String latitude = multi.getParameter("latitude");
        String longitude = multi.getParameter("longitude");
        String content = multi.getParameter("content");
        String tblMemberSeq = multi.getParameter("tblMemberSeq");

        // 2. 받은 데이터 확인 (콘솔 출력)
        System.out.println("tblCategorySubSeq: " + tblCategorySubSeq);
        System.out.println("title: " + title);
        System.out.println("startTime: " + startTime);
        System.out.println("capacity: " + capacity);
        System.out.println("location: " + location);
        System.out.println("latitude: " + latitude);
        System.out.println("longitude: " + longitude);
        System.out.println("content: " + content);
        System.out.println("tblMemberSeq: " + tblMemberSeq);
        System.out.println("photoFileName: " + photoFileName);

        req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
    }

}
