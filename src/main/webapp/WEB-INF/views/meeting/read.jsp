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
			height: auto;
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
			width: 180px;
			height: 270px;
			margin: 50px 20px 0 20px;
			border: 5px solid #1E62C8;
			border-radius: 10px;
			box-sizing: border-box;
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
			width: 950px;
			height: 300px;
			overflow: hidden;
			margin: 30px 0;
			text-align: center;
		}
		
		#imgMain {
			/* object-fit: cover; */
			/* object-fit: contain; */
			width: 100%;
            object-position: center;
            height: 100%;
            object-fit: cover;
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
	        width: 950px;
	        margin-left: 220px; /* 수정 */
	        display: grid; /* 변경 */
	        grid-template-columns: 700px 250px; /* 추가 */
	        grid-template-rows: auto 50px; /* 추가 */
	        gap: 0px; /* Adjust gap between grid items if needed */
	    }

	    #titleAndCon {
	        width: 700px;
	        /* overflow: hidden; */
	        min-height: 400px;
	        box-sizing: border-box;
	    }

	    #infoBox {
	        width: 250px; /* 추가 */
	        overflow: hidden;
	        box-sizing: border-box;
	        min-height: 500px;
	    }
	    
	    #participationBox {
	        height: 50px;
	        width: 950px; /* 추가 */
	        border: 1px solid #1E62C8;
	        overflow: hidden;
	        grid-column: 1 / span 2; /* 추가 */
	        display: flex;
    		align-items: left;
	    }
		
		#title {
			font-size: 32px;
            font-weight: bold;
            color: #0D0143;
		}
		
		#locAndDateBox {
			margin-top: 5px;
			color: #505050;
		}
		
		#content {
			margin-top: 20px;
			margin-left: 20px;
		}
		
		#capacityBox {
			font-size: 20px;
			color: #616161;
			font-weight: bold;
			text-align: right;
			margin: 5px 5px 0 0;
		}
		
		#mapBox {
			margin-top: 50px;
			width: 250px;
			height: 250px;
			border: 5px solid #616161;
			box-sizing: border-box;
		}

		#locationBox {
			padding: 3px 0 0 3px;
			font-size: 18px;
			color: #616161;
			font-weight: bold;
		}
		
		#locationBox > span {
			display: block;
		}
		
		.imgParticipants {
			width: 40px;
			height: 40px;
			margin: 5px;
		}
		
		#imgArrow {
			width: 40px;
			height: 40px;
			margin: 5px;
			margin-left: auto;
		}
		
		#bottomBox {
			height: 100px;
			display: flex;
		    justify-content: space-between; /* 아이템들을 양 끝으로 정렬 */
		    align-items: center; /* 아이템들을 수직 가운데 정렬 */
		    padding: 0 20px; /* 좌우 패딩 추가 */
		}
		
		#btnDelete {
			width: 120px;
			height: 35px;
			border: none;
			background-color: #1E62C8;
			color: white;
			border-radius: 5px;
			font-size: 18px;
		}
		
		#imgWish {
			width: 50px;
			height: 50px;
		}
		
		#imgWish:hover {
			cursor: pointer;
		}
		
		#btnShare {
			width: 60px;
			height: 30px;
			border: none;
			background-color: #99C2FE;
			color: white;
			border-radius: 5px;
			font-size: 16px;
		}
		
		#btnParticipate {
			width: 150px;
			height: 60px;
			border: none;
			background-color: #1E62C8;
			color: white;
			border-radius: 5px;
			font-size: 24px;
		}

        #rightBox {
            display: flex; /* 오른쪽 요소들을 묶어서 Flexbox로 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
            gap: 10px; /* 요소들 사이의 간격 조절 (원하는 값으로 변경) */
        }
        
        #btnParticipate:hover, #btnShare:hover, #btnDelete:hover, #btnBackward:hover {
        	cursor: pointer;
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
						홍길동홍길동홍길동홍
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
				<div id="title">
					4월 3일 역삼에서 삼겹살 드실 3명 구해봅니다!
				</div> 
				<div id="locAndDateBox">
					<span>장소 : 
						<span>서울특별시</span> /
						<span>강남구</span>
					</span>
					<span>
					&ensp;&ensp;&ensp;시간 :
						<span>4</span>월
						<span>3</span>일
						<span>19</span> :
						<span>20</span>
					</span>
				</div>
				
				<div id="content">
					🆕노는게 제일 좋은 뽀로로들의 모임🆕<br>
					🫧텃새 절대 없는 따듯하고 젠틀한 모임입니다<br>
					🫧신입분들 적응 어렵지않도록 잘 챙겨드려요😊<br>
					🫧단순 술만 아닌,맛집,카페,운동,문화생활도 함께 해요<br>
					<br>
					✅가입 후 가입인사 즉시 작성해주세요 :)<br>
					✅가입인사 삭제될 시 자진탈퇴 부탁드립니다<br>
					✅고품격 원앤온리 프리미엄 모임을 위해 외모는 조금 볼게요😉<br>
					✅오픈채팅방 필참으로 운영되는 모임입니다<br>
					<br>
					🎄뽀로로 자격요건🎄<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
					-인성, 외모 자기관리 하시는 분<br>
					-남자 키 173cm, 여자 키 155cm 이상<br>
				</div> 
			</div>
			
			<div id="infoBox">
				<div id="capacityBox">
					<span>모집인원 : </span>
					<span>3</span>
					<span>명</span>
				</div>
				<div id="mapBox">
				</div>
				<div id="locationBox">
					<div>
						장소명 : 역삼 홍콩 반점인데 홍콩 반점아님홍콩콩박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기박스밀기
					</div>
				</div>
			</div>
			
			<div id="participationBox">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="imgParticipants">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="imgParticipants">
				<img alt="프로필이미지" src="/lighting/images/icon.png" class="imgParticipants">
				<img alt="화살표" src="/lighting/images/arrow.png" id="imgArrow">
			</div>
		</div><!-- contentBox -->
		
		<div id="bottomBox">
			<button type="button" id="btnDelete">모임 삭제 🗑️</button>
			<div id="rightBox">
                <img alt="찜" src="/lighting/images/찜하기전버튼.png" id="imgWish" onclick="toggleImage();">
                <button type="button" id="btnShare">공유</button>
                <button type="button" id="btnParticipate">참석하기</button>
            </div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1697336f6cbeae05fbfbf1920de091c"></script>
	<script>

	function toggleImage() {
        const img = document.getElementById("imgWish");
        // getAttribute로 실제 지정한 src 값을 가져옴
        if (img.getAttribute("src") === "/lighting/images/찜하기전버튼.png") {
            img.setAttribute("src", "/lighting/images/찜하기버튼.png");
        } else {
            img.setAttribute("src", "/lighting/images/찜하기전버튼.png");
        }
    }
	
	$.ajax({//게시글에 저장된 위치 정보가져오기(마커) >> 맵 중앙에 띄우기 + 마커 박기 + 이동, 스크롤, 확대 금지
        url: '/lighting/meeting/getmap.do',
        type: 'GET',
        data: 'tblMeetingPostSeq=',
        dataType: 'json',
        success: function(result) {

        	result.forEach(function(latLon) {

        		/* member 활동지역 좌표 가져오기 */
                //GetActivityRegionCoordinate
                let activityRegionLatitude = latLon.latitude;
                let activityRegionLongitude = latLon.longitude;
                
                const container = document.getElementById('map');
        		const options = {
        			center: new kakao.maps.LatLng(activityRegionLatitude, activityRegionLongitude),
        			level: 4
        		};
        	
        		const map = new kakao.maps.Map(container, options); //map 만들기
        		
        		let m1 = null;
        		let info = null;
        		
        		kakao.maps.event.addListener(map, 'click', function(evt) {
        			
        			if (m1 != null) {
        				//기존 마커가 존재O > 삭제
        				m1.setMap(null);
        				m1.setImage(null);
        			}
        			
        			let latitude = evt.latLng.getLat();
        			let longitude = evt.latLng.getLng();
        			
                    $('#latitude').val(latitude);//위도, 경도 할당
                    $('#longitude').val(longitude);

        			m1 = new kakao.maps.Marker({
        				position: evt.latLng
        			});
        			
        			//이미지 마커
        			const path = '/lighting/images/찜하기버튼.png';
        			const size = new kakao.maps.Size(32, 32);
        			const op = {
        				offset: new kakao.maps.Point(16, 32)
        			};
        			
        			const img = new kakao.maps.MarkerImage(path, size, op);
        			
        			m1.setImage(img);
        			m1.setMap(map);
        		});//작성자에게는 마커로 보여주고 마커의 위치값 저장
                
        	});
        },
        error: function(a, b, c) {
            console.error(a,b,c);
        }
    });
	
	</script>
	
</body>
</html>
