<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>  
	<meta charset="UTF-8">
	<title>오늘어때?</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#headerContainer {
	width: 1300px;
	margin: 0 auto;
	height: auto;
	background-color: #f9f7ff;
}

.container {
	width: 1300px;
	margin: 0 auto;
	height: auto;
	padding: 20px;
	background-color: #f9f7ff;
}

.top-section {
	display: flex;
	justify-content: space-between;
	margin-bottom: 50px;
 	margin-right:5px;
	height:50px;
}

.left-section {
	 display: flex; /* Flexbox로 배치 */ 
	/* justify-content: space-between; */ /* 좌우 간격을 동일하게 */
	gap: 10px; /* 두 요소 사이에 간격을 설정 */
	width: 1300px; /* 부모 컨테이너의 너비에 맞게 설정 */
/* 	margin-left:50px; */
}

.left-section label {
	 display: block; 
	margin-bottom: 5px;
}

.left-section select, .left-section input {
/* 	width: 100px; */
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #1e62c8;
	border-radius: 4px;
}

.left-section textarea { 
	 width: 500px;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #1e62c8;
	border-radius: 4px; 
	margin-right: 7px; 
} 

.time-section {
	display: flex;
	gap: 10px;
	width: 150px;
	 margin-right: 10px; 
}

.time-section input {
	width: 150px;
	margin-right: 10px; 
}
#people {
    width: 100px; 
}

.middle-section {
	margin-top: 20px;
	 display: flex; 
	/* justify-content: space-between; */
	margin-right:10px;
	margin-left:30px;
}

.middle-section textarea {
	width: 900px;
	height: 500px;
	padding: 10px;
	border: 1px solid #1e62c8;
	border-radius: 4px;
	resize: vertical;
}

.middle-section .left-section {
	width: 60%;
	margin-right: 10px;
}

.middle-section .right-section {
	width: 400px;
}

#map {
	width: 440px; 
	height: 320px;
	background-color: white;
	border: 2px solid #6A6969;
	margin-left:10px;
}

.middle-section textarea {
	width: 900px;
	height: 550px;
	padding: 10px;
	border: 1px solid #1e62c8;
	border-radius: 4px;
	resize: vertical;
	margin-left:10px;
}

.buttons {
	margin-top: 95px; /* 지도와 버튼 사이의 간격 추가 */
	
	/* border: 1px solid black; */
	/* width: 500px; */
	margin-left:30px;
	
}

.buttons #loadPost {
    width: 230px;
    background-color: #4F8EEE;
    margin-right:7px;
    font-size: 14px;
}

.buttons #attend { /* 글 작성하기  */
    margin-top: 10px;
     width: 370px;
    background-color: #1E62C8;  
    height:45px;
    font-size: 18px;
}

.buttons #goBack {
	background-color: #C81E1E;
	width:130px;
	font-size: 14px;
	
}

.bottom-section {
	margin-top: 20px;
}

.bottom-section input {

	padding: 10px 20px;
	/* border: 1px solid #1e62c8; */
	border-radius: 4px;
}

.buttons button {
	padding: 10px 20px;
	/* margin-right: 10px; */
	background-color: #4CAF50;
	color: white;
	/* border: 1px solid #1e62c8; */
	 border-radius: 4px; 
	cursor: pointer;
	border: none;  /* 기존 border를 제거 */
}
.buttons button:nth-child(3) {
    
}

#categoryMain {
	width: 125px;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #1e62c8; /* 기본 테두리 색상 */
	border-radius: 4px;
	/* margin-right: 0px; */
}

#categorySub {
	width: 125px;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #1e62c8; /* 기본 테두리 색상 */
	border-radius: 4px;
	margin-right: 7px; 
	
}

#categoryMain:focus, #categorySub:focus {
	outline: none; /* 포커스를 클릭했을 때 생기는 기본 테두리 제거 */
	border: 1px solid #1e62c8; /* 포커스를 클릭했을 때도 원하는 테두리 색상 유지 */
}

/* 포커스 상태에서의 테두리 변경 */
textarea:focus, input:focus, button:focus, #title:focus {
	outline: none; /* 포커스를 클릭했을 때 생기는 기본 테두리 제거 */
	border: 1px solid #1e62c8; /* 테두리를 원하는 색상으로 유지 */
}

#title {
    width: 500px;
}

/* "장소" 텍스트 스타일 */
.location-text {
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
	margin-left:25px;
	color: #6A6969;
	
}
</style>
</head>
<body>
<div id="headerContainer">
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
</div>
	<div class="container">
		<!-- 상단 섹션 -->
		<div class="top-section">
			<div class="left-section">
				<select id="categoryMain">
					<option value="3" selected>맛집</option>
					<option value="2">게임</option>
					<option value="4">문화</option>
					<option value="1">스포츠</option>
					<option value="6">힐링</option>
					<option value="5">자기계발</option>
				</select>
				
                <select id="categorySub">
                    <option value="18" selected>식사</option>
                    <option value="19">카페</option>
                    <option value="20">디저트</option>
                    <option value="21">술</option>
                    <option value="22">비건</option>
                    <option value="23">기타</option>
				</select>
				
                <input type="text" id="title" placeholder="제목은 20자 이내로 입력 가능합니다." maxlength="20" required>

				<div class="time-section">
					<input type="date" id="date" required>
					<input type="time" id="time" required>
					<input type="number" id="people" placeholder="인원수" min="2" max="10" required>
				</div>
			</div>
		</div>

		<!-- 중간 섹션: 글 내용과 지도 -->
		<div class="middle-section">
			<!-- 왼쪽 중간: 글 내용 텍스트 영역 -->
			<div class="left-section">
				<textarea id="content" placeholder="글 내용을 입력하세요."></textarea>
			</div>

			<div>
				<!-- 오른쪽 중간: 지도 섹션 -->
				<div class="right-section">
					<div id="map">
						<!-- <img src="/lighting/images/치킨.jpg" alt="지도"
							style="width: 100%; height: 100%;"> -->
					</div>
					<div class="location-text">장소 : 역삼 남호식당 역삼 본점</div>
				</div>
				
				<!-- 하단 섹션 -->
				<div class="bottons-box">
	
					<div class="buttons">
						<button id="loadPost">내가 쓴 글 불러오기</button>
						<button id="goBack">돌아가기</button>
						<button id="attend">글 작성하기 </button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1697336f6cbeae05fbfbf1920de091c"></script>
    <script>
    	let categoryMain = document.getElementById("categoryMain");
	    let categorySub = document.getElementById("categorySub");
	
	    categoryMain.addEventListener("change", function() {
	        let tblCategoryMainSeq = categoryMain.value;
	
             $.ajax({
                url: '/lighting/meeting/getcategorysub.do',
                type: 'GET',
                data: 'tblCategoryMainSeq=' + tblCategoryMainSeq,
                dataType: 'json',
                success: function(result) {
                    
					while (categorySub.firstChild) {
                	categorySub.removeChild(categorySub.firstChild);
            		}

					result.forEach(function(subcategory) { 
                    let option = document.createElement('option');
                    option.value = subcategory.tblCategorySubSeq; 
                    option.text = subcategory.categoryName + subcategory.tblCategorySubSeq; 
                    categorySub.appendChild(option);
                    });
					
					categorySub.firstElementChild.setAttribute("selected", "selected");
					
                },
                error: function(a, b, c) {
                    console.error(a,b,c);
                }
            });

	    });
    
        function getToday() {
        	let today = new Date();
            let year = today.getFullYear();
            let month = (today.getMonth() + 1).toString().padStart(2, '0');
            let day = today.getDate().toString().padStart(2, '0');
            let min = year + '-' + month + '-' + day;
            return min;
        }
	    
        $('#date').attr('min', getToday());
        
        
        
        const container = document.getElementById('map');
		const options = {
			center: new kakao.maps.LatLng(37.4979, 127.0276), //member 활동지역 37.4979	127.0276
			level: 4
		};
	
		const map = new kakao.maps.Map(container, options);

    </script>
</body>
</html>


























