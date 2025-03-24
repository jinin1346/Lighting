<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Project</title>
<link rel="stylesheet" href="css/lighting.css">
<style>

#logo {
	position: absolute;
	left: 280px;
	top: 22px;
	width: 250px;
	height: auto;
	z-index: 3;
}

#mypage {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1563.562px;
	top: 27px;
}

#join {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1487.026px;
	top: 27px;
}

#login {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1400px;
	top: 27px;
}

.category {
	display: flex; /* 가로 정렬 */
	justify-content: center; /* 중앙 정렬 */
	gap: 90px; /* 이미지 간 간격 */
	align-items: center; /* 세로 중앙 정렬 */
	height: 57vh; /* 화면 전체 높이 기준 */
}

.category .icon-container {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.category img {
	width: 100px;
	height: auto;
}

.category .dropdown {
	display: none;
	position: fixed;
	top: 320px; /* 아이콘 아래 5px */
	left: 50%; /* 중앙 정렬 */
	transform: translateX(-50%); /* 정확한 중앙 정렬 */
	background-color: #0d0143;
	border-radius: 15px;
	padding: 10px;
	box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.2);
	opacity: 0.7; /* 약간 투명 */
	z-index: 10;
	width: 1300px; /* 드롭다운 박스 너비 */
	height: 40px;
}

/* 리스트 스타일 */
.category .dropdown ul {
	display: flex;
	gap: 15px;
	padding: 0;
	margin: 0;
	list-style: none;
	justify-content: center;
}

/* 리스트 항목 스타일 */
.category .dropdown li {
	text-align: center;
	cursor: pointer;
}

/* 링크 스타일: 흰색 글씨 + 밑줄 제거 */
.category .dropdown li a {
	color: #fff;
	text-decoration: none; /* 밑줄 제거 */
	display: block;
	text-align: top;
}

.category .dropdown li:hover {
	font-size: 21px;
	font-weight: bold;
}

/* 아이콘 hover 시 dropdown 메뉴 표시 */
.category .icon-container:hover .dropdown {
	display: block;
}

.search-container {
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	justify-content: center;
	align-items: center;
}


.search-box {
	width: 700px;
	height: 50px;
	padding: 10px 40px 10px 20px; /* 여백 조정 */
	border: none; /* 테두리 없음 */
	border-radius: 15px; /* 모서리 둥글게 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.search-button {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	background: none;
	border: none; /* 버튼 테두리 없음 */
	cursor: pointer;
}

.search-button img {
	width: 30px;
	height: 30px;
	color: rgb(13, 1, 67);
}
</style>
</head>
<body>
	<!-- register.jsp -->

	<main>
		<div class="body">
			<img alt="로고" src="images/logo_가로.png" id="logo">
			<div id="login">LOGIN</div>
			<div id="join">JOIN</div>
			<div id="mypage">MY PAGE</div>

			<div class="search-container">
				<input type="text" class="search-box" placeholder="모임을 검색해 보세요." />
				<button class="search-button">
					<img src="images/search.png" onclick="performSearch()">
				</button>
			</div>
			<div class="category">
				<div class="icon-container">
					<img src="images/맛집.png" id="car_1">
					<div class="dropdown">
						<ul>
							<li><a href="">식사</a></li>&ensp;
							<li><a href="">카페</a></li>&ensp;
							<li><a href="">디저트</a></li>&ensp;
							<li><a href="">술</a></li>&ensp;
							<li><a href="">비건</a></li>&ensp;
							<li><a href="">기타</a></li>&ensp;
						</ul>
					</div>
				</div>
				<div class="icon-container">
					<img src="images/게임.png" id="car_2">
					<div class="dropdown">
						<ul>
							<li><a href="">액션</a></li>&ensp;
							<li><a href="">어드벤처</a></li>&ensp;
							<li><a href="">롤플레잉(RPG)</a></li>&ensp;
							<li><a href="">시뮬레이션</a></li>&ensp;
							<li><a href="">전략</a></li>&ensp;
							<li><a href="">스포츠</a></li>&ensp;
							<li><a href="">퍼즐</a></li>&ensp;
							<li><a href="">아케이드</a></li>&ensp;
							<li><a href="">슈팅</a></li>&ensp;
						</ul>
					</div>
				</div>
				<div class="icon-container">
					<img src="images/문화.png" id="car_3">
					<div class="dropdown">
						<ul>
							<li><a href="">영화</a></li>&ensp;
							<li><a href="">공연</a></li>&ensp;
							<li><a href="">전시회/미술</a></li>&ensp;
							<li><a href="">노래/춤</a></li>&ensp;
							<li><a href="">언어교환</a></li>&ensp;
							<li><a href="">애니메이션</a></li>&ensp;
							<li><a href="">쇼핑</a></li>&ensp;
							<li><a href="">악기연주</a></li>&ensp;
							<li><a href="">기타</a></li>&ensp;
						</ul>
					</div>
				</div>
				<div class="icon-container">
					<img src="images/스포츠.png" id="car_4">
					<div class="dropdown">
						<ul>
							<li><a href="">배드민턴</a></li>&ensp;
							<li><a href="">탁구</a></li>&ensp;
							<li><a href="">헬스</a></li>&ensp;
							<li><a href="">주짓수</a></li>&ensp;
							<li><a href="">자전거</a></li>&ensp;
							<li><a href="">러닝</a></li>&ensp;
							<li><a href="">복싱</a></li>&ensp;
							<li><a href="">풋살</a></li>&ensp;
							<li><a href="">스쿼시</a></li>&ensp;
							<li><a href="">골프(스크린)</a></li>&ensp;
							<li><a href="">필라테스/요가</a></li>&ensp;
							<li><a href="">크로스핏</a></li>&ensp;
							<li><a href="">볼링</a></li>&ensp;
							<li><a href="">클라이밍</a></li>&ensp;
							<li><a href="">기타</a></li>&ensp;
						</ul>
					</div>
				</div>
				<div class="icon-container">
					<img src="images/자기계발.png" id="car_5">
					<div class="dropdown">
						<ul>
							<li><a href="">여행</a></li>&ensp;
							<li><a href="">드라이브</a></li>&ensp;
							<li><a href="">캠핑</a></li>&ensp;
							<li><a href="">등산</a></li>&ensp;
							<li><a href="">명상</a></li>&ensp;
							<li><a href="">반려동물</a></li>&ensp;
							<li><a href="">꽃꽃이</a></li>&ensp;
							<li><a href="">독서</a></li>&ensp;
							<li><a href="">기타</a></li>&ensp;
						</ul>
					</div>
				</div>
				<div class="icon-container">
					<img src="images/힐링.png" id="car_6">
					<div class="dropdown">
						<ul>
							<li><a href="">스터디</a></li>&ensp;
							<li><a href="">취업준비</a></li>&ensp;
							<li><a href="">모의면접</a></li>&ensp;
							<li><a href="">멘토멘티</a></li>&ensp;
							<li><a href="">독서</a></li>&ensp;
							<li><a href="">제테크</a></li>&ensp;
							<li><a href="">비즈니스</a></li>&ensp;
							<li><a href="">코딩</a></li>&ensp;
							<li><a href="">기타</a></li>&ensp;
						</ul>
					</div>
				</div>
				
				</div>

			</div>
			<!-- 메인 -->
	</main>

	<script>
		
	</script>
</body>
</html>






