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
<link rel="stylesheet" href="css/lighting.css">

<style>

 body {
/*     height: 100%; /* 전체 화면 높이를 사용 */
    margin: 0;
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */ */
}

#logo1 {
    width: 150px;
	float: left; 
    
}
#logo2 {
    width: 250px;
    padding: 10px;
}

#div1 {
    height: 10vh;
    text-align: center;
}
.div2 {
    display: flex;
    flex-direction: column;
    align-items: center; /* 세로 중앙 정렬 */
    justify-content: center;
    height: 90vh;
    max-width: 500px; /* 폼의 최대 너비 설정 */
    /* width: 100%; */ /* 부모 너비에 맞게 확장 */
    /* border: 1px solid black; */
    margin-left: auto;
    margin-right: auto;
}

div > input {
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
    text-align: center;
    padding: 20px;
    box-sizing: border-box;
    border-radius: 8px;
    width: 100%; /* 폼 너비를 100%로 설정 */
}

.a {
    font-size: 13px;
    text-align: center;
    
}



h3 {
	text-align: left;
	 margin-left: 80px;
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
                        <a href="registerrole.do">회원가입</a>
                         | 
                         <a href="findid.do">아이디 찾기</a>
                         | 
                          <a href="findpassword.do">비밀번호 찾기</a>
                    </div>
                    <button type="submit">로그인</button>
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
