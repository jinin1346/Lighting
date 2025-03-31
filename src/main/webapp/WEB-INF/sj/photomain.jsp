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
<title>이미지 갤러리</title>
<link rel="stylesheet" href="/webapp/css/lighting_test.css">
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
body {
	height: auto;
	background-color: #f9f7ff;
	margin: 0 auto;
	display: flex;
	font-family: 'Pretendard-Regular';
}
.container {
    max-width: 1300px;
    margin: auto;
}
.tabs {
    display: flex;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
}
.tab {
	font-size: 25px;
    margin-right: 30px;
    font-weight: bold;
    cursor: pointer;
    color: 
}
.dropdown {
    float: right;
    margin-left: 500px;
}
.gallery {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 10px;
    margin-top: 20px;
}
.gallery div {
    width: 250px;
    height: 250px;
    background-color: royalblue;
    border-radius: 8px;
}
.buttons {
    margin-top: 20px;
    display: flex;
    justify-content: flex-end;
}
.buttons button {
    margin-left: 10px;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}
.upload {
    	width: 150px;
	height: 70px;
	font-size: 25px;
	font-weight: bold;
	margin: 10px;
	background-color: #1e62c8;
	border-radius: 5px;
	border: none;
	color: #fff;
}
.share {
    background-color: lightgray;
}
</style>
</head>

<body>
	
	<div class="container">
	    <div class="tabs">
	        <div class="tab">오늘어때 이미지 갤러리</div>
	        <div class="tab" style="opacity:  0.7">내 이미지 보기</div>
	        <select class="dropdown">
	            <option>최신순</option>
	            <option>오래된 순</option>
	            <option>조회 순</option>
	        </select>
	    </div>

	    <div class="gallery">
	        <div></div> <div></div> <div></div> <div></div>
	        <div></div> <div></div> <div></div> <div></div>
	    </div>

	    <div class="buttons">
	        <button class="share">공유</button>
	        <button class="upload">이미지 올리기</button>
	    </div>
	</div>

	<script>
		// 여기에 JavaScript 추가 가능
	</script>
</body>
</html>
