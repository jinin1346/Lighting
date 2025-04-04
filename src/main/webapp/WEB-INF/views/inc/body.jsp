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
        will-change: transform; /* GPU 가속을 위한 속성 */
        transform: translateZ(0); /* GPU 렌더링 최적화 */
    }
    
    #slides { 
        display: flex; /* 이미지를 가로로 나열 */
        width: 500%;
        animation: slide 16s ease-in-out infinite; /* 애니메이션 적용 */
        height: 100%;
    }
    
    #slides div {  
        width: calc(100% / 5); /* 각 슬라이드의 너비를 1/5로 고정 */
        /*width: 100%/4;  이미지 4개 기준, 이미지 개수에 따라 조정 필요 */
        flex-shrink: 0; /* 이미지 크기 유지 */
    }  
    
    #slides img {  
        width: 100%; 
        height: 100%; 
        display: block; 
        /* flex-shrink: 0;  */
        object-fit: cover;      
      object-position: center;
    }

    @keyframes slide {
        0%, 12.4% {
            transform: translateX(0);
        }
        12.5%, 37.4% {
            transform: translateX(-20%);
        }
        37.5%, 62.4% {
            transform: translateX(-40%);
        }
        62.5%, 87.4% {
            transform: translateX(-60%);
        }
        87.5%, 100% {
            transform: translateX(-80%);
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

	#meetingContainer {
	  width: 100%;
	  max-width: 1000px; /* 필요에 따라 너비 조절 */
	  margin: 0 auto;
	  display: flex;
	  flex-direction: column;
	  align-items: center;  /* 자식 요소들을 가로로 중앙 정렬 */
	}
	
	#noResultMessage {
	  text-align: center;
	  font-size: 18px;
	  color: #555;
	  margin-top: 20px;
	}
	
	#meetingBox {
	  display: grid;
	  grid-template-columns: repeat(4, 1fr);
	  gap: 40px;
	  width: 100%;
	  margin-top: 20px;
	  justify-items: center; /* 각 그리드 아이템을 가운데 정렬 */
	}
    /* #meetingBox {
        display: grid; 
        grid-template-columns: repeat(4, 1fr); 
        gap: 40px;
        width: 280px; 
        max-width: 1000px;
        justify-content: center;
        margin: 0 auto;
    } */

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
        height : 200px;
        border-radius: 15px;
    }




    .title {
        font-size: 22px;  
        font-weight: bold;  
        color: #0d0143;  
        margin: 8px 0; /* 텍스트 사이의 여백 */
        cursor: pointer;
        text-align : center;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    
    .meeting-info {
        padding : 0px 10px 10px 15px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
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
    
<style>
    /* 오른쪽 아래 고정 컨테이너 */
#floatingAdd {
  position: fixed;
  bottom: 50px;
  right: 50px;
  z-index: 1000;
  /* display: flex;
  flex-direction: column;
  align-items: center; */
}

/* 메인 버튼 스타일 */
#floatingAdd .main-button {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  border: none; 
  background: transparent; 
  cursor: pointer;
  padding: 0;
  outline: none;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.3); /*  그림자 효과 */
  transition: box-shadow 0.2s ease, transform 0.2s ease;
}

#floatingAdd .main-button:active {
  transform: scale(0.95);
  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.3);
}


/* 자식 버튼 컨테이너 - 기본적으로 숨김 */
#floatingAdd .child-buttons {
    position: absolute;      /* 절대 위치 지정 */
    bottom: 90px;            /* 메인 버튼 위에 위치하도록 조정 (필요에 따라 값 조정) */
    right: 0;
    /* display: none; */
    pointer-events: none;
    opacity: 0;
    flex-direction: column;
    align-items: center;
    transition: opacity 0.3s ease, transform 0.3s ease;
  display: flex;
    /* margin-bottom: 10px; */
}

/* 버튼 활성화시 자식 버튼 노출 */
#floatingAdd.active .child-buttons {
	  /* display: flex;
    transition: all 1s; */
	  opacity: 1;  
	  pointer-events: auto;
}

/* 개별 자식 버튼 스타일 */
#floatingAdd .child-button {
  width: 80px;
  height: 40px;
  border-radius: .4em;
  background-color: #4285F4;
  color: #fff;
  border: none;
  margin-bottom: 25px;
  cursor: pointer;
  font-size: 12px;
  outline: none;
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.3s ease, transform 0.3s ease, background-color 0.3s ease;
}

