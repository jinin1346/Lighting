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
</style>

<style>
    #slider { 
        margin: 0 auto;
        width: 1100px;
        height: 350px;
        overflow: hidden; /* 슬라이드 영역을 벗어나는 이미지 숨김 */
        position: relative; /* 슬라이드 이동을 위해 필요 */
    }
    
    #slides { 
        display: flex; /* 이미지를 가로로 나열 */
        animation: slide 16s linear infinite; /* 애니메이션 적용 */
        height: 100%;
    }
    
    #slides div {  
        width: 100%/4; /* 이미지 4개 기준, 이미지 개수에 따라 조정 필요 */
        flex-shrink: 0; /* 이미지 크기 유지 */
    }  
    
    #slides img {  
        width: 100%; /* 이미지 너비를 부모 요소에 맞춤 */
        height: 100%; /* 이미지 높이 자동 조절 */
        display: block; /* 이미지 아래 여백 제거 */
        flex-shrink: 0; 
    }

    @keyframes slide {
        0%, 12.4% {
            transform: translateX(0);
        }
        12.5%, 37.4% {
            transform: translateX(-100%);
        }
        37.5%, 62.4% {
            transform: translateX(-200%);
        }
        62.5%, 87.4% {
            transform: translateX(-300%);
        }
        87.5%, 100% {
            transform: translateX(-400%);
        }
    }
    
    .extra {
        margin: 0 auto;
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
    
    #extraView {
        color: #0d0143;
        cursor: pointer;
    }
    
</style>

