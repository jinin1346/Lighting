<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <meta charset="UTF-8">
<head>
  <title>회원가입</title>
  <style>
    /* 공통 스타일 초기화 */
    @font-face {  
    font-family: 'Pretendard-Regular';  
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');  
    font-weight: 400;  
    font-style: normal;  
}  
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Pretendard-Regular';
    }
    ul {
      list-style: none;
    }
    /* 전체 배경 흰색 */
    body {
      background-color: #fff;
    }
    /* 가운데 컨테이너 */
    .container {
      width: 1300px;
      min-height: 100vh;
      margin: 0 auto;
      background-color: #f9f7ff;
      padding: 40px 20px;
      position: relative;
    }
    

    #logo {
      /* display: block; */
      /* width: 200px;
      margin: 0 auto;
      cursor: pointer;
      margin-bottom: 30px; */
      position: absolute;
      left: 0; 
      top: 0;
      width: 250px;
      margin: 15px 0 0 15px;
    }

    /* 안내 문구 */
    .signup-title {
        font-size: 30px;
        text-align: center;
        display: block;
        position: relative;
        top: 50px;
    }

    /* 진행 바 */
     #stepBox{
      width: 550px;
      height: auto;
      display: block;
      margin: 0 auto 50px auto;
    } 
    #step{
      margin-top: 10px;
      text-align: center;
      margin-bottom: 10px;
      position: relative;
      left: -136px;
      top: 48px;
    }

    /* 회원가입 폼 */
    .signup-form {
      max-width: 500px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    /* 라벨 & 인풋 구역 */
    .form-group {
      width: 100%;
      display: flex;
      flex-direction: column;
    }
    .input-group {
      display: flex;
      align-items: center;
      gap: 0;
    }
    input:focus,
    textarea:focus,
    select:focus {
      outline: none;
      box-shadow: none;
    }
    
    input[type="text"], 
    button {
    height: 40px;
    box-sizing: border-box;
    font-size: 16px;
    line-height: 1;
    padding: 8px;
    vertical-align: middle;
    }
    
    /* 아이디 중복체크 및 이메일 인증 버튼 스타일 */
    .input-group .btn-idcheck,
    .input-group .btn-emailcheck {
      border: 1px solid #1e62c8;
      border-left: none;
      border-radius: 0 4px 4px 0;
      background-color: #1e62c8;
      color: #fff;
      padding: 10px 16px;
      cursor: pointer;
    }
    .form-group label {
      margin-bottom: 6px;
      font-weight: 500;
    }
    .form-group input,
    .form-group select {
      padding: 10px;
      border: 1px solid #1e62c8;
      border-radius: 4px;
      font-size: 14px;
    }
    .input-group input {
      border: 1px solid #1e62c8;
      border-right: none;
      border-radius: 4px 0 0 4px;
      flex: 1;
    }
    
    #gender{
        border : 1px solid #1e62c8;
        border-radius: 4px;
        font-size: 14px;
        padding: 10px;
        text-align: center;
        background-color:  #fff;
    }
    
    #gender #female{
        margin-left : 15px;
    }
    
    
    /* 라디오 버튼 및 체크박스 기본 간격 조정 */
    .form-group div {
      margin-top: 6px;
      text-align: center;
    }
    .form-group div label {
      margin-right: 7px;
    }

    .interest-tags{
      border : 1px solid #1e62c8;
      border-radius: 4px;
      font-size: 14px;
      padding: 10px;
      text-align: center;
      background-color:  #fff;
    }

    /* 회원가입 완료 버튼 */
    #btnSubmit {
      width: 100%;
      margin: 50px auto;
      padding: 15px;
      background-color: #1e62c8;
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- 로고 영역 -->
    <a href="/lighting/main_test.do">
  <img alt="로고" src="/lighting/images/logo_가로.png" id="logo">
    </a>


    <!-- 안내 문구 -->
    <div class="signup-title">
      회원가입을 위해<br>아래 <b>정보를 입력</b>해주세요.
    </div>
    
    <!-- 단계 표시 -->
    <div id="stepBox">
      <img alt="단계" src="/lighting/images/약관동의_02.png" id="step">  
    </div>
    
    <!-- 회원가입 폼 -->
    <form class="signup-form" action="/lighting/login/registerok.do" method="post">
      <!-- 아이디 -->
      <div class="form-group">
        <label for="userid">아이디</label>
        <div class="input-group">
          <input type="text" id="userid" name="userid" placeholder="영문, 숫자, ‘_’ 사용 가능 4~20자" required>
          <button type="button" class="btn-idcheck">중복체크</button>
        </div>
      </div>
      
      <!-- 비밀번호 -->
      <div class="form-group">
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" placeholder="8~16자리, 영문+숫자+특수문자 조합" required>
      </div>
      
      <!-- 이름 -->
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" placeholder="실명 입력 (2~10자리, 한글만 입력 가능)" required>
      </div>
      
      <!-- 닉네임 -->
      <div class="form-group">
        <label for="nickname">닉네임</label>
        <input type="text" id="nickname" name="nickname" placeholder="2~10자리, 한글만 입력 가능" pattern="[가-힣]{2,10}" required>
      </div>
      
      <!-- 생년월일 -->
      <div class="form-group">
        <label for="birthdate">생년월일</label>
        <input type="text" id="birthdate" name="birthdate" placeholder="YYYYMMDD 형식으로 입력" pattern="\d{8}" required>
      </div>
      
      <!-- 연락처 -->
      <div class="form-group">
        <label for="phone">연락처</label>
        <input type="text" id="phone" name="phone" placeholder="11자리 숫자만 입력 가능 (‘-’ 없음)" required>
      </div>
      
      <!-- 이메일 -->
      <div class="form-group">
        <label for="email">이메일</label>
        <div class="input-group">
          <input type="email" id="email" name="email" placeholder="예) example@email.com" required>
          <button type="button" class="btn-emailcheck">인증받기</button>
        </div>
      </div>
      
      <!-- 성별 선택 -->
      <div class="form-group">
        <label>성별</label>
        <div id = "gender">
          <input type="radio" id="male" name="gender" value="남성" required>
          <label for="male">남성</label>
          <input type="radio" id="female" name="gender" value="여성" required>
          <label for="female">여성</label>
        </div>
      </div>
      
      
      <div class="form-group">
                <label>주소</label>
                <div style="display: flex; gap: 10px;">
                    <select id="city" name="city" style="flex: 1;">
                        <option value=""disabled selected>시/도 선택</option>
                        <option value="서울">서울</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>
                        <option value="인천">인천</option>
                        <option value="경기도">경기도</option>
                    </select>
                    <select id="district" name="district" style="flex: 1;" disabled>
                        <option value="">구/군 선택</option>
                    </select>
                </div>
            </div>
      
      
      
      <!-- 관심 태그 선택 (최대 2개) -->
      <div class="form-group">
        <label>관심 태그 (최대 2개 선택 가능)</label>
        <div class="interest-tags">
            <input type="checkbox" id="food" name="interest" value="맛집">
            <label for="food">맛집</label>
            <input type="checkbox" id="game" name="interest" value="게임">
            <label for="game">게임</label>
            <input type="checkbox" id="culture" name="interest" value="문화">
            <label for="culture">문화</label>
            <input type="checkbox" id="sports" name="interest" value="스포츠">
            <label for="sports">스포츠</label>
            <input type="checkbox" id="self" name="interest" value="자기계발">
            <label for="self">자기계발</label>
            <input type="checkbox" id="healing" name="interest" value="힐링">
            <label for="healing">힐링</label>
        </div>
      </div>
      
      <!-- 회원가입 버튼 -->
      <button type="submit" id="btnSubmit">회원가입 완료</button>
    </form>
  </div>
  
  <script>
