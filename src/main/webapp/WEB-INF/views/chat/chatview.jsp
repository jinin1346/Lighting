<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 애플리케이션</title>
<!-- jQuery 라이브러리 (CDN 이용) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <h2>채팅방</h2>
    <!-- 채팅 메시지가 출력되는 영역 -->
    <div id="chatBox" style="width:500px; height:300px; border:1px solid #000; overflow-y:scroll; padding:5px;">
        <!-- 서버로부터 전달받은 메시지들이 여기에 표시됩니다 -->
    </div>
    <!-- 메시지 전송 폼 -->
    <form id="chatForm">
        <input type="text" id="nickname" name="nickname" placeholder="받는 사람의 닉네임" required value="상냥한숲03"/><br/><br/>
        <textarea id="message" name="message" placeholder="메시지를 입력하세요..." rows="3" cols="50" required></textarea><br/><br/>
        <button type="submit">전송</button>
    </form>
    
    
    <script>
$(document).ready(function(){
    // 채팅 메시지를 불러오는 함수
    function loadMessages(){
        $.ajax({
            url: '/lighting/chat/chat.do',
            type: 'GET',
            dataType: 'json',
            data: { nickname: $('#nickname').val() },
            success: function(data){
                var chatBox = $('#chatBox');
                chatBox.empty();
                $.each(data, function(index, message){
                    chatBox.append('<p><strong>' + message.sender + ':</strong> ' + message.message + ' <em>(' + message.timestamp + ')</em></p>');
                });
            },
            error: function(a, b, c) {
                console.error(a,b,c);
            }
        });
    }
    
    // 일정 시간마다 채팅 내용을 갱신 (3초 간격)
    setInterval(loadMessages, 3000);
    
    // 폼 전송 시 AJAX로 메시지 전송
    $('#chatForm').submit(function(e){
        e.preventDefault();
        var nickname = $('#nickname').val();
        var message = $('#message').val();
        $.ajax({
            url: '/lighting/chat/chat.do',
            type: 'POST',
            data: { nickname: nickname, message: message },
            success: function(){
                $('#message').val('');
                loadMessages();
            },
            error: function(a, b, c) {
            	console.error(a,b,c);
            }
        });
    });
});
</script>


</body>


</html>