#floatingAdd .child-button:active {
  background-color: #1e62c8;
}
#floatingAdd.active .child-buttons .child-button {
  opacity: 1;
  transform: translateY(0);
}


.speech-bubble {
  position: relative;
  background-color: #1e62c8; /* 자식 버튼의 배경색과 동일 */
  border-radius: .4em;
}

.speech-bubble:after {
  content: '';
  position: absolute;
  bottom: -20px; /* 꼬리의 위치 조정 (필요에 따라 값 변경) */
  left: 80%;
  width: 0;
  height: 0;
  border: 10px solid transparent; /* 꼬리의 크기를 버튼 크기에 맞게 조절 */
  border-left: 0;
  border-top-color: #1e62c8; /* 배경색과 동일 */
  margin-left: -10px;
}

    #floatingAdd .main-button img {
    width: 100%;
    height: 100%;
    object-fit: contain; /* 버튼 크기에 맞게 이미지 비율을 유지하며 축소 */
}
    
</style>


<!-- 카테고리 -->
    <div class="category">
        <div class="icon-container">
            <img src="/lighting/images/맛집아이콘.png" id="car_1">
            <div class="dropdown">
                <ul>
                    <li><a data-tbl-category-sub-seq="18">식사</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="19">카페</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="20">디저트</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="21">술</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="22">비건</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="23">기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/게임아이콘.png" id="car_2">
            <div class="dropdown">
                <ul>
                    <li><a data-tbl-category-sub-seq="8">액션</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="9">어드벤처</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="10">롤플레잉(RPG)</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="11">시뮬레이션</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="12">전략</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="13">스포츠</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="14">퍼즐</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="15">아케이드</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="16">슈팅</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="17">기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/문화아이콘.png" id="car_3">
            <div class="dropdown">
                <ul>
                    <li><a data-tbl-category-sub-seq="24">영화</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="25">공연</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="26">전시회/미술</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="27">노래/춤</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="28">언어교환</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="29">애니메이션</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="30">쇼핑</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="31">악기연주</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="32">기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/스포츠아이콘.png" id="car_4">
            <div class="dropdown">
                <ul>
                    <li><a data-tbl-category-sub-seq="1">유산소</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="2">웨이트(무산소)</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="3">격투</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="4">코어&밸런스</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="5">기능성</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="6">다이어트</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="7">기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/자기계발아이콘.png" id="car_5">
            <div class="dropdown">
                <ul>
                    <li><a data-tbl-category-sub-seq="33">스터디</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="34">취업준비</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="35">모의면접</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="36">멘토/멘티</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="37">독서</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="38">재테크</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="39">비즈니스</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="40">코딩</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="41">기타</a></li>
                </ul>
            </div>
        </div>
        <div class="icon-container">
            <img src="/lighting/images/힐링아이콘.png" id="car_6">
            <div class="dropdown">
                <ul>
                    
                    <li><a data-tbl-category-sub-seq="42">여행</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="43">드라이브</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="44">캠핑</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="45">등산</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="46">명상</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="47">반려동물</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="48">꽃꽃이</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="49">독서</a></li>&ensp;
                    <li><a data-tbl-category-sub-seq="50">기타</a></li>
                </ul>
            </div>
        </div>
    </div>

    
    <!-- <div>
    	<button id="btnAdd" onclick="location.href='/lighting/meeting/add.do';">
    		글쓰기
    	</button>
    </div> -->
    
	
    
    
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
                
                <img alt="event1" src="" onerror="this.onerror=null; this.src='/lighting/images/event_1.jpg';">
            </div>
            <div id="event2">
            	<!-- event_2.jpg >> 두번째 변수명 -->
                <img alt="event2" src="" data-tblCategorySubSeq="">
            </div>
            <div id="event3">
            	<!-- event_3.jpg >> 세번째 변수명 -->
                <img alt="event3" src="" data-tblCategorySubSeq="">
            </div>
            <div id="event4">
            	<!-- event_4.jpg >> 네번째 변수명 -->
                <img alt="event4" src="" data-tblCategorySubSeq="">
            </div>
            <div id="event5">
            	<!-- event_1.jpg >> 첫번째 변수명 -->
                <img alt="event1" src="" data-tblCategorySubSeq="">
            </div>
            
        </div>
        
    </div>

    <div class="extra">
        <h2>만들어진 모임 LIST</h2>
        <p id="extraView">전체보기 ></p>
    </div>
    <div id="meetingContainer">
	    <!-- 검색 결과 메시지 -->
	    <p id="noResultMessage"></p>
        <!-- 모임 목록 영역 -->
	    <div id="meetingBox">	
	        <!-- for문 시작 -->
	        <c:forEach begin="0" end="15" var="meeting" items="${meetingList}">
	            <div>
	            <div class="photo-container">
	                <!-- 쿼리 작성할때 mp.photoFileName as meetingPhoto 별칭 붙이기!! -->
	                <img src="/lighting/images/${meeting.meetingPhoto}" class="thumnail" data-tblMeetingPostSeq="${meeting.tblMeetingPostSeq}">
	                <!-- 치킨.jpg >> 게시글의 photoFileName  -->
	                <!-- data-tblMeetingPostSeq >> 게시글의 seq -->
	                <!-- .item .thumnail 클릭 시 data-tblMeetingPostSeq 값에 맞는 글 조회 하는 페이지로 이동 -->
	            </div>
	            <span class="title" data-tblMeetingPostSeq="${meeting.tblMeetingPostSeq}">
	                <!-- 게시글의 title -->
	                ${meeting.title}
	            </span>
	
	            <div class="meeting-info">
	                <!-- 쿼리 작성할때 m.photoFileName as memberPhoto 별칭 붙이기!! -->
	                <img class="icon" src="/lighting/images/${meeting.memberPhoto}" alt="Icon">
	                <!-- icon.png >> Member의 photoFileName -->
	                <span class="nameAndCap">
	                    &ensp; 
	                    <span class="name">
	                        <!-- 게시글 > 멤버 참조 >> nickname -->
	                        ${meeting.nickname}
	                    </span>
	                    <br>
	                    <span class="capBox">
	                        <span class="capacity">
	                            <!-- 게시글의 capacity -->
	                            ${meeting.capacity}
	                        </span>
	                        명 모집중
	                    </span>
	                </span>
	            </div>
	        </div><!-- item -->
	        </c:forEach>
	        <!-- for문 끝 -->
	
	
	    </div>
    <!-- meetingBox -->

        </div><!-- meetingContainer -->
    
    
    <div id="floatingAdd">
      <!-- 노출될 동그란 버튼들 (기본 hidden) -->
      <div class="child-buttons">
        <button class="child-button speech-bubble" onclick="location.href='/lighting/meeting/add.do';">모임만들기</button>
        <button class="child-button speech-bubble">버튼2</button>
        <button class="child-button speech-bubble" onclick="location.href='/lighting/chat/chatview.do';">채팅하기</button>
        
      </div>
      <!-- 메인 버튼 -->
      <button class="main-button">
        <img src="/lighting/images/add.png" alt="Add" />
      </button>
    </div>

    <script>
    	
    	
	    

        //$(document).ready(function() {
	    $('#extraView').click(() => {
	        $.ajax({
	            type: 'GET',  
	            url: '/lighting/maindata.do',
	            data: { showAll: "true" },
	            dataType: 'json',
	            success: function(result) {
	                // 기존 내용을 비우기
	                $('#meetingBox').html('');
	                
	                // 전체 목록넣기
	                result.forEach(meeting => {
	                    $('#meetingBox').append(`
	                        <div class="item">  
	                            <div>
	                                <img src="/lighting/images/\${meeting.meetingPhoto}" class="thumnail" data-tblMeetingPostSeq="\${meeting.tblMeetingPostSeq}">
	                            </div>
	                            <span class="title" data-tblMeetingPostSeq="\${meeting.tblMeetingPostSeq}">
	                                \${meeting.title}
	                            </span>
	                            <div>
	                                <img class="icon" src="/lighting/images/\${meeting.memberPhoto}" alt="Icon">
	                                <span class="nameAndCap">
	                                    &ensp; 
	                                    <span class="name">
	                                        \${meeting.nickname}
	                                    </span>
	                                    <br>
	                                    <span class="capBox">
	                                        <span class="capacity">
	                                            \${meeting.capacity}
	                                        </span>
	                                        명 모집중
	                                    </span>
	                                </span>
	                            </div>
	                        </div>
	                    `);
	                });
	            },
	            error: function(a, b, c){
	                console.log(a, b, c);
	            }
	        });
	    });
	    

	    
	    // 중분류의 게시물만 불러오기
	    $(document).on('click', '.dropdown li a', function(e) {
	        e.preventDefault(); // 기본 링크 동작 방지
	        var categorySubSeq = $(this).data('tblCategorySubSeq'); // 예: 18 (식사)
	        console.log(categorySubSeq);
	        
	        $.ajax({
	            type: 'GET',
	            url: '/lighting/maindata.do', // 서버에서 필터링 처리하는 URL
	            data: { tblCategorySubSeq: categorySubSeq }, // 카테고리 파라미터 전달
	            dataType: 'json',
	            success: function(result) {
	                // 기존 게시물 목록 비우기
	                $('#meetingBox').html('');
	                
	                // 필터링된 결과를 meetingBox에 추가
	                result.forEach(function(meeting) {
	                    $('#meetingBox').append(`
	                        <div class="item">  
	                            <div>
	                                <img src="/lighting/images/\${meeting.meetingPhoto}" class="thumnail" data-tblMeetingPostSeq="\${meeting.tblMeetingPostSeq}">
	                            </div>
	                            <span class="title" data-tblMeetingPostSeq="\${meeting.tblMeetingPostSeq}">
	                                \${meeting.title}
	                            </span>
	                            <div>
	                                <img class="icon" src="/lighting/images/\${meeting.memberPhoto}" alt="Icon">
	                                <span class="nameAndCap">
	                                    &ensp; 
	                                    <span class="name">
	                                        \${meeting.nickname}
	                                    </span>
	                                    <br>
	                                    <span class="capBox">
	                                        <span class="capacity">
	                                            \${meeting.capacity}
	                                        </span>
	                                        명 모집중
	                                    </span>
	                                </span>
	                            </div>
	                        </div>
	                    `);
	                });
	            },
	            error: function(a, b, c){
                    console.log(a, b, c);
                }
	        });
	    });
	 
	    
	    $.ajax({
	        url: '/lighting/weatherdata.do',
	        type: 'GET',
	        dataType: 'json',
	        success: function(data) {
	            // 문자열을 숫자로 변환 (온도는 숫자로 비교하기 위해)
	            var temperature = parseFloat(data.temperature);
	            var precipitationType = data.precipitationType; // "0": 맑음, "1": 비, 등
	            console.log(temperature);
	            console.log(precipitationType);
	            // 실내 활동 조건 (예: 온도가 5℃ 미만, 30℃ 초과, 또는 비/눈 등)
	            if(temperature < 5 || temperature > 30 || precipitationType !== "0") {
	            	console.log(temperature);
	            	// 실내 활동 추천: 슬라이더 배너 이미지를 실내용 이미지로 변경
	                $("#event1 img").attr("src", "/lighting/images/indoor_1.jpg");
	                console.log($("#event1 img").attr("src"));
	                $("#event2 img").attr("src", "/lighting/images/indoor_2.jpg");
	                console.log($("#event2 img").attr("src"));
	                $("#event3 img").attr("src", "/lighting/images/indoor_3.jpg");
	                $("#event4 img").attr("src", "/lighting/images/indoor_4.jpg");
	                $("#event5 img").attr("src", "/lighting/images/indoor_1.jpg");
	            } else {
	                // 야외 활동 추천: 슬라이더 배너 이미지를 야외용 이미지로 변경
	                $("#event1 img").attr("src", "/lighting/images/outdoor_1.jpg");
	                console.log($("#event1 img").attr("src"));
	                $("#event2 img").attr("src", "/lighting/images/outdoor_2.jpg");
	                console.log($("#event2 img").attr("src"));
	                $("#event3 img").attr("src", "/lighting/images/outdoor_3.jpg");
	                console.log($("#event3 img").attr("src"));
	                $("#event4 img").attr("src", "/lighting/images/outdoor_4.jpg");
	                console.log($("#event4 img").attr("src"));
	                $("#event5 img").attr("src", "/lighting/images/outdoor_1.jpg");
	                console.log($("#event5 img").attr("src"));
	            }
	        },
	        error: function(error) {
	            console.error(error);
	        }
	    });

	    
	 
    
    $(document).on('click', '.thumnail, .title', function() {
        const tblMeetingPostSeq = this.dataset.tblmeetingpostseq;
        location.href = '/lighting/meeting/read.do?tblMeetingPostSeq=' + tblMeetingPostSeq;
    });

    
    function openServletInNewWindow(servletUrl) {
        window.open(servletUrl, "_blank", "width=600,height=400,scrollbars=yes");
    }
    
    document.querySelector('#floatingAdd .main-button').addEventListener('click', function() {
    	  document.getElementById('floatingAdd').classList.toggle('active');
    	});

    
	    
    </script>
    
    
    
    
    
    
    