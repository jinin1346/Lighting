<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<style>

.category {
	display: flex; 
	justify-content: center; 
	gap: 90px; 
	align-items: center; 
	height: 57vh;
	position: relative;
	bottom: 170px;
	left: 0px;
}
.category img {
	width: 90px;
	height: auto;
		z-index: 10;
}

.category .icon-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    z-index: 10;
}

.category .dropdown {
    display: none;
    position: absolute; /* 아이콘을 기준으로 배치 */
    top: 110px; /* 아이콘 아래로 위치 조정 */
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

.category .dropdown li {
    text-align: center;
    cursor: pointer;
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

/* 호버 시 드롭다운 표시 */
.category .icon-container:hover .dropdown {
    display: block;
}


</style>
<body>

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

</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>