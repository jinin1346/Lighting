<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<meta charset="UTF-8">

<title>오늘어때?</title>
<script>
    window.onload = function() {
        let status = sessionStorage.getItem('status');

        if (status) {
            $.ajax({
                url: '/lighting/mypage/setSessionStatus.do',
                type: 'POST',
                data: { status: status },
                success: function(response) {
                },
                error: function(error) {
                    console.error('Error updating session status:', error);
                }
            });
        }
    };
    
    function changeStatusAndMove(status, url) {
        sessionStorage.setItem('status', status);

        $.ajax({
            url: '/lighting/mypage/setSessionStatus.do',
            type: 'POST',
            data: { status: status },
            success: function(response) {
                location.href = url; // AJAX 요청 완료 후 페이지 이동
            },
            error: function(error) {
                console.error('Error updating session status:', error);
            }
        });
    }
</script>

	    <!-- 전체 박스 -->
    <style> 


        #mypageLogo {
            display: inline-block;
            margin: 20px 0 20px 60px;
            color: #0D0143;
        }

        #back_box {
          width: 1300px;
          margin: 0 auto;
          background-color: #f9f7ff;
        }
      
        #grid_box {
          display: grid;
          grid-template-columns: 300px auto 200px; /* 3열 */
          grid-template-rows: repeat(2, 1fr); /* 2행 */
          width: 100%;
          max-width: 1300px;
          margin: 0 auto;
        }
      
        #grid_box > div {
          margin: 0;
          box-sizing: border-box;
          /*border: 1px solid #ccc;*/
          text-align: center;
        }

        #box1 {
            grid-row: span 2;
            border-top: 1px solid #1E62C8;
            padding-top: 50px;

            display: flex;
            flex-direction: column;
        }

        #box2 {
            grid-row: span 2;
            overflow-y: auto;
            height: 920px;
            position: relative;
            padding-top: 100px;
            padding: 100px 20px 0 20px;
            border-top: 1px solid #1E62C8;
        }
        
        #box3 {
            overflow-y: auto;
            height: 495px;
            border-left: 1px solid #1E62C8;
            border-top: 1px solid #1E62C8;
        }

        #box4 {
            overflow-y: auto;
            height: 495px;
            border-left: 1px solid #1E62C8;
            border-top: 2px solid black;
        }
      
    </style>

    <!-- box1 -->
    <style>

        #profile {
            width: 150px;
            height: 150px;
            margin-bottom: 10px;
        }

        #myEvaluation {
            margin-bottom: 50px;
        }

        .link a {
            font-size: 20px;
            text-decoration: none;
            font-weight: normal;
            color: #0D0143;
        }

        .link a:visited {
            color: #0D0143;
        }

        .link {
            margin: 10px auto;
            text-align: left;
            margin-left: 40px;
        }

        #unregister {
            text-align: left;
            margin-top: auto;
            margin-bottom: 30px;
        }

        #unregister > a {
            text-decoration: none;
            font-size: 16px;
            margin-left: 40px;
        }

        #unregister > a:visited {
            color: #0D0143;
        }

        #userInfo > span {
            color: #0D0143;
            font-size: 20px;
        }

        #evaluationIcon {
            width: 25px;
            height: 25px;
        }

        #myEvaluation span {
            color: #0D0143;
            font-size: 20px;
        }
        
    </style> 

	<!-- box2 공통-->
	<style>
		#btnPassion {
            width: 130px;
            background-color: #1e62c8;
            color: white;
            border-radius: 5px; 
            border: none;
            padding: 5px 0;
            cursor: pointer;

            position: absolute;
            top: 20px;
            right: 20px;
        }

        #btnPassion:hover {
            background-color: #1e4ca0;
        }

        #box2 > h3 {
            display: inline;
        }

        #box2 > h3 {
            position: absolute;
            top: 35px;
            left: 25px;
        }

        #box2 h3 {
            color: #0D0143;
        }

        .title {
            cursor: pointer;
        }
	</style>
	
	<!-- box2 joined -->
    <c:if test="${sessionScope.status == 'joined'}">
    <style>

        #list {
            width: 680px;
            margin-left: 40px;
            border-collapse: collapse;;
        }


        #list th {
            padding: 8px 0 8px 0;
            color: #0D0143;
            border-bottom: 2px solid #1E62C8;
        }

        #list td {
            font-size: 12px;
            padding: 10px 0;
            color: #0D0143;
            font-weight: bold;
            border-bottom: 1px solid #1E62C8;
        }

        .col1 {
            width: 105px;
        }

        .col2 {
            width: 80px;
        }

        .col3 {
            max-width: 315px;
            height: 28px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .col4 {
            width: 70px;
        }

        .col5 {
            width: 110px;
        }

        #sort {
            width: 100px;
            border: 2px solid #1E62C8;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
            padding: 2px 0;
        }

        #sort:focus {
            border: 2px solid #1E62C8;
            border-radius: 4px;
            outline: none; /* 기본 포커스 스타일 제거 */
        }

        .btnEvaluation {
            background-color: #1e62c8;
            color: white;
            border-radius: 5px; 
            border: none;
            font-size: 12px;
            font-weight: bold;

            height: 28px;
            width: 100px;
            padding: 5px 5px;
            cursor: pointer;
        }

        .btnEvaluation:hover {
            background-color: #1e4ca0;
        }

    </style>
    </c:if>

    <!-- box2 written -->
    <c:if test="${sessionScope.status == 'written'}">
    <style>
        #list {
            width: 680px;
            margin-left: 40px;
            border-collapse: collapse;;
        }


        #list th {
            padding: 8px 0 8px 0;
            color: #0D0143;
            border-bottom: 2px solid #1E62C8;
        }

        #list td {
            font-size: 12px;
            padding: 10px 0;
            color: #0D0143;
            font-weight: bold;
            border-bottom: 1px solid #1E62C8;
        }

        .col1 {
            width: 105px;
        }

        .col2 {
            max-width: 350px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .col3 {
            width: 110px;
        }

        #sort {
            width: 100px;
            border: 2px solid #1E62C8;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
            padding: 2px 0;
        }

        #sort:focus {
            border: 2px solid #1E62C8;
            border-radius: 4px;
            outline: none; /* 기본 포커스 스타일 제거 */
        }

        .col3 > button {
            width: 50px;
            background-color: #1e62c8;
            color: white;
            border-radius: 5px; 
            border: none;
            padding: 5px 0;
            cursor: pointer;
            font-weight: bold;
        }

        .col3 > button:hover {
            background-color: #1e4ca0;
        }

    </style>
    </c:if>

    <!-- box2 wish -->
    <c:if test="${sessionScope.status == 'wish'}">
    <style>

        .btnParticipation {
            background-color: #1e62c8;
            color: white;
            border-radius: 5px; 
            border: none;
            font-size: 12px;
            font-weight: bold;

            width: 100px;
            height: 28px;
            padding: 5px 5px;
            cursor: pointer;
        }

        .btnParticipation:hover {
            background-color: #1e4ca0;
        }

        .btnParticipationClose {
            background-color: #C81E1E;
            color: white;
            border-radius: 5px; 
            border: none;
            font-size: 12px;
            font-weight: bold;

            width: 50px;
            height: 28px;
            padding: 5px 5px;
            cursor: pointer;
        }

        .btnParticipationClose:hover {
            cursor: not-allowed;

        }

        #list {
            width: 680px;
            margin-left: 40px;
            border-collapse: collapse;;
        }


        #list th {
            padding: 8px 0 8px 0;
            color: #0D0143;
            border-bottom: 2px solid #1E62C8;
        }

        #list td {
            font-size: 12px;
            padding: 10px 0;
            color: #0D0143;
            font-weight: bold;
            border-bottom: 1px solid #1E62C8;
        }

        .col1 {
            width: 105px;
        }

        .col2 {
            width: 80px;
        }

        .col3 {
            max-width: 315px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .col4 {
            width: 70px;
        }

        .col5 {
            width: 110px;
            height: 28px;
        }

        #sort {
            width: 100px;
            border: 2px solid #1E62C8;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
            padding: 2px 0;
        }

        #sort:focus {
            border: 2px solid #1E62C8;
            border-radius: 4px;
            outline: none; /* 기본 포커스 스타일 제거 */
        }

    </style>

    </style>
    </c:if>

	<!-- box3,4 -->
    <style>

        #friendList > :nth-child(1) {
            margin: 20px auto;
            color: #505050;
        }

        #blockList > :nth-child(1) {
            margin: 20px auto;
            color: #505050;
        }

        .friendItem > :nth-child(2), .blockItem > :nth-child(2) {
            color: #505050;
            display: inline-block;
            width: 140px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .friendItem > img, .blockItem > img {
            width: 20px;
            height: 20px;
        }
        
        .btnDelFreiend, .btnUnblock {
        	cursor: pointer;
        }

    </style>

</head>
<body>

	<div id="back_box">
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
        <h2 id="mypageLogo">마이 페이지</h2>

        <div id="grid_box">

            <div id="box1">
                <div>
                    <!-- icon.png >> 변수명 -->
                    <img src="/lighting/images/icon.png" id="profile">
                </div>

                <div id="userInfo">
                    <!-- 마스터.png >> 변수명 -->
                    <img src="/lighting/images/마스터.png" id="evaluationIcon">
                    <!-- 닉네임 >> 변수명 -->
                    <span id="myNickname">닉네임</span>
                    <!-- (아이디) >> 변수명 -->
                    <span id="myId">(아이디)</span>
                </div>

                <div id="myEvaluation">
                    <span>⭐</span>
                    <span>
                        <!-- 5.0 >> 변수명 -->
                        <b><span>5.0</span>점</b>
                    </span>
                </div>

                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('joined', '/lighting/mypage/mypage.do');">
                    	<c:if test="${sessionScope.status == 'joined'}">
                    	<b>
                    	</c:if>
                    	내가 참여한 모임 보기
                    	<c:if test="${sessionScope.status == 'joined'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('written', '/lighting/mypage/mypage.do');">
                    	<c:if test="${sessionScope.status == 'written'}">
                    	<b>
                    	</c:if>
                    	내가 작성한 글 보기
                    	<c:if test="${sessionScope.status == 'written'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('wish', '/lighting/mypage/mypage.do');">
                    	<c:if test="${sessionScope.status == 'wish'}">
                    	<b>
                    	</c:if>
                    	내가 찜한 모임 보기
                    	<c:if test="${sessionScope.status == 'wish'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('requesting', '/lighting/mypage/mypage.do')">
                    	<c:if test="${sessionScope.status == 'requesting'}">
                    	<b>
                    	</c:if>
                    	내가 신청한 모임 보기
                    	<c:if test="${sessionScope.status == 'requesting'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('requested', '/lighting/mypage/mypage.do')">
                    	<c:if test="${sessionScope.status == 'requested'}">
                    	<b>
                    	</c:if>
                    	내가 만든 모임 신청 보기
                    	<c:if test="${sessionScope.status == 'requested'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div class="link">
                    <a href="#!" onclick="changeStatusAndMove('updateInfo', '/lighting/mypage/mypage.do');">
                    	<c:if test="${sessionScope.status == 'updateInfo'}">
                    	<b>
                    	</c:if>
                    	회원 정보 수정
                    	<c:if test="${sessionScope.status == 'updateInfo'}">
                    	</b>
                    	</c:if>
                    </a>
                </div>
                <div id="unregister">
                    <a href="#!">회원 탈퇴</a>
                    <!-- href="/lighting/mypage/unregister.do" -->
                </div>
            </div>

            
            
            <div id="box2">
                <button id="btnPassion">열정(등급) 보기</button>
                
                <!-- joined -->
                <c:if test="${sessionScope.status == 'joined'}">
                <h3>내가 참여한 모임 보기</h3>
                <table id="list">
                    <tr>
                        <th>모임 일자</th>
                        <th>장소</th>
                        <th>제목</th>
                        <th>모집인원</th>
                        <th>
                        	<!-- change 이벤트 걸기 -->
                            <select name="sort" id="sort">
                                <option value="recentOrder" selected>최신 순</option>
                                <option value="koreanOrder">가나다 순</option>
                                <option value="moreCapOrder">많이 참여한 순</option>
                                <option value="lessCapOrder">적게 참여한 순</option>
                                <option value="oldestOrder">오래된 순</option>
                            </select>
                        </th>
                    </tr>

                    <!-- for문 시작 -->
                    <tr>
                        <td class="col1">
                            <!-- 모임시작시간 가져와서 파싱해서 값 넣기 -->
                            2025년 4월 2일
                        </td>
                        <td class="col2">
                            <!-- 글 작성자의 활동지역 가져오기 -->
                            서울/강남구
                        </td>
                        <td class="col3 title">
                            <!-- 게시글의 제목 가져오기 -->
                            4월 2일 강남역 그룹 스터디 5명 모집합니다.
                        </td>
                        <td class="col4">
                            <!-- 게시글의 정원 가져오기 -->
                            <span>
                                3</span>명 <!-- 띄어쓰기 X -->
                        </td>
                        <td class="col5">
                            <button class="btnEvaluation">
                                회원 평가하기
                            </button>
                        </td>
                    </tr>
                    <!-- for문 종료 -->

                    <tr>
                        <td class="col1">2025년 4월 2일</td>
                        <td class="col2">서울/강남구</td>
                        <td class="col3 title">4월 2일 강남역 그룹 스터디 5명 모집합니스터디 5터디 5명 모집합니스터디 5명 모집합니다.</td>
                        <td class="col4">3명</td>
                        <td class="col5">회원 평가하기</td>
                    </tr>

                    <tr>
                        <td class="col1">2025년 4월 2일</td>
                        <td class="col2">서울/강남구</td>
                        <td class="col3 title">4월 2일 강남역 그룹 스터디 5명 모집합니다.</td>
                        <td class="col4">3명</td>
                        <td class="col5">회원 평가하기</td>
                    </tr>

                </table>

                </c:if>
                
                <!-- written -->
                <c:if test="${sessionScope.status == 'written'}">
                <h3>내가 작성한 글 보기</h3>
                <table id="list">
                    <tr>
                        <th>작성 일자</th>
                        <th>제목</th>
                        <th>
                            <select name="sort" id="sort">
                                <option value="recentOrder" selected>최신 순</option>
                                <option value="koreanOrder">가나다 순</option>
                                <option value="moreCapOrder">많이 참여한 순</option>
                                <option value="lessCapOrder">적게 참여한 순</option>
                                <option value="oldestOrder">오래된 순</option>
                            </select>
                        </th>
                    </tr>

                    <!-- for문 시작 -->
                    <tr>
                        <td class="col1">
                            <!-- 모임시작시간 가져와서 파싱해서 값 넣기 -->
                            2025년 4월 2일
                        </td>
                        <td class="col2 title">
                            <!-- 게시글의 제목 가져오기 -->
                            4월 2일 강남역 그룹 스터디 5명 모집합니다.4월 2일 강남역 그룹 스터디 5명 모집합니다.4월 2일 강남역 그룹 스터디 5명 모집합니다.
                        </td>
                        <td class="col3">
                            <button>
                                수정
                            </button>
                            <button>
                                삭제
                            </button>
                        </td>
                    </tr>
                    <!-- for문 종료 -->

                </table>

                </c:if>
                
                <!-- wish -->
                <c:if test="${sessionScope.status == 'wish'}">
                <h3>내가 찜한 모임 보기</h3>
                <table id="list">
                    <tr>
                        <th>글 번호</th>
                        <th>장소</th>
                        <th>제목</th>
                        <th>모집인원</th>
                        <th>
                            <select name="sort" id="sort">
                                <option value="recentOrder" selected>최신 순</option>
                                <option value="koreanOrder">가나다 순</option>
                                <option value="moreCapOrder">많이 참여한 순</option>
                                <option value="lessCapOrder">적게 참여한 순</option>
                                <option value="oldestOrder">오래된 순</option>
                            </select>
                        </th>
                    </tr>


                    <!-- for문 시작 -->
                    <tr>
                    <!-- 마감된 모임의 경우 인라인 스타일을 적용하여 글자 색 수정 -->
                        <td class="col1">
                        <!-- 게시글의 seq 가져오기 -->
                            5
                        </td>
                        <td class="col2">
                            <!-- 글 작성자의 활동지역 가져오기 -->
                            서울/강남구
                        </td>
                        <td class="col3 title">
                            <!-- 게시글의 제목 가져오기 -->
                            4월 2일 강남역 그룹 스터디 5명 모집합니다.
                        </td>
                        <td class="col4">
                            <!-- 게시글의 정원 가져오기 -->
                            <span>
                                3</span>명 <!-- 띄어쓰기 X -->
                        </td>

                        <td class="col5">
                            <!-- if문or choose문을 통해 버튼 선택적으로 출력 -->
                            <button class="btnParticipation">
                                모임 참여하기
                            </button>
                        </td>


                    </tr>
                    <!-- for문 종료 -->

                    <tr>
                        <!-- 마감된 모임의 경우 인라인 스타일을 적용하여 글자 색 수정 -->
                        <td class="col1" style="color: #908CA2;">
                            <!-- 게시글의 seq 가져오기 -->
                                1
                            </td>
                            <td class="col2" style="color: #908CA2;">
                                <!-- 글 작성자의 활동지역 가져오기 -->
                                서울/강남구
                            </td>
                            <td class="col3" style="color: #908CA2;">
                                <!-- 게시글의 제목 가져오기 -->
                                4월 2일 강남역 그룹 스터디 5명 모집합니다.
                            </td>
                            <td class="col4" style="color: #908CA2;">
                                <!-- 게시글의 정원 가져오기 -->
                                <span>
                                    3</span>명 <!-- 띄어쓰기 X -->
                            </td>
                            <td class="col5">
                                <button class="btnParticipationClose">
                                    마감
                                </button>
                            </td>

                    </tr>

                </table>


                </c:if>
                
                <!-- requesting -->
                <c:if test="${sessionScope.status == 'requesting'}">
                <h3>내가 신청한 모임 보기</h3>
                </c:if>
                
                <!-- requested -->
                <c:if test="${sessionScope.status == 'requested'}">
                <h3>내가 만든 모임 신청 보기</h3>
                </c:if>
                
                <!-- updateInfo -->
                <c:if test="${sessionScope.status == 'updateInfo'}">
                <h3>회원 정보 수정</h3>
                </c:if>
                
                
            </div>
            


			

            <div id="box3">
                <div id="friendList">
                    <div>친구목록</div>

                    <!-- for문 시작 -->
                    <div class="friendItem">
                        <!-- 다이아.png >> 변수명 -->
                        <img src="/lighting/images/다이아.png">
                        
                        <span>
                            닉네임닉네임닉네임닉<!-- 닉네임 >> 변수명 -->
                        </span>

                        <img src="/lighting/images/닫기.png" class="btnDelFreiend">
                        <!-- 삭제 이벤트 이후 한번 더 리스트 출력할것 -->
                    </div>
                    <!-- for문 종료 -->

                    <!-- for문 시작 -->
                    <div class="friendItem">
                        <!-- 다이아.png >> 변수명 -->
                        <img src="/lighting/images/다이아.png">

                        <span>
                            닉네임닉<!-- 닉네임 >> 변수명 -->
                        </span>

                        <img src="/lighting/images/닫기.png" class="btnDelFreiend">
                    </div>
                    <!-- for문 종료 -->

                </div>
            </div>

            <div id="box4">
                <div id="blockList">
                    <div>차단목록</div>

                    <!-- for문 시작 -->
                    <div class="blockItem">
                        <!-- 다이아.png >> 변수명 -->
                        <img src="/lighting/images/다이아.png">

                        <span>
                            닉네임닉네임닉네임닉<!-- 닉네임 >> 변수명 -->
                        </span>

                        <img src="/lighting/images/닫기.png" class="btnUnblock">
                        <!-- 삭제 이벤트 이후 한번 더 리스트 출력할것 -->
                    </div>
                    <!-- for문 종료 -->

                </div>
            </div>

        </div>

    </main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	
	<!-- 마이페이지 공통 자바스크립트 -->
	<script>

	$('#btnPassion').click(()=>{
    	openServletInNewWindow("/lighting/mypage/grade.do");
    });
	
	$('#unregister').click(()=>{
    	openServletInNewWindow("/lighting/mypage/unregister.do");
    });
	
	$('.btnEvaluation').click(()=>{
    	openServletInNewWindow("/lighting/mypage/evaluation.do");
    });
	
    function openServletInNewWindow(servletUrl) {
        window.open(servletUrl, "_blank", "width=600,height=400,scrollbars=yes");
    }
    
    $('#list .title').click(()=>{
    	location.href='/lighting/meeting/read.do';
    });
    
    </script>
    
    
    
</body>
</html>





























