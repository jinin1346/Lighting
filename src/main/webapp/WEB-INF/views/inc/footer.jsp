<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Test Page</title>
  <style>
    /* 기본 리셋 및 높이 설정 */
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
    /* 콘텐츠와 footer가 겹치지 않도록 wrapper에 하단 패딩 추가 */
    .wrapper {
      min-height: 100%;
      position: relative;
      padding-bottom: 160px; /* footer 높이에 맞춰 조절 */
    }
    header, main {
      /* 필요에 따라 추가 스타일 적용 */
    }
    /* 고정된 footer 스타일 */
    footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: #fff;
      padding: 40px 0;
      font-family: 'Pretendard-Regular', sans-serif;
      box-shadow: 0 -1px 3px rgba(0,0,0,0.1);
    }
    /* footer 내부 컨테이너 및 영역 스타일 */
    .footer-container {
      width: 1300px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    .footer-links {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      font-size: 14px;
      color: #666;
    }
    .footer-links .left-links,
    .footer-links .right-links {
      display: flex;
      gap: 30px;
    }
    .footer-links .right-links {
      gap: 20px;
    }
    .footer-links a {
      text-decoration: none;
      color: #666;
    }
    .footer-info {
      border-top: 1px solid #ddd;
      padding-top: 20px;
      font-size: 13px;
      color: #999;
      line-height: 1.6;
    }
    .footer-info strong {
      color: #333;
    }
    .footer-social {
      display: flex;
      gap: 15px;
      margin-top: 10px;
    }
    .footer-social a {
      text-decoration: none;
      color: #666;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <header>
      <%-- 헤더 내용 또는 header.jsp 포함 --%>
      <jsp:include page="header.jsp" />
    </header>
    <main>
      <%-- 본문 내용 또는 body.jsp 포함 --%>
      <jsp:include page="body.jsp" />
    </main>
  </div>
  <footer>
    <div class="footer-container">
      <!-- 상단 링크 영역 -->
      <div class="footer-links">
        <div class="left-links">
          <a href="#">회사소개</a>
          <a href="#">이용약관</a>
          <a href="#">개인정보처리방침</a>
          <a href="#">자주 묻는 질문</a>
        </div>
        <div class="right-links">
          <span>고객센터: 1588-1234</span>
          <a href="#">1:1 문의하기</a>
        </div>
      </div>
      <!-- 하단 회사 정보 영역 -->
      <div class="footer-info">
        <p>
          <strong>(주)오늘뭐해?</strong> | 대표자: 홍길동 | 사업자등록번호: 123-45-67890 | 통신판매업신고: 제2025-서울강남-0000호
        </p>
        <p>
          주소: 서울특별시 강남구 테헤란로 123 (오늘뭐해? 빌딩) | 대표번호: 1588-1234 | 이메일: cs@oneulmohae.co.kr
        </p>
        <p>
          © 2025 <strong>오늘뭐해?</strong> All Rights Reserved.
        </p>
      </div>
      <!-- 소셜 미디어 영역 -->
      <div class="footer-social">
        <a href="#">페이스북</a>
        <a href="#">인스타그램</a>
        <a href="#">트위터</a>
      </div>
    </div>
  </footer>
</body>
</html>
