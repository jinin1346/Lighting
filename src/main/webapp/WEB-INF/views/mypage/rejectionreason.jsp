<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8" />
    <title>거부 사유 모달 예시</title>
    <style>
        /* 공통 모달 스타일 */
        .modalElement {
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modalContent {
            background-color: #f9f7ff;
            width: 500px;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            position: relative;
        }

        .closeModalButton {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        #logo {
            width: 150px;
        }

        #infoTitle{
            width : 100%;
            text-align : center;
            font-weight:bold;
            margin : 30px auto 0px;
            font-size: 20px;
        }

        #infoContent{
           display : flex;
           width : 80%;
           height : 100px;
           margin : 10px auto;
           padding : 10px;
           font-size :18px;
        border-radius: 8px ;
        background-color: #fff;
            border: 1px solid #1e62c8;
            justify-content: center;  /* 수평 가운데 정렬 */
    align-items: center;      /* 수직 가운데 정렬 */
    text-align: center;       /* 텍스트 여러 줄일 때 가운데 정렬 */
    flex-direction: column;   /* 텍스트를 세로로 쌓고 싶다면 사용(선택) */
        }
        
        #ment{
        display : flex;
           width : 80%;
           margin : 10px auto;
        }
        
        /** 왼쪽 상자 + 라디오 버튼 상자를 감싸는 컨테이너 */
        .infoContainer {
            display: flex;
            width: 40%;
            margin: 60px auto; /* 위아래 여백 */
            padding: 0;
        }

        /* 왼쪽 파란 상자 */
        .infoLabel {
            background-color: #1e62c8;
            color: #fff;
            padding: 10px;
            font-weight: bold;
            white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 */
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px 0px 0px 8px;
        }

        /* 오른쪽 흰색 배경+파란 테두리 상자 */
        .radioContainer {
            display: flex;
            background-color: #fff;
            border: 2px solid #1e62c8;
            padding: 10px;
            flex: 1; /* 남은 공간 전부 차지 */
            text-align : center;
            box-sizing: border-box;
            border-radius: 0px 8px 8px 0px;
            justify-content: center;  /* 수평 가운데 정렬 */
            align-items: center;      /* 수직 가운데 정렬 */
            text-align: center;       /* (필요 시) 텍스트 여러 줄일 때 가운데 정렬 */
        }
        
        
    </style>

    <script>
    
    </script>
</head>
<body>
    <!-- 거부 사유 모달 영역 -->
    <div id="rejectModalElement" class="modalElement">
        <div class="modalContent">
            <span id="closeRejectModalButton" class="closeModalButton">&times;</span>

            <div>
                <img alt="로고" src="/lighting/images/logo_가로.png" id="logo">
            </div>

            <div id="infoTitle">홍길동 님이 생성한</div>

            <div id="infoContent"> 4월 2일 강남역<br>그룹 스터디5명 모집</div>
            <div id="ment">모임에 거부되었습니다.</div>
            
            
        <!-- 공개 여부 라디오 영역 -->
            <div class="infoContainer">
                <!-- 왼쪽 파란 상자 -->
                <div class="infoLabel">거부 사유</div>
                <!-- 오른쪽 라디오 상자 -->
                <div class="radioContainer">만석</div>
            </div>
        </div>
        
    </div>
</body>
</html>
