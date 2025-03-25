<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Project</title>
<link rel="stylesheet" href="/css/lighting.css">
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #fff;
	box-sizing: border-box;
	font-family: "Pretendard";
}

.body {
	width: 1300px;
	height: auto;
	background-color: #f9f7ff;
	margin: 0 auto;
}

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
	width: 1280px; /* 드롭다운 박스 너비 */
	height: 30px;
	font-size: 18px;
	text-align: c
}

/* 리스트 스타일 */
.category .dropdown ul {
	display: flex;
	gap: 17px;
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
	border-radius: 25px; /* 모서리 둥글게 */
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

.slider {  
    width: 1300px;  
    max-width: 1300px;
    height: 400px;  
    overflow: hidden;  
    position: absolute;  
    left: 195px;  
    top: 320px;  
}  

.slides {  
    display: flex;
    width: 400%; /* 4장의 이미지가 한 줄로 정렬됨 */ 
    height: 100%; 
    animation: slide 40s infinite; /* 4장 x 10초 = 40초 */
}  

.slides div {  
    width: 100%;  
    flex-shrink: 0; /* 각 이미지가 100%의 크기를 유지하도록 설정 */
}  

.slides img {  

    object-fit: cover;
}  

@keyframes slide {  
    0%, 24% { transform: translateX(0%); }   /* 첫 번째 이미지 정지 */
    25%, 49.9% { transform: translateX(-100%); }  /* 두 번째 이미지 정지 */
    50%, 74.9% { transform: translateX(-200%); }  /* 세 번째 이미지 정지 */
    75%, 99.9% { transform: translateX(-300%); }  /* 네 번째 이미지 정지 */
    100% { transform: translateX(0%); }  /* 다시 첫 번째 이미지 */
}

h2{
color: #0d0143;
position: absolute;
top: 740px;
left: 250px;
}

p{
color: #000;
position: absolute;
top: 740px;
left: 1400px;
}

body {  
    margin: 0;  
    padding: 0;  
    box-sizing: border-box;  
}  

.metting {
position: absolute;  
    top: 830px;  
    left: 245px;  
    display: grid; /* Grid 레이아웃 사용 */  
    grid-template-columns: repeat(4, 1fr); /* 4열로 설정 */  
    gap: 80px; /* 각 item 간의 간격 설정 */  
    width: 300px; /* 전체 폭을 100%로 설정 */  
    max-width: 1200px; /* 최대 폭 설정 */  
    margin: auto; /* 중앙 정렬 */  
}  

.item {  
    border-radius: 15px; /* 모서리 둥글게 */  
    padding: 10px; /* 패딩 추가 */  
    display: flex; /* Flexbox 사용 */  
    flex-direction: column; /* 세로 방향 정렬 */  
    align-items: center; /* 가운데 정렬 */  
    text-align: center; /* 텍스트 가운데 정렬 */  
}  

.metting #chicken {  
    width: 220px; 
    border-radius: 15px; /* 이미지의 모서리 둥글게 */  
}  

.metting span {
  	font-size: 24px;  
    font-weight: bold;  
    color: #0d0143;  
    margin: 8px 0; /* 텍스트 사이의 여백 */  
}  

.metting #icon {  
    width: 23px;  
    height: 23px;
    margin-top: 10px;
}

 #copylight {
 		background : #fff;
        width: 1400px; /* 전체 폭 */  
        height: auto; /* 자동 높이 */  
        position: absolute; /* 고정 위치 */
        top:1700px;
        left: 400px;
    }  
    
  #copylight img {  
        max-width: 800px; /* 반응형 이미지 */  
        height: auto; /* 비율 유지 */  
    }  

}  

</style>
</head>
<body>
	<!-- main.jsp -->
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
							<li><a href="">기타</a></li>
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
							<li><a href="">슈팅</a></li>
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
							<li><a href="">기타</a></li>
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
							<li><a href="">골프(스크린)</a></li>&ensp;
							<li><a href="">필라테스/요가</a></li>&ensp;
							<li><a href="">크로스핏</a></li>&ensp;
							<li><a href="">볼링</a></li>&ensp;
							<li><a href="">클라이밍</a></li>&ensp;
							<li><a href="">기타</a></li>
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
							<li><a href="">기타</a></li>
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
							<li><a href="">기타</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="slider">
   			 <div class="slides">
      	  <div><img alt="event 1" src="images/event_1.jpg"></div>
      	  <div><img alt="event 2" src="images/event_2.jpg"></div>
      	  <div><img alt="event 3" src="images/event_3.jpg"></div>
        <div><img alt="event 4" src="images/event_4.jpg"></div>
    	</div>
	</div>
			<h2>만들어진 모임 LIST</h2>
			<p>더보기 ></p>
			<hr>
			
	<div class="metting">  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
       		<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>   
        	<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
           	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
        	<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div> 
    	</div>
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
      		<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div>
    	  	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
       		<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>   
        	<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
           	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
        	<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div> 
    	</div>
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
      		<div><img id="icon" src="images/icon.png" alt="Icon">&ensp; 치킨중독자&ensp; 3명 모집중</div>
    	</div> 
	</div>
	
	<div  id="copylight">
	<img src="images/카피라이트.jpg">
	</div>


		</div><!-- 메인 -->
	</main>

	<script>
		
	</script>
</body>
</html>