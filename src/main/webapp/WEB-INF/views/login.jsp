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


 body {
/*     height: 100%; /* 전체 화면 높이를 사용 */
    margin: 0;
    /* display: flex; */
    /* justify-content: center; */ /* 가로 중앙 정렬 */
    /* align-items: center; */ /* 세로 중앙 정렬 */ */
}

.body {
    margin: 0 auto;
}

#logo1 {
    width: 150px;
    
}

#logo2 {
    width: 250px;
    padding: 10px;
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
    border: none;
    margin-top: 10px;
    margin-left: 5px;
    color: #FFF;
    background: rgb(29, 99, 202);
    
    
   
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
                            <a href="registerrole.do">회원가입</a>
                             | 
                             <a href="findid.do">아이디 찾기</a>
                             | 
                              <a href="findpassword.do">비밀번호 찾기</a>
                        </div>
                        <button>로그인</button>
                    </form>
                </div>
            </div>
    </div>

    <%@include file="/WEB-INF/views/inc/footer.jsp"%>	
</body>


<script>
    
</script>
</body>
</html>