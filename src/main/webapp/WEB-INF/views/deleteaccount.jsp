<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원탈퇴 모달</title>
<style>
       body {
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }
       .modal {
            background-color: rgb(249, 247, 255);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
            padding: 20px;
        }
        .icon {
            background-color: #1e62c8;
            border-radius: 50%;
            width: 90px;
            height:90px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 15px;
        }
        .icon img {
            width: 40px;
            height: 40px;
            filter: invert(100%);
        }
        .modal h2 {
            color: black;
            margin: 10px 0;
            font-size: 24px;
        }
        .modal p {
            margin-bottom: 20px;
            font-size: 17px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            font-size: 22px;
        }
        .btn-primary {
            background-color: #1e62c8;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); 
            border-radius: 8px;
        }
        .btn-secondary {
            background-color: #fff;
            color: #1e62c8;
            border: 1px solid #1e62c8;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); 
            border-radius: 8px;
        }
</style>
<script>
		//탈퇴 버튼 클릭 시 alert 띄우는 함수
		function showAlert() {
    	alert("탈퇴가 완료되었습니다.");
		}
</script>
</head>
<body>
   <div class="modal">
        <div class="icon">
            <img src="https://cdn-icons-png.flaticon.com/512/484/484662.png" alt="Trash Icon">
        </div>
        <h2>정말 탈퇴하시겠어요?</h2>
        <p>탈퇴 버튼 선택 시, 계정은 삭제되며 복구되지 않습니다.</p>
        <button class="btn btn-primary" onclick="showAlert()">탈퇴</button>
        <button class="btn btn-secondary">취소</button>
    </div>
</body>
</html>