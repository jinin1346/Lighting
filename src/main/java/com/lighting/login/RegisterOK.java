package com.lighting.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lighting.login.model.MemberDAO;
import com.lighting.login.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/login/registerok.do")

public class RegisterOK extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //RegisterOK.java

        
        String id = request.getParameter("id");
        String pw = multi.getParameter("pw");
        String name = multi.getParameter("name");
        String email = multi.getParameter("email");
        String pic = multi.getFilesystemName("pic");
        String intro = multi.getParameter("intro");
        
        MemberDAO dao = new MemberDAO();
        
        MemberDTO dto = new MemberDTO();
        dto.setId(id);
        dto.setPw(pw);
        dto.setName(name);
        dto.setNickname(nickname);
        dto.setEmail(email);
        dto.setPic(pic);
        dto.setIng(intro);
        
        int result = dao.addUser(dto);
        dao.close();
        
        if (result == 1) {
            resp.sendRedirect("/project/index.do");
        } else {
            PrintWriter writer = resp.getWriter();
            writer.print("""
                    <script>
                        alert('failed');
                        history.back();
                    </script>
                    """);
            writer.close();
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        
        PrintWriter writer = resp.getWriter();
        writer.print("""
                <script>
                    alert('failed');
                    history.back();
                </script>
                """);
        writer.close();
    }


    }

}