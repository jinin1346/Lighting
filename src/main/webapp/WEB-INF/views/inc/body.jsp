<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        margin: 60px auto 0 auto;
        width: 1100px;
        height: 350px;
        overflow: hidden; /* 슬라이드 영역을 벗어나는 이미지 숨김 */
        position: relative; /* 슬라이드 이동을 위해 필요 */
    }
    
    .slides { 
        display: flex; /* 이미지를 가로로 나열 */
        animation: slide 12s linear infinite; /* 애니메이션 적용 */
        height: 100%;
    }
    
    .slides div {  
        width: 100%/4; /* 이미지 4개 기준, 이미지 개수에 따라 조정 필요 */
        flex-shrink: 0; /* 이미지 크기 유지 */
    }  
    
    .slides img {  
        width: 100%; /* 이미지 너비를 부모 요소에 맞춤 */
        height: 100%; /* 이미지 높이 자동 조절 */
        display: block; /* 이미지 아래 여백 제거 */
        flex-shrink: 0; 
    }

    @keyframes slide {
        0%, 12.4% {
            transform: translateX(0);
        }
        12.5%, 37.5% {
            transform: translateX(-100%);
        }
        37.6%, 62.5% {
            transform: translateX(-200%);
        }
        62.6%, 87.5% {
            transform: translateX(-300%);
        }
        87.6%, 100% {
            transform: translateX(-400%);
        }
    }
    .extra {
        margin: 30px auto;
        width: 1100px;
        height: auto;
        position: relative;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .extra > h2{
        color: #0d0143;
    }
    
    .extra > p {
        color: #0d0143;
        cursor: pointer;
    }
</style>

<style>
    #meeting_box {
        
        display: grid; 
        grid-template-columns: repeat(4, 1fr); 
        gap: 40px;
        width: 280px; 
        max-width: 1000px;
        justify-content: center;
        margin: 0 auto;
    }

    .item {
        border-radius: 15px; 
        padding: 10px; 
        display: flex; 
        flex-direction: column; 
        align-items: center; 
        text-align: center; 
    }

    .item > img {
        width: 200px; 
        border-radius: 15px;
    }

    .item > span {
        font-size: 22px;  
        font-weight: bold;  
        color: #0d0143;  
        margin: 8px 0; /* 텍스트 사이의 여백 */
    }

    .text1 {
        font-size: 15px;  
        color: #505050;
        font-weight: normal;  
        position: relative;
        bottom: 6px;
        right: 5px;
    }

    .icon {
        width: 23px;
        height: 23px;
    }

    
</style>
	<div>
    <!-- 모임 추천 -->
    <div class="slider">
        <div class="slides">
            <img alt="event 1" src="images/event_1.jpg">
            <img alt="event 2" src="images/event_2.jpg">
            <img alt="event 3" src="images/event_3.jpg">
            <img alt="event 4" src="images/event_4.jpg">
            <img alt="event 1" src="images/event_1.jpg">
        </div>
    </div>

    <div class="extra">
        <h2>만들어진 모임 LIST</h2>
        <p id="extra_view">더보기 ></p>
    </div>
    
    <div id="meeting_box">		
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>  
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div> 
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
        <div class="item">  
            <img src="images/치킨.jpg">  
            <span>4월 5일 강남에서 치킨드실3명 모집합니다!!!!</span>  
            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="text1">&ensp; 치킨중독자&ensp; 3명 모집중</span>
            </div>
        </div>
    </div>
	</div>
