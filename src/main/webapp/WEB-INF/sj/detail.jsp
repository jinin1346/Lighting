<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<title>Detail</title>
<link rel="stylesheet" href="css/lighting_test.css">
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
	width: 1300px;
	margin: 0 auto;
	background-color: #f9f7ff;
}

.body {
	width: 1300px;
	height: auto;
	display: flex;
	flex-direction: row; /* 가로 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가운데 정렬 */
}

#leader {
	margin: 10px;
	border: 3px solid #1e62c8;
	border-radius: 15px;
	width: 200px;
	height: 220px;
	text-align: center;
}

#title {
	margin-top: 10px;
	color: #0d0143;
}

#leader img {
	width: 80px;
	margin-top: 5px;
}

#leader p img {
	width: 20px;
	margin-right: 5px;
}

#leader p {
	color: #0d0143;
	font-weight: bold;
	padding: 0;
}

#main_img {
	width: 950px;
	height: auto;
}

#back {
	width: 120px;
	height: 40px;
	color: #fff;
	background-color: #1e62c8;
	border-radius: 5px;
	border: none;
	font-size: 18px; position : relative;
	bottom: 85px;
	left: 15px;
	position: relative;
}

#arrow {
	width: 20px;
	height: auto;
	margin-right: 8px;
}

#maintitle {
	margin-left: 240px;
	color: #0d0143;
	padding-bottom: 7px;
}

#subtitle {
	margin-left: 240px;
	color: #666;
}

#subtitle_2 {
	color: #666;
	position: relative;
	bottom: 70px;
	margin-left: 1030px;
}

#textbox {
	margin: 15px;
	width: 500px;
	height: auto;
	position: relative;
	left: 240px;
	white-space: pre-line;
}

#map {
	width: 300px;
	height: 300px;
	border: 1px solid #0d0143;
	position: relative;
	bottom: 320px;
	left: 850px;
	text-align: center;
}

#Participation {
	width: 910px;
	height: 70px;
	position: relative;
	border: 1px solid #0d0143;
	bottom: 200px;
	left: 250px;
	display: flex; /* flex 적용 */
	flex-direction: row; /* 가로 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}

.Participants {
	width: 50px;
	height: auto;
	margin: 15px;
}

h3 {
	position: relative;
	bottom: 210px;
	left: 260px;
	color: #0d0143;
}

#Participants_arrow {
	align-items: flex-end;
	margin-left: 630px;
	opacity: 0.3;
	width: 25px;
}

#participate {
	position: fixed;
	bottom: 25px;
	right: 25px;
	
}

#Steaming {
	width: 40px;
	position: absolute;
	bottom: 21px;
	left: -50px;
	cursor: pointer;
}

#share {
width: 60px;
height : 40px;
background-color: #1e62c8;
	border-radius: 5px;
	border: none;
	color: #fff;
	
}

#Join_button {
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

#delete {
width : 70px;
height: 40px;
	position: fixed;
	bottom: 20px;
	left: 20px;
	border-radius: 5px;
	border: none;
	color: #fff;
	background-color: #c81e1e;
}
</style>
</head>
<body>

	<div class="body">
		<!-- 1.모임장 -->
		<div id="leader">
			<h1 id="title">모임장</h1>
			<img alt="프로필이미지" src="./images/icon.png" id="Profile">
			<p>
				<img alt="등급" src="./images/마스터.png">홍길동
			</p>
			<p>
				<img alt="등급" src="./images/별점.png">4.2점
			</p>
		</div>

		<!-- 2. 메인이미지 -->
		<img alt="메인이미지" src="./images/맛집.png" id="main_img">

		<!-- 3. 돌아가기 -->
		<input type="button" id="back" value="이전 화면">
	</div>

	<!-- 4. 제목 & 타이틀 -->
	<div>
		<h1 id="maintitle">4월 3일 역삼에서 삼겹살 드실 3명 구해봅니다!</h1>
		<h2 id="subtitle">장소 : 서울 / 강남구&ensp;&ensp;&ensp;시간 : 4월 3일 19:00</h2>
		<h2 id="subtitle_2">모집인원 : 3명</h2>
	</div>

	<div id="textbox">
		<p>🆕노는게 제일 좋은 뽀로로들의 모임🆕 🫧텃새 절대 없는 따듯하고 젠틀한 모임입니다
		🫧신입분들 적응
			어렵지않도록 잘 챙겨드려요😊 🫧단순 술만 아닌,맛집,카페,운동,문화생활도 함께 해요 ✅가입 후 가입인사 즉시 작성해주세요
			:) ✅가입인사 삭제될 시 자진탈퇴 부탁드립니다 ✅고품격 원앤온리 프리미엄 모임을 위해 외모는 조금 볼게요😉 ✅오픈채팅방
			필참으로 운영되는 모임입니다 🎄뽀로로 자격요건🎄 -인성, 외모 자기관리 하시는 분 -남자 키 173cm, 여자 키
			155cm 이상</p>
	</div>
	<!-- textbox -->

	<div id="map">지도</div>
	<!-- map -->

	<h3>모임 참여자</h3>
	<div id="Participation">
		<img alt="프로필이미지" src="./images/icon.png" class="Participants">
		<img alt="프로필이미지" src="./images/icon.png" class="Participants">
		<img alt="프로필이미지" src="./images/icon.png" class="Participants">
		<img alt="화살표" src="./images/arrow.png" id="Participants_arrow">
	</div>
	<!-- Participation -->

	<a href="#"><button type="button" id="delete">모임삭제</button></a>

	<div id="participate">
		<img alt="찜하기" src="./images/찜하기전버튼.png" id="Steaming"
			onclick="toggleImage()">
		<!-- <img alt="찜하기" src="./images/찜하기버튼.png" class="Steaming" onclick="toggleImage()"> -->
		<button type="button" id="share">공유</button>
		<button type="button" id="Join_button">참석신청</button>
	</div>
	<!-- participate -->
	<script>
		function toggleImage() {
			const img = document.getElementById("Steaming");
			// getAttribute로 실제 지정한 src 값을 가져옴
			if (img.getAttribute("src") === "./images/찜하기전버튼.png") {
				img.setAttribute("src", "./images/찜하기버튼.png");
			} else {
				img.setAttribute("src", "./images/찜하기전버튼.png");
			}
		}
	</script>

</body>
</html>