//시/도 선택에 따라 구/군 셀렉트 박스 제어
  const citySelect = document.getElementById("city");
  const districtSelect = document.getElementById("district");

  // 서울 구/군 옵션들
  const seoulDistrictOptions = `
      <option value="" disabled selected>구/군 선택</option>
      <option value="강남구">강남구</option>
      <option value="강동구">강동구</option>
      <option value="강북구">강북구</option>
      <option value="강서구">강서구</option>
      <option value="관악구">관악구</option>
      <option value="광진구">광진구</option>
      <option value="구로구">구로구</option>
      <option value="금천구">금천구</option>
      <option value="노원구">노원구</option>
      <option value="도봉구">도봉구</option>
      <option value="동대문구">동대문구</option>
      <option value="동작구">동작구</option>
      <option value="마포구">마포구</option>
      <option value="서대문구">서대문구</option>
      <option value="서초구">서초구</option>
      <option value="성동구">성동구</option>
      <option value="성북구">성북구</option>
      <option value="송파구">송파구</option>
      <option value="양천구">양천구</option>
      <option value="영등포구">영등포구</option>
      <option value="용산구">용산구</option>
      <option value="은평구">은평구</option>
      <option value="종로구">종로구</option>
      <option value="중구">중구</option>
      <option value="중랑구">중랑구</option>

  `;

  citySelect.addEventListener("change", function() {
      const selectedCity = this.value;
      if (selectedCity === "서울") {
          // 서울 선택 시 구/군 옵션 활성화
          districtSelect.innerHTML = seoulDistrictOptions;
          districtSelect.disabled = false;
      } else {
          // 서울이 아닐 경우 구/군 선택 불가능 및 안내 메시지 표시
          districtSelect.innerHTML = '<option value="">아직 서울만 지원합니다.</option>';
          districtSelect.disabled = true;
      }
  });

  
    // 관심 태그 체크박스 최대 2개 선택 제한
    const interestCheckboxes = document.querySelectorAll('.interest-tags input[type="checkbox"]');
    interestCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change', function() {
        let checkedCount = document.querySelectorAll('.interest-tags input[type="checkbox"]:checked').length;
        if (checkedCount > 2) {
          this.checked = false;
          alert("최대 2개까지 선택 가능합니다.");
        }
      });
    });
    
    
    $('#logo', '#btnSubmit').click(()=>{ 
        window.location.href='/main.do'//메인페이지로 이동
    });
  </script>
  
  <%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>
