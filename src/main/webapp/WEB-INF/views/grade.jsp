<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/lighting.css">
    <title>열정등급</title>
    <style>
        /* 모달창 전체 */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            border-radius: 16px;
        }

        .modal {
   			background-color: rgb(249, 247, 255); /* 변경된 배경색 */
            padding: 20px;
            border-radius: 8px;
            width: 470px;
            height: 450px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        /* 닫기 이미지 버튼 */
        .close-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background: none;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        
        .close-btn img {
            width: 30px;  /* 이미지 크기 조정 */
            height: 30px;
        }

        /* 배지 컨테이너 */
        .badge-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top:25px;
        }

        /* 각 배지 스타일 */
        .badge {
            display: flex;
            align-items: center;
            gap: 15px;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
        }

        .badge-icon {
            width: 60px;
            height: 60px;
          	margin-left: 30px;
        }

        .badge-info h3 {
            font-size: 16px;
            margin: 10px 0 0 0;
            font-weight: bold;
        }

        .badge-info p {
            font-size: 14px;
            color: #555;
            margin-top: 5px;
        }

        /* 각 등급에 따른 스타일 */
        .master {
            background-color: white;
        }

        .diamond {
            background-color: white;
        }

        .gold {
            background-color: white;
        }

        .silver {
            background-color: white;
        }
    </style>
</head>
<body onload="openModal()"> <!-- 페이지 로드 시 바로 모달 열기 -->>


    <!-- 모달 -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal">
            <button class="close-btn" onclick="closeModal()">
             <img src="images/닫기.png" alt="닫기">
            </button>
            <div class="modal-content">
                <div class="badge-container">
                    <div class="badge master">
                        <img src="images/마스터.png" alt="Master" class="badge-icon">
                        <div class="badge-info">
                            <h3>마스터 등급</h3>
                            <p>별점 4점 이상 5점 이하인 모임에 열정 넘치는 프로 참여!</p>
                        </div>
                    </div>
                    <div class="badge diamond">
                        <img src="images/다이아.png" alt="Diamond" class="badge-icon">
                        <div class="badge-info">
                            <h3>다이아 등급</h3>
                            <p>별점 3점 이상 4점 미만인 모임에 진심인 준프로 참여!</p>
                        </div>
                    </div>
                    <div class="badge gold">
                        <img src="images/골드.png" alt="Gold" class="badge-icon">
                        <div class="badge-info">
                            <h3>골드 등급</h3>
                            <p>별점 2점 이상 3점 미만인 모임에 욕심이 생긴 참가자!</p>
                        </div>
                    </div>
                    <div class="badge silver">
                        <img src="images/실버.png" alt="Silver" class="badge-icon">
                        <div class="badge-info">
                            <h3>실버 등급</h3>
                            <p>회원의 기본 등급으로 모임에 흥미가 생긴 신입 참가자!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // 모달 열기
    function openModal() {
        document.getElementById('modalOverlay').style.display = 'flex';
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById('modalOverlay').style.display = 'none';
    }
    </script>
</body>
</html>
