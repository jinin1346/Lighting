<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  
  <title>Insert title here</title>
  <style>
    /* 전체 높이와 기본 리셋 */
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
    }
    /* container를 flex로 구성하여 footer가 항상 하단에 위치하도록 함 */
    .container {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    /* content 영역은 flex-grow: 1로 설정하여 여유 공간을 채움 */
    .content {
      flex: 1;
    }
    
  </style>
</head>
<body>
  <div class="container">
    <%@ include file="header_test.jsp" %>
    <div class="content">
      <%@ include file="body_test.jsp" %>
    </div>
    <%@ include file="footer_sw.jsp" %>
  </div>
  <script>
    // 필요시 추가 스크립트 작성
  </script>
</body>
</html>
