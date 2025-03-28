<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="css/lighting.css">
<title>평점</title>
<style>
 /* 전체 모달 스타일 */
        .modal {
            display: flex; /* 모달 창을 페이지 로드 시 바로 표시 */
            justify-content: center; /* 가로 중앙 정렬 */
    		align-items: center; /* 세로 중앙 정렬 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 배경 어두운 색 */
			z-index: 1000; /* 다른 요소들이 모달 위에 오지 않게 함 */
        }

        .modal-content {
            background-color: rgb(249, 247, 255); /* 모달 배경 색상 */
            border-radius: 10px;
            padding: 20px;
            width: 500px;
            height: 500px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            margin: auto;
            
            position: relative;
        }

        .modal-header {
            font-size: 26px;
            font-weight: bold;
            color: black;
            
            text-align: center;

            position: relative;
        }
 			/* 로고 이미지 위치 조정 */
        #logo {
            width: 150px; /* 로고 이미지 크기 */
            /* height: 50px; */
            /* position: absolute; */ /* 상단 왼쪽에 배치 */
          	/* top: -40px;
            left: -10px; */ /* 모달 왼쪽 */

            display: block;
         
        }
        
        .modal-header-text {
            margin-top: 10px; /* 텍스트만 아래로 내리기 위한 간격 추가 */
        }
        
        /* 닫기 버튼 스타일 */
        #close-btn {
            position: absolute;
            top:10px;
           	right: 10px; /* 오른쪽 끝 */
            width: 30px; /* 이미지 크기 조정 */
            height: 30px; /* 이미지 크기 조정 */
            cursor: pointer; /* 클릭할 수 있음을 나타내는 커서 */
            /* margin-right: 690px;
            margin-top:180px; */
        }
   			/* 강남 스터디 모임과 날짜 텍스트 위치 및 색상 변경 */
        .modal-header div {
            color: black; /* 텍스트 색상 변경 */
            /* margin-top: 30px; */ /* 텍스트를 아래로 내리기 위한 간격 */
        }
          /* 2025년 텍스트 크기 조정 */
        .modal-header .date {
            font-size: 16px; /* 크기 작게 */
            font-weight: normal; /* 볼드체 제거 */
             color: rgb(97, 96, 103);
              margin-bottom: 20px; /* 간격을 넓히기 위해 여백 추가 */
   			 display: block; /* 필요한 경우 텍스트를 블록 요소로 설정 */
   			 
             
        }
        /* 별 스타일 */
        .stars {
            color: #ffcc00; /* 노란색 별 */
            font-size: 30px;
            margin-left: auto;
            
        }

        .user-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            right: 10px;
            
        }

        .user-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
             border: 2px solid #1e62c8; /* 사용자 정보 박스 테두리 추가 */
        padding: 10px; /* 여백 추가 */
        border-radius: 15px; /* 둥근 테두리 */
        margin-bottom:20px;
        }

        .user-name {
            font-size: 18px;
            font-weight: bold;
        }

        .modal-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            align-items: center;
        }

        .modal-footer button {
            background-color: #1e62c8;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-left:200px;
            font-size: 15px;
            margin-top: 10px;
        }

        .modal-footer button:hover {
          
        }
        
                .badge-icon {
            width: 40px;
            height: 40px;
          	margin-left: 20px;
        }
</style>
<script>
	//닫기 버튼 클릭 시 모달 창 닫기
	function closeModal() {
    document.querySelector('.modal').style.display = 'none';
	}	
</script>
</head>
<body>
<!-- 모달창 -->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
            	<img src="images/logo_가로.png" alt="로고" id="logo">
            	<div class="modal-header-text">
            	
                강남 스터디 모임
                <br>
                <span class="date">2025년 3월 31일 18:00</span>
            
            </div>
            </div>
            
            <img src="images/닫기.png" alt="닫기" id="close-btn" onclick="closeModal()">

            <!-- 사용자 정보 리스트 -->
            <div class="user-info">
                <!-- 이미지 삽입 부분 -->
                <img src="images/icon.png" alt="홍길동" class="user-img"> 
                <img src="images/마스터.png" alt="Master" class="badge-icon">
                <span class="user-name">홍길동 (hong123)</span>
                <div class="stars">★★★★★</div>
            </div>

            <div class="user-info">
                <img src="images/icon.png" alt="치킨중독자" class="user-img">
                <img src="images/다이아.png" alt="Diamond" class="badge-icon">
                <span class="user-name">치킨중독자 (chchi0)</span>
                <div class="stars">★★★★★</div>
            </div>

            <div class="user-info">
                <img src="images/icon.png" alt="여미새인줄" class="user-img">
                <img src="images/실버.png" alt="Silver" class="badge-icon">
                <span class="user-name">여미새인줄 (mansh88)</span>
                <div class="stars">★★★★★</div>
            </div>

            <!-- 평가 완료 버튼 -->
            <div class="modal-footer">
                <button onclick="alert('평가가 완료되었습니다');">평가 완료</button>
            </div>
        </div>
    </div>
</body>
</html>