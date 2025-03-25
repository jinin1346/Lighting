<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        /* 공통 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Pretendard-Regular', sans-serif;
        }
        
        ul {
	    list-style:none;
	   }
        
        /* 전체 배경 흰색 */
        body {
            background-color: #fff;
        }
        
        /* 가운데 컨테이너 */
        .container {
            width: 1300px;              /* 고정 너비 */
            min-height: 100vh;          /* 화면 전체 높이를 최소로 사용 */
            margin: 0 auto;             /* 가로 중앙 정렬 */
            background-color: #f9f7ff;  /* 배경색 */
            padding: 40px 20px;         /* 내부 여백 */
            position: relative;
        }

        /* 로고/타이틀 영역 */
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #0d6efd; /* 필요 시 색상 변경 */
            margin-bottom: 30px;
        }
		#logo {
		    position: absolute;
		    left: 30px;
		    top: 22px;
		    width: 250px;
		    height: auto;
		    cursor: pointer;
		  margin-bottom: 30px;
		}
        /* 안내 문구 */
        .signup-title {
            font-size: 18px;
            /* font-weight: bold; */
            line-height: 1.4;
            text-align: center;   /* 텍스트를 중앙 정렬 */
            margin: 60px auto 50px;   /* 상하 간격 지정 */
        }

        /* 단계 표시(01, 02, 03 등) */
        .step-indicator {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 5px;
            font-size: 14px;
            color: #888;
            
        }
        .step-indicator span {
             padding: 5px 10px;
            text-align : center;
            margin : auto 50px;
             /* border : 1px solid black; */
        }
        
		/* 진행 바*/
		#progress {
		      width : 550px;
		      height: 7px;
		      display: block;   
		      margin: 0 auto;
		      margin-bottom : 50px;
		      /* border: 1px solid #999; */
		      border-radius: 10px;
		      overflow: hidden;
		      -webkit-appearance: none;
                appearance: none;
		}
		
		#progress::-webkit-progress-bar {
		    background-color: white; 
		    border-radius: 10px;
		    /* border: 1px solid #999; */
		}
		
		progress::-webkit-progress-value {
		    background-color: #1e62c8; /* change to your desired fill color */
		    border-radius: 10px 0 0 10px; /* rounds only the left side; adjust if you want full rounding when 100% */
		}
		

        /* 회원가입 폼 */
        .signup-form {
            max-width: 600px;
            margin: 0 auto;
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
		        
        
        /* 라벨 & 인풋 구역 */
        .form-group {
            width : 700px;
            border : 1px solid black;
            display: flex;
            flex-direction: column;
        }

        .input-group {
		    display: flex;
		    align-items: center;
		    gap: 10px; /* 간격 조절 */
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

        /* 아이디 중복체크 버튼 */
        .btn-idcheck {
            margin-top: 6px;
            width: 120px;
            padding: 8px;
            background-color: #1e62c8;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* 회원가입 완료 버튼 */
        .btn-submit {
            width: 100%;
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
        <div class="logo">
            <img alt="로고" src="images/logo_가로.png" id="logo">
        </div>
        
        <!-- 안내 문구 -->
        <div class="signup-title">
            회원가입을 위해<br>아래 <b>정보를 입력</b>해주세요.
        </div>
        
        <!-- 단계 표시 (01, 02, 03 등) -->
        <div class="step-indicator">
            <span>이용약관 동의<br>01</span>
            <span>회원정보 입력<br>02</span>
            <span>회원가입 완료<br>03</span>
        </div>
        <progress id="progress" value="60" min="10" max="100"></progress>
        

        
        <!-- 회원가입 폼 -->
        <form class="signup-form" action="yourSignupAction.do" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름(한글 2~20자)" required>
            </div>
            
            <div class="form-group">
			    <label for="userid">아이디</label>
			    <div class="input-group">
			         <input type="text" id="userid" name="userid" placeholder="영문, 숫자, 특수문자 4~20자" required>
			         <button type="button" class="btn-idcheck">중복체크</button>
			    </div>
			</div>
            
            
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="영문, 숫자, 특수문자 4~20자" required>
            </div>
            
            <div class="form-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="confirm-password" name="confirmPassword" placeholder="비밀번호 재입력" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="예) example@email.com">
            </div>
            
            <div class="form-group">
                <label for="phone">연락처</label>
                <input type="text" id="phone" name="phone" placeholder="예) 010-1234-5678">
            </div>
            
            <div class="form-group">
                <label for="city">주소(시/도)</label>
                <select id="city" name="city">
                    <option value="">시/도 선택</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="인천">인천</option>
                    <option value="광주">광주</option>
                    <option value="대전">대전</option>
                    <option value="울산">울산</option>
                    <option value="세종">세종</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청북도">충청북도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="전라남도">전라남도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="경상남도">경상남도</option>
                    <option value="제주도">제주도</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="district">주소(구/군)</label>
                <input type="text" id="district" name="district" placeholder="구/군 입력">
            </div>
            
            <!-- 회원가입 버튼 -->
            <button type="submit" class="btn-submit">회원가입 완료</button>
        </form>
    </div>
</body>
</html>
