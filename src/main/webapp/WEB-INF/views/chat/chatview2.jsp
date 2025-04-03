<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 채팅 애플리케이션</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .button-group {
        margin-bottom: 10px;
    }
    .button-group button {
        padding: 8px 12px;
        margin-right: 5px;
        cursor: pointer;
    }
    .button-group button.active {
        background-color: #007BFF;
        color: #fff;
    }
</style>
</head>
<body>
    <h2>실시간 채팅방</h2>
    
    <!-- 회원 시퀀스를 숨겨서 전달 (session 또는 request에서 받아온 값) -->
    <input type="hidden" id="tblMemberSeq" value="${tblMemberSeq}" />
    
    <div class="button-group">
    <c:forEach var="room" items="${chatRooms}">
        <button type="button" class="toggle-btn" 
                data-chatroom="${room.tblChatRoomSeq}" 
                data-nickname="${room.nickname}">
            ${room.nickname}와 채팅하기
        </button>
    </c:forEach>
</div>

    <!-- 채팅 메시지가 출력되는 영역 -->
    <div id="chatBox" style="width:500px; height:300px; border:1px solid #000; overflow-y:scroll; padding:5px;">
    </div>
    
    
    <!-- 메시지 전송 폼 -->
    <form id="chatForm">
        <input type="text" id="nickname" name="nickname" placeholder="닉네임"  /><br/><br/>
        <!-- 채팅방 생성 버튼 -->
        <button type="button" id="createChatRoomBtn">채팅방 생성</button><br/><br/>
        <textarea id="content" name="content" placeholder="메시지를 입력하세요..." rows="3" cols="50" required></textarea><br/><br/>
        <button type="submit">전송</button>
    </form>
    
    <script>
    var ws;
    var currentRoom = "";
    
    // 버튼 클릭 시 채팅방 선택 및 WebSocket 연결 설정
    $('.toggle-btn').click(function(){
        // 버튼 활성화 처리
        $('.toggle-btn').removeClass('active');
        $(this).addClass('active');
        
        // 채팅방 번호와 닉네임 설정
        currentRoom = $(this).data('chatroom');
        $('#nickname').val($(this).data('nickname'));
        
        // 기존 WebSocket 연결이 있다면 종료
        if(ws && ws.readyState === WebSocket.OPEN) {
            ws.close();
        }
        
        // WebSocket 연결 생성 (URL은 서버 환경에 맞게 수정)
        var wsUrl = "ws://" + window.location.host + "/lighting/chat/" + currentRoom;
        ws = new WebSocket(wsUrl);
        
        ws.onopen = function() {
        	console.log("WebSocket 연결 성공: 채팅방 " + currentRoom);
        };
        
        ws.onmessage = function(event) {
            var data = JSON.parse(event.data);
            var currentNickname = $('#nickname').val();
            var senderDisplay = (data.sender === currentNickname) ? "나" : data.sender;
            var chatBox = document.getElementById("chatBox");
            chatBox.innerHTML += "<p><strong>" + senderDisplay + " : </strong> " + data.content + " <em>(" + new Date(data.timestamp).toLocaleTimeString() + ")</em></p>";
            chatBox.scrollTop = chatBox.scrollHeight;
        };
        
        ws.onclose = function() {
            console.log("WebSocket 연결 종료");
        };
        
        ws.onerror = function(error) {
            console.error("WebSocket 오류", error);
        };
    });
    
    // 메시지 전송 이벤트 처리
    $('#chatForm').submit(function(e){
        e.preventDefault();
        if(!ws || ws.readyState !== WebSocket.OPEN) {
            console.error("WebSocket 연결이 되어있지 않습니다.");
            return;
        }
        var sender = $('#nickname').val();
        var content = $('#content').val();
        var message = JSON.stringify({ sender: sender, content: content });
        ws.send(message);
        $('#content').val('');
    });
    
 // 채팅방 생성 버튼 클릭 이벤트 처리
    $('#createChatRoomBtn').click(function(){
        var nickname = $('#nickname').val().trim();
        var tblMemberSeq = $('#tblMemberSeq').val();

        // 입력된 닉네임과 기존 버튼의 data-nickname(대소문자 무시) 비교
        var found = false;
        $('.toggle-btn').each(function(){
            if ($(this).data('nickname').toLowerCase() === nickname.toLowerCase()){
                found = true;
                $(this).click();
                return false;
            }
        });
        
        // 존재하지 않을 경우 AJAX 요청으로 새 채팅방 생성
        if(!found){
        	var createUrl = "${pageContext.request.contextPath}/ChatRoomCreateServlet";
            $.ajax({
                url: createUrl,
                type: "POST",
                data: {
                    tblMemberSeq: tblMemberSeq,
                    nickname: nickname
                },
                dataType: "json",
                success: function(response){
                    if(response.tblChatRoomSeq) {
                        // 동적으로 새로운 버튼 추가 후 클릭 이벤트 실행
                        var newButton = $('<button type="button" class="toggle-btn" data-chatroom="' 
                            + response.tblChatRoomSeq + '" data-nickname="' + nickname + '">'
                            + nickname + '와 채팅하기</button>');
                        $('.button-group').append(newButton);
                        newButton.click();
                    } else {
                        console.error("채팅방 생성 실패");
                    }
                },
                error: function(err) {
                    console.error("채팅방 생성 요청 오류", err);
                }
            });
        }
    });
 
    </script>
</body>
</html>
