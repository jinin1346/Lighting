<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<style>
body {
margin: 0;
}
.category {  
    display: flex;
    justify-content: center;   
    gap: 90px;  
    z-index: 10;  
}  

.category img {  
    width: 90px;  
    height: auto;  
    z-index: 10;  
    margin-top: 25px;  
    cursor: pointer; /* Added for better UX */  
}  

.category .dropdown {
    display: none;
    background-color: #fff;  
    border-radius: 10px;  
    box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.3);  
    opacity: 0.9;  
    z-index: 10;  
    width: 1100px;
    height:auto;
    font-size: 18px;  
    text-align: center;
    position: absolute; /* Changed to absolute positioning */  
    left: 50%; /* Centering */  
    transform: translateX(-50%); /* Centering */
     justify-content: center;
}  

.category .dropdown ul {
    display: flex;  
    justify-content: center; /* 중앙 정렬 */
    gap: 20px; /* 항목 간격 */
    padding: 0;
    list-style: none; /* 기본 리스트 스타일 제거 */
}  
.category .dropdown li {  
    text-align: center;  
    cursor: pointer;
    display: flex;
     justify-content: center;
}  

.category .dropdown li a {  
    color: #00255c;  
    text-decoration: none;
    display: block;  
}  

.category .dropdown li:hover {  
    font-size: 20px;  
    font-weight: bold;  
}

.category .icon-container:hover .dropdown {
    display: block;  
}

.slider {  
    width: 1000px;  /* 화면 크기에 따라 조정 */
    max-width: 1000px;
    height: 350px;  
    overflow: hidden;  
    position: absolute;  
    left: 50%;  
    top: 300px;  
    transform: translateX(-50%); /* 중앙 정렬 */
}  

.slides {  
    display: flex;
    width: 100%;
    height: 100%; 
    max-width: 100vw; /* 추가 */
    animation: slide 40s infinite;
    overflow-x: hidden;
}

.slides div {  
    width: 100%;  
    flex-shrink: 0;
}  

.slides img {  
    object-fit: cover;
}

h2{
color: #0d0143;
position: relative;
top: 365px;
left: 470px;
}

p{
color: #0d0143;
position: relative;
top: 315px;
left: 1380px;
}

@keyframes slide {  
    0%, 24% { transform: translateX(0%); }   /* 첫 번째 이미지 정지 */
    25%, 49.9% { transform: translateX(-100%); }  /* 두 번째 이미지 정지 */
    50%, 74.9% { transform: translateX(-200%); }  /* 세 번째 이미지 정지 */
    75%, 99.9% { transform: translateX(-300%); }  /* 네 번째 이미지 정지 */
    100% { transform: translateX(0%); }  /* 다시 첫 번째 이미지 */
}

.metting {
position: absolute;
    top: 0px;  
    left: 50%;
    display: grid; 
    grid-template-columns: repeat(4, 1fr); 
    gap: 40px;
    width: 280px; 
    max-width: 1000px;
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
    width: 200px; 
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
</style>
<body>
<!-- 카테고리 -->
<div class="category">
				<div class="icon-container">
					<img src="images/맛집아이콘.png" id="car_1">
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
					<img src="images/게임아이콘.png" id="car_2">
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
					<img src="images/문화아이콘.png" id="car_3">
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
					<img src="images/스포츠아이콘.png" id="car_4">
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
					<img src="images/자기계발아이콘.png" id="car_5">
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
					<img src="images/힐링아이콘.png" id="car_6">
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

<!-- 모임 추천 -->
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
    	</div>


</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>









