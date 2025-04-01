<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>친구 신청화면</title>
    <style>
        /* 전체 화면 덮는 모달 배경 */
        .modal {
            display: none;
            position: fixed;    
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }

        /* 모달 내부 콘텐츠 */
        .modal-content {
            background-color: #f9f7ff;
            width: 500px;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center; /* 수직 중앙 정렬 */
        }

        /* 닫기 버튼 (x) */
        .close-button {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }
        
        #userName {
            text-align: center;
            margin: 0 auto;
            font-size: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #userName img {
            display: block;
            margin: 0 auto 5px; 
        }

        #userName a {
            display: block;
            color: gray;
            font-weight: bold;
        }
        
        #userName span {
            font-size: 20px;
            font-weight: bold;  
        }

        #logo {
            width: 150px;
            position: absolute; 
            top: 25px;         
            left: 25px;        
        }

        #profileImg {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        #grade {
            width: 30px;
            margin-right: 5px;
            margin-left: 10px;'
        }

        .btn {
            margin: 20px 0;
        }

        #friendApply {
            display: block; 
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            background-color: #1e62c8;
            color: white;
            cursor: pointer;
            margin-bottom: 10px;
            width: 150px;
        }
        
        #friendBlock {
            display: block;
            padding: 10px 20px;
            margin: 0 auto;
            border: none;
            border-radius: 5px;
            background-color: red;
            color: white;
            cursor: pointer;

        }

        #textBox {
            width: 300px;
            height: 100px;
            padding: 5px;
            border: 1px solid black;
            border-radius: 5px;
            margin-bottom: 20px;
            resize: none; /* 크기 조정 방지 */
            text-align: center;
            background-color: #FFFFFF;
            overflow: auto;
        }
        

        .checkBtn button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #1e62c8;
            color: white;
            cursor: pointer;
            width: 75px;
        }
    </style>
</head>
<body>
    <!-- 모달을 열기 위한 버튼 -->
    <button id="openModalBtn">친구 신청 화면</button>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            
            <div>
                <img src="/lighting/images/logo_가로.png" id="logo">
            </div>
            <div>
                <img src="/lighting/images/icon.png" id="profileImg">
            </div>
            
            <div id="userName">
                <img src="/lighting/images/마스터.png" id="grade"><span>홍길동</span><br> 
                <a>거주 지역: 서울시 강남구</a>
            </div>
            <div class="btn">
                <input type="button" value="친구 신청" id="friendApply">
                <input type="button" value="친구 차단" id="friendBlock">        
            </div>
            
            <div id="textBox">
                <h3>최근 모임 내역</h3>
                <p>4월 2일 강남역 그룹 스터디 5명 모집합니다.</p>
                <p>4월 2일 강남역 그룹 스터디 5명 모집합니다.</p>
            </div>
            
            <div class="checkBtn">
                <button type="submit" id="btn1">확인</button>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function() {
            // 모달 열기 버튼 클릭 시
            $("#openModalBtn").click(function() {
                $("#myModal").css("display", "block");
            });

            // 닫기 버튼, 확인 버튼 클릭 시
            $(".close-button, #btn1").click(function() {
                $("#myModal").css("display", "none");
            });

            // 모달 바깥 영역 클릭 시 닫기
            $(window).click(function(event) {
                if (event.target.className === "modal") {
                    $("#myModal").css("display", "none");
                }
            });
        });
    </script>
</body>
</html>
