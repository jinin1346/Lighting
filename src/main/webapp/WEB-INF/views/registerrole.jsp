<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입약관</title>
    <link rel="stylesheet" href="css/lighting.css">
    
    <style>
    body {
        margin: 0;
        padding: 0;
        background-color: #fff;
        box-sizing: border-box;
    }
    
    .body {
        width: 1300px;
        height: 1700px;
        background-color: #f9f7ff;
        margin: 0 auto;
    }
    

    
    #logo1 {
        width: 250px;
    }
    
    #tx {
      /*  border: solid 1px black; */
       font-size: 30px;
       text-align: center;
    }
    
    #pic {
        margin-top: 10px;
        text-align: center;
        margin-bottom: 10px;
        
    }
    
    #button {
       border: 0px;
       border-bottom: 5px solid #1e62c8;
	   background-color: #f9f7ff;
	   width: 100px;
	   height: 50px;
	   margin-bottom: 30px;
    }
    
    #role1 {
        padding: 10px;
        font-size: 25px;
        margin: 0 auto;
        /* border: solid 1px black; */
        background: #1e62c8;
        width: 700px;
        height: 50px;
        color: #FFF;
        border-radius: 15px 15px 0 0;
        font-weight: bold;
    }
    
    #role2 {
        margin: 0 auto;
        /* border: solid 1px black; */
        background: #FFF;
        width: 700px;
        height: 300px;
        padding: 20px;
        overflow-y: auto;
    }
    
    #label1 {
        float: right;
        
    }
    
    #btn1 {
        border: solid 0px black;
        background-color: #1e62c8;
        text-align: center;
        bottom: 100px;
        width: 250px;
        height: 40px;
        color: #FFF;
    }
    
    
    
       
    </style>
</head>
<body class="body">
    <!-- registerrole.jsp -->
    <div id="div1"><img alt="" id="logo1" src="/lighting/asset/images/a.webp"></div>
    <div id="tx">회원가입을 위해 <br>아래 서비스<b>이용약관에 동의</b>해주세요.</div> 
    
    <div id="pic"><button id="button">이용약관동의<br>01</button> <button id="button">회원정보 입력<br>02</button> <button id="button">회원가입 완료<br>03</button></div>
    
    <div id="role1">이용약관</div>
    <div id="role2">
		제 1 장 총칙 <br>
		<br>
		제1조 목적 <br>
		본 약관은 (주)타임즈코어(이하 "회사"라고 함)이 제공하는 각각의 웹사이트(이하 "타임즈코어 FAMILY 사이트"이라고 함)의 <br>
		이용에 관한 제반사항 및 이용자와 회사의 권리, 의무를 규정함을 목적으로 합니다. <br>
		<br>
		제2조 용어의 정의 <br>
		(1) 타임즈코어 FAMILY 사이트: (주)타임즈코어에서 운영하는 모든 웹사이트 중 FAMILY 회원을 적용하는 아래에 열거한 웹사이트들을 지칭함.<br>
		  가. The TEEN TIMES (www.teentimes.org)<br>
		  나. The JUNIOR TIMES (www.juniortimes.co.kr)<br>
		  다. The KIDS TIMES (www.kidstimes.net)<br>
		  라. The KINDER TIMES (www.kindertimes.co.kr)<br>
		  마. The WORLD TIMES (www.worldtimes.co.kr)<br>
		  바. TIMESCAMP (www.timescamp.co.kr)<br>
		(2) 타임즈코어 FAMILY 회원: 타임즈코어 FAMILY 사이트를 통해 회원등록 절차를 거쳐 본 이용자 약관에 동의한 이용자<br>
		(3) 이용자: 타임즈코어 FAMILY 사이트에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 정회원과 준회원<br>
		(4) 준회원: 회원 가입 후 서비스를 이용하고 있지 않은 회원<br>
		(5) 서비스: 정보중개(링크) 및 그를 통해 제공되는 정보들을 제외한 온라인강의, 디지털콘텐츠, 서비스 등 타임즈코어 FAMILY 사이트에 수록된 모든 정보의 총칭<br>
		(6) 무료회원: 현재 유료 서비스를 이용하고 있지 않은 모든 회원<br>
		(7) 회원 ID: 이용자 식별과 서비스 이용을 위하여 이용자가 선정하고 회사가 부여하는 영문자 또는 숫자의 조합<br>
		(8) 비밀번호: 회원의 본인 확인과 비밀 보호를 위해 회원 자신이 설정한 문자, 숫자 또는 양자의 조합<br>
		(9) 구독일: 결제일과 별도로 회원이 구독 시작일을 설정할 수 있는 기능<br>
		(10) 할인쿠폰: 정해진 온라인 서비스에 대해 판매가의 일정금액 또는 일정비율로 할인구매할 수 있는 온-오프라인상의 인증번호<br>
    </div>
    
    <div class="btn1">
	    <label id="label1">
		  <input type="checkbox" name="agree" />
		  위 약관에 동의합니다.
		</label>
	</div>
	
	<div class="btn1"><button id="btn1">회원가입</button></div>
	    
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>
       
    </script>
</body>
</html>