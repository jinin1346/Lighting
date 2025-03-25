<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<%@include file="/WEB-INF/views/inc/asset.jsp"%>
	<link rel="stylesheet" href="">
	
	<style>
	#logo1 { width: 150px;}
    #logo2 { width: 200px;}
    .div2 { /* border: 1px solid black;  */
            display: flex; 
            align-items: center;  
            height: 100vh;       
            
    }
    div > input {
        border-radius: 5px; width: 300px; height: 30px; margin-bottom: 10px; font-size: 13px; padding: 5px;
    }
    button { border-radius: 5px; width: 300px; height: 30px; background: rgb(29,99,202); border: none; margin-top: 10px; color: #FFF;}
    form {
        /* border: 1px solid red; */
        margin: auto; 
    }
    .a { font-size: 13px; text-align: center; }
	</style>
</head>
<body style="background: rgb(249,248,255);">
    <div id="div1"><img alt="" id="logo1" src="/lighting/asset/images/a.webp"></div>
    <div>
        <div class="div2">
            <form>
            <div style="text-align: center;"><img alt="" id="logo2" src="/lighting/asset/images/b.webp"></div>
            <h3>로그인</h3>
            <div><input type="text" placeholder="아이디"></div>
            <div><input type="password" placeholder="비밀번호(영문, 숫자, 특수문자 포함 8 ~ 20자)"></div>
    
            <div class="a"><a>회원가입</a> | <a>아이디 찾기</a> | <a>비밀번호 찾기</a></div>
            <button>로그인</button>
            
            </form>
        </div>
    </div>
</body>
    


<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<script>
		
	</script>
</body>
</html>