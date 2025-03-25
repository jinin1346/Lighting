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

body {
	margin: 0;
	padding: 0;
	background-color: #fff;
	box-sizing: border-box;
}

.body
	width: 1300px;
	height: 1700px;
	background-color: #f9f7ff;
	margin: 0 auto;
	position : relative;
	
}

#logo {
	position: relative;
	left: 330px;
	top: 22px;
	width: 250px;
	height: auto;
	cursor: pointer;

}

#mypage {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1500px;
	top: 27px;
	cursor: pointer;
}

#join {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1425px;
	top: 27px;
	cursor: pointer;
}

#login {
	font-size: 15px;
	color: rgb(13, 1, 67);
	line-height: 1.2;
	position: absolute;
	left: 1340px;
	top: 27px;
	cursor: pointer;
}

.category {
	display: flex; 
	justify-content: center; 
	gap: 85px; 
	align-items: center; 
	height: 57vh; 
}

.category .icon-container {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
		z-index: 10;
}


.category img {
	width: 105px;
	height: auto;
		z-index: 10;
}

.category .dropdown {
	display: none;
	position: absolute;
	top: 330px; 
	left: 50%;
	transform: translateX(-50%);
	background-color: #fff;
	border-radius: 10px;
	padding: 10px;
	box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.3);
	opacity: 0.9;
	z-index: 10;
	width: 1100px;
	height: 40px;
	font-size: 18px;
	text-align: center;
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
	color: #00255c;
	text-decoration: none; /* 밑줄 제거 */
	display: block;
	text-align: top;
}

.category .dropdown li:hover {
	font-size: 20px;
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
	padding: 7px 35px 7px 15px; /* 여백 조정 */
	border: none; /* 테두리 없음 */
	border-radius: 30px; /* 모서리 둥글게 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.search-button {
	position: absolute;
	right: 15px;
	top: 28%;
	transform: translateY(-50%);
	background: none;
	border: none;
	cursor: pointer;
}

.search-button img {
	width: 30px;
	height: 30px;
	color: rgb(13, 1, 67);
}

.slider {  
    width: 1100px;  
    max-width: 1100px;
    height: 350px;  
    overflow: hidden;  
    position: absolute;  
    left: 403px;  
    top: 330px;
}  

.slides {  
    display: flex;
    width: 400%;
    height: 100%; 
    animation: slide 40s infinite;
}

.slides div {  
    width: 100%;  
    flex-shrink: 0;
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
top: 705px;
left: 410px;
}

p{
color: #000;
position: absolute;
top: 710px;
left: 1420px;
}

body {  
    margin: 0;  
    padding: 0;  
    box-sizing: border-box;  
}  

.metting {
position: absolute;  
    top: 760px;  
    left: 420px;
    display: grid; 
    grid-template-columns: repeat(4, 1fr); 
    gap: 40px;
    width: 300px; 
    max-width: 1200px;
margin-bottom: 0px;
}  

.item {  
    border-radius: 15px; 
    padding: 10px; 
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    text-align: center; 
    
}  

.metting #chicken {  
    width: 220px; 
    border-radius: 15px;
}  

.metting span {
  	font-size: 22px;  
    font-weight: bold;  
    color: #0d0143;  
    margin: 8px 0; /* 텍스트 사이의 여백 */
} 

div .text1{
font-size: 15px;  
    color: #505050;
    font-weight: normal;  
position: relative;
bottom: 6px;
right: 5px;
}

.metting #icon {  
    width: 23px;  
    height: 23px;
}

button {
    border: none;
    background: #fff;
    position: fixed; /* 화면에 고정 */
    bottom: 25px; /* 아래에서 20px 떨어짐 */
    right: 25px; /* 오른쪽에서 20px 떨어짐 */
    cursor: pointer; /* 클릭 가능 표시 */
}

button img {
    width: 70px;
    height: auto;
}

 #copylight {
 		background : #fff;
        width: auto; /* 전체 폭 */  
        height: auto; /* 자동 높이 */ 
        align-items:center;
        position: absolute; /* 고정 위치 */
        top:1650px;
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
				<input type="text" class="search-box" placeholder="&ensp;&ensp;모임을 검색해 보세요." />
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
							<li><a href="">슈팅</a></li>&ensp;
							<li><a href="">기타</a></li>
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
							<li><a href="">유산소</a></li>&ensp;
							<li><a href="">웨이트(무산소) </a></li>&ensp;
							<li><a href="">격투</a></li>&ensp;
							<li><a href="">코어&밸런스</a></li>&ensp;
							<li><a href="">기능성</a></li>&ensp;
							<li><a href="">다이어트</a></li>&ensp;
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
							<li><a href="">멘토/멘티</a></li>&ensp;
							<li><a href="">독서</a></li>&ensp;
							<li><a href="">재테크</a></li>&ensp;
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
			
	<div class="metting">  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
       		<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실 3명 모집합니다!!!!</span>   
        	<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
           	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
        	<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
      		<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>
    	  	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
       		<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>   
        	<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>  
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
           	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
        	<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div>
    	<div class="item">  
        	<img id="chicken" src="images/치킨.jpg" alt="Chicken">  
        	<span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
      		<div><img id="icon" src="images/icon.png" alt="Icon"><span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span></div>
    	</div> 
	</div>
	<button>
	<img alt="추가" src="images/add.png">
	</button>
	
	<div  id="copylight">
	<img src="images/카피라이트.png">
	</div>
		</div><!-- 메인 -->
	</main>

	<script>
		
	</script>
</body>
</html>