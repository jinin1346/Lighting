<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입 완료</title>
	<link rel="stylesheet" href="/css/lighting.css">
	<style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        #logo {
	    position: absolute;
	    left: 330px;
	    top: 22px;
	    width: 250px;
	    height: auto;
	    cursor: pointer;
	
	   }

        #logo2 {
            width: 250px;
            margin: 30px 0;
        }

        #loginMsg {
            color: #2765c7;
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
            margin: 30px;
        }

        #btnCheck {
            width: 400px;
            background-color: #1e62c8;
            color: white;
            font-size: 1.2rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        #btnCheck:hover {
            background-color: #1e4ca0;
        }
    </style>
</head>
<body class="body">
    <img alt="로고" src="images/logo_가로.png" id="logo">
    
    <div>
        <img alt="로고" src="images/logo_세로.png" id="logo2">
        <p id="loginMsg">회원가입이 <br> 완료되었습니다.</p>
    </div>
    
    <form method="POST" action="/main.do">
        <button id="btnCheck">모임 참석하러 가기</button>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	   $('#logo', '#btnCheck').click(()=>{ 
		   window.location.href='/main.do'//메인페이지로 이동
	   });
	
	</script>
</body>
</html>