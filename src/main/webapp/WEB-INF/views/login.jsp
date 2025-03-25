<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="css/lighting.css">

<style>


#logo1 {
	width: 150px;
	
}

#logo2 {
	width: 200px;
}

#div1 { /*  border: 1px solid black; */
	height: 10vh;  
	
}

.div2 {
	display: flex;
	align-items: center;
	height: 90vh;
}

div>input {
	border-radius: 5px;
	width: 300px;
	height: 30px;
	margin-bottom: 10px;
	font-size: 13px;
	padding: 5px;
}

button {
	border-radius: 5px;
	width: 300px;
	height: 30px;
	background: rgb(29, 99, 202);
	border: none;
	margin-top: 10px;
	color: #FFF;
}

form {
	/* border: 1px solid red; */
	margin: auto;
}

.a {
	font-size: 13px;
	text-align: center;
}

h3 {
	margin-bottom: 5px;
	margin-left: 15px;
	padding: 4px;
}


</style>
</head>
<body>

	<div class="body">
			<div id="div1">
				<img alt="" id="logo1"  src="images/logo_가로.png">
			</div>
			<div>
				<div class="div2">
					<form>
						<div style="text-align: center;">
							<img alt="" id="logo2" src="images/logo_세로.png">
						</div>
						<h3>로그인</h3>
						<div>
							<input type="text" placeholder="아이디">
						</div>
						<div>
							<input type="password" placeholder="비밀번호(영문, 숫자, 특수문자 포함 8 ~ 20자)">
						</div>
		
						<div class="a">
							<a>회원가입</a>
							 | 
							 <a>아이디 찾기</a>
							 | 
							  <a>비밀번호 찾기</a>
						</div>
						<button>로그인</button>
					</form>
				</div>
			</div>
	</div>
</body>



<%@include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	
</script>
</body>
</html>