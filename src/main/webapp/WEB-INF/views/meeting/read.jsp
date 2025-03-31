<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>  
	<meta charset="UTF-8">
	<title>오늘어때?</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		main {
			width: 1300px;
			heigth: auto;
			margin: 0 auto;
			background-color: #F9F7FF;
			overflow: hidden;
			padding-top: 100px;
		}
		
		main > hr {
			border: 1.2px solid #1E62C8;
			margin: 0;
		}
		
		#topBox {
			height: 400px;
			display: flex;
		}
		
		#hostBox {
			width: 200px;
			height: 250px;
			margin: 50px 20px 0 20px;
			border: 5px solid #1E62C8;
			border-radius: 10px;
		}
		
		#hostBox > h1 {
			text-align: center;
			margin: 10px 0 20px 0;
		}
		
		#imgProfile {
			width: 100px;
			height: 100px;
			margin: auto auto 5px auto;
			display: block;
		}
		
		#imgIcon {
			width: 25px;
			height: 25px;
		}
		
		#hostInfoBox, #hostEvaluationBox {
			text-align: center;
		}
		
		#imgStar {
			width: 25px;
			height: 25px;
		}
		
	    #hostEvaluationBox > span {
        	vertical-align: middle;
		}

		#imgStar {
			vertical-align: bottom;
		}
		
		#imgMainBox {
			width: 900px;
			height: 300px;
			overflow: hidden;
			margin: 30px 0;
			text-align: center;
		}
		
		#imgMain {
			/* object-fit: cover; */
			/* object-fit: contain; */
			width: 100%;
		}
		
		#btnBox {
			margin-top: 30px;
			width: 150px;
			text-align: center;
		}
		
		#btnBackward {
			width: 100px;
			height: 30px;
			background-color: #1E62C8;
			color: white;
			border: none;
			border-radius: 5px;
		}
		
		#contentBox {
			width: 910px;
			margin-left: 250px;
		}
		
		#titleAndCon {
			border: 1px solid black;
			width: 700px;
			display: inline-block;
			overflow: hidden;
		}

		#infoBox {
			border: 1px solid orange;
			width: 200px;
			display: inline-block;
			overflow: hidden;
		}
		
		#participationBox {
			height: 100px;
			border: 1px solid #1E62C8;
			overflow: hidden;
			display: inline-block;
		}

	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main>
		<hr>
		<div id="topBox">
			<div id="hostBox">
				<h1>모임장</h1>
				<img alt="프로필이미지" src="/lighting/images/icon.png" id="imgProfile">
				<div id="hostInfoBox">
					<img alt="등급" src="/lighting/images/마스터.png" id="imgIcon">
					<span>
						홍길동
					</span>
					<span>
						(hong123)
					</span>
				</div>
				<div id="hostEvaluationBox">
					<img alt="등급" src="/lighting/images/별점.png" id="imgStar">
					<span>
						4.2점
					</span>
				</div>
			</div>
			
			<div id="imgMainBox">
				<img alt="메인이미지" src="/lighting/images/basic맛집술.png" id="imgMain">
			</div>
			<div id="btnBox">
				<button type="button" id="btnBackward">
					<b>⇐ 이전 화면</b>
				</button>
			</div>
		</div><!-- topBox -->
		
		<div id="contentBox">
			<div id="titleAndCon">
				<h1 id="maintitle">4월 3일 역삼에서 삼겹살 드실 3명 구해봅니다!</h1> 
				<h2 id="subtitle">장소 : 서울 / 강남구&ensp;&ensp;&ensp;시간 : 4월 3일 19:00</h2>
			
				<div id="textbox">
					<p>🆕노는게 제일 좋은 뽀로로들의 모임🆕
					🫧텃새 절대 없는 따듯하고 젠틀한 모임입니다
					🫧신입분들 적응 어렵지않도록 잘 챙겨드려요😊
					🫧단순 술만 아닌,맛집,카페,운동,문화생활도 함께 해요
					
					✅가입 후 가입인사 즉시 작성해주세요 :)
					✅가입인사 삭제될 시 자진탈퇴 부탁드립니다
					✅고품격 원앤온리 프리미엄 모임을 위해 외모는 조금 볼게요😉
					✅오픈채팅방 필참으로 운영되는 모임입니다
					
					🎄뽀로로 자격요건🎄
					-인성, 외모 자기관리 하시는 분
					-남자 키 173cm, 여자 키 155cm 이상</p>
				</div> 
			</div>
			
			<div id="infoBox">
				<h2 id="subtitle_2">모집인원 : 3명</h2>
				지도
			</div>
			
			<div id="participationBox">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="Participants">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="Participants">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="Participants">
				<img alt="화살표" src="/lighting/images/arrow.png" id="Participants_arrow">
			</div>
		</div><!-- contentBox -->
		
		
		<button type="button" id="delete">모임삭제</button>
		
		<div id="participate">
		<img alt="찜하기" src="/lighting/images/찜하기전버튼.png" id="Steaming" onclick="toggleImage()">
		<!-- <img alt="찜하기" src="./images/찜하기버튼.png" class="Steaming" onclick="toggleImage()"> -->
		<button type="button" id="share">공유</button>
		<button type="button" id="Join_button">참석신청</button>
		</div> <!-- participate -->
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	<script>


	function toggleImage() {
        const img = document.getElementById("Steaming");
        // getAttribute로 실제 지정한 src 값을 가져옴
        if (img.getAttribute("src") === "/lighting/images/찜하기전버튼.png") {
            img.setAttribute("src", "/lighting/images/찜하기버튼.png");
        } else {
            img.setAttribute("src", "/lighting/images/찜하기전버튼.png");
        }
    }
	</script>
	
</body>
</html>