<style>
    #meetingBox {
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

    .thumnail {
        width: 200px; 
        border-radius: 15px;
    }

    .title {
        font-size: 22px;  
        font-weight: bold;  
        color: #0d0143;  
        margin: 8px 0; /* 텍스트 사이의 여백 */
        cursor: pointer;

        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .nameAndCap {
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

    #slides img:hover {
        cursor: pointer;
    }

    .thumnail {
        cursor: pointer;
    }

    .capBox {
    	display: block;
        text-align: right;
    }
    
</style>

    <!-- 카테고리 -->
    <div class="category">
        <div class="icon-container">
            <img src="/lighting/images/맛집아이콘.png" id="car_1">
            <div class="dropdown">
                <ul>
                    <li><a data-tblCategorySubSeq="18">식사</a></li>&ensp;
                    <li><a>카페</a></li>&ensp;
                    <li><a>디저트</a></li>&ensp;
                    <li><a>술</a></li>&ensp;
                    <li><a>비건</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/게임아이콘.png" id="car_2">
            <div class="dropdown">
                <ul>
                    <li><a>액션</a></li>&ensp;
                    <li><a>어드벤처</a></li>&ensp;
                    <li><a>롤플레잉(RPG)</a></li>&ensp;
                    <li><a>시뮬레이션</a></li>&ensp;
                    <li><a>전략</a></li>&ensp;
                    <li><a>스포츠</a></li>&ensp;
                    <li><a>퍼즐</a></li>&ensp;
                    <li><a>아케이드</a></li>&ensp;
                    <li><a>슈팅</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/문화아이콘.png" id="car_3">
            <div class="dropdown">
                <ul>
                    <li><a>영화</a></li>&ensp;
                    <li><a>공연</a></li>&ensp;
                    <li><a>전시회/미술</a></li>&ensp;
                    <li><a>노래/춤</a></li>&ensp;
                    <li><a>언어교환</a></li>&ensp;
                    <li><a>애니메이션</a></li>&ensp;
                    <li><a>쇼핑</a></li>&ensp;
                    <li><a>악기연주</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/스포츠아이콘.png" id="car_4">
            <div class="dropdown">
                <ul>
                    <li><a>유산소</a></li>&ensp;
                    <li><a>웨이트(무산소) </a></li>&ensp;
                    <li><a>격투</a></li>&ensp;
                    <li><a>코어&밸런스</a></li>&ensp;
                    <li><a>기능성</a></li>&ensp;
                    <li><a>다이어트</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/자기계발아이콘.png" id="car_5">
            <div class="dropdown">
                <ul>
                    <li><a>여행</a></li>&ensp;
                    <li><a>드라이브</a></li>&ensp;
                    <li><a>캠핑</a></li>&ensp;
                    <li><a>등산</a></li>&ensp;
                    <li><a>명상</a></li>&ensp;
                    <li><a>반려동물</a></li>&ensp;
                    <li><a>꽃꽃이</a></li>&ensp;
                    <li><a>독서</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/힐링아이콘.png" id="car_6">
            <div class="dropdown">
                <ul>
                    <li><a>스터디</a></li>&ensp;
                    <li><a>취업준비</a></li>&ensp;
                    <li><a>모의면접</a></li>&ensp;
                    <li><a>멘토/멘티</a></li>&ensp;
                    <li><a>독서</a></li>&ensp;
                    <li><a>재테크</a></li>&ensp;
                    <li><a>비즈니스</a></li>&ensp;
                    <li><a>코딩</a></li>&ensp;
                    <li><a>기타</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- 모임 추천 -->
    <div id="slider">
    
        <div id="slides">
        
            <div id="event1">
            	<!--
            		1. 오늘의 추천으로 날씨, 요일에 맞는 중분류 카테고리를 4개 가져오기
            	 -->
                <!-- event_1.jpg >> 첫번째 사진 변수명 -->
                <!-- 예시) src="/lighting/images/" -->
                
                <!-- data-tblCategorySubSeq >> 중분류 pk -->
                <!-- 예시) data-tblCategorySubSeq="" -->
                
                <img alt="event1" src="/lighting/images/event_1.jpg" data-tblCategorySubSeq="">
            </div>
            <div id="event2">
            	<!-- event_2.jpg >> 두번째 변수명 -->
                <img alt="event2" src="/lighting/images/event_2.jpg" data-tblCategorySubSeq="">
            </div>
            <div id="event3">
            	<!-- event_3.jpg >> 세번째 변수명 -->
                <img alt="event3" src="/lighting/images/event_3.jpg" data-tblCategorySubSeq="">
            </div>
            <div id="event4">
            	<!-- event_4.jpg >> 네번째 변수명 -->
                <img alt="event4" src="/lighting/images/event_4.jpg" data-tblCategorySubSeq="">
            </div>
            <div id="event5">
            	<!-- event_1.jpg >> 첫번째 변수명 -->
                <img alt="event1" src="/lighting/images/event_1.jpg" data-tblCategorySubSeq="">
            </div>
            
        </div>
        
    </div>

    <div class="extra">
        <h2>만들어진 모임 LIST</h2>
        <p id="extraView">더보기 ></p>
    </div>
    
    <div id="meetingBox">	
        
        <!-- for문 시작 -->
        <div class="item">  
            <div>
                <img src="/lighting/images/치킨.jpg" class="thumnail" data-tblMeetingPostSeq="">
                <!-- 치킨.jpg >> 게시글의 photoFileName  -->
                <!-- data-tblMeetingPostSeq >> 게시글의 seq -->
            </div>
            <span class="title" data-tblMeetingPostSeq="">
                <!-- 게시글의 title -->
                제목제목제목제목제목제목제목제목제목제목
            </span>

            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <!-- icon.png >> Member의 photoFileName -->
                <span class="nameAndCap">
                    &ensp; 
                    <span class="name">
                        작성자작성자작성자작<!-- 게시글 > 멤버 참조 >> nickname -->
                    </span>
                    <br>
                    <span class="capBox">
                        <span class="capacity">
                            3<!-- 게시글의 capacity -->
                        </span>
                        명 모집중
                    </span>
                </span>
            </div>
        </div>
        <!-- for문 끝 -->

        <div class="item">  
            <div>
                <img src="/lighting/images/치킨.jpg" class="thumnail">  
            </div>
            <span class="title">
                제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
            </span>

            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="nameAndCap">
                    &ensp; 
                    <span class="name">치킨중독자치킨중독자</span>
                    &ensp; 
                    <span class="capacity">3</span>
                    명 모집중
                </span>
            </div>
        </div>

        <div class="item">  
            <div>
                <img src="/lighting/images/치킨.jpg" class="thumnail">  
            </div>
            <span class="title">
                제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
            </span>

            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="nameAndCap">
                    &ensp; 
                    <span class="name">치킨중독자</span>
                    &ensp; 
                    <span class="capacity">3</span>
                    명 모집중
                </span>
            </div>
        </div>

        <div class="item">  
            <div>
                <img src="/lighting/images/치킨.jpg" class="thumnail">  
            </div>
            <span class="title">
                제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
            </span>

            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="nameAndCap">
                    &ensp; 
                    <span class="name">치킨중독자</span>
                    &ensp; 
                    <span class="capacity">3</span>
                    명 모집중
                </span>
            </div>
        </div>

        <div class="item">  
            <div>
                <img src="/lighting/images/치킨.jpg" class="thumnail">  
            </div>
            <span class="title">
                제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
            </span>

            <div>
                <img class="icon" src="images/icon.png" alt="Icon">
                <span class="nameAndCap">
                    &ensp; 
                    <span class="name">치킨중독자</span>
                    &ensp; 
                    <span class="capacity">3</span>
                    명 모집중
                </span>
            </div>
        </div>

    </div><!-- meetingBox -->

    <script>
    	$('.thumnail').click(() => {
    			openServletInNewWindow("/lighting/login/register.do");
    	});
    	
	    function openServletInNewWindow(servletUrl) {
	        window.open(servletUrl, "_blank", "width=600,height=400,scrollbars=yes");
	    }

    </script>