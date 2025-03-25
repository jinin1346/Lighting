<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입약관</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   #logo1 { width: 150px;}
	   #tx {text-align: center; font-size: 20px; /* border: 1px solid black; */}
	   
	   *{
		  margin:0; padding:0;
		  font-size:15px; 
		  line-height:1.3;
		}
		ul{list-style:none;}
		.tabmenu{ 
		  max-width:600px; 
		  margin: 0 auto; 
		  position:relative; 
		}
		.tabmenu ul{
		  position: relative;
		}
		.tabmenu ul li{
		  display:  inline-block;
		  width:33.33%; 
		  float:left;  
		  text-align:center; 
		  background :#f9f9f9;
		  line-height:40px;
		}
		.tabmenu label{
		  display:block;
		  width:100%; 
		  height:40px;
		  line-height:40px;
		}
		.tabmenu input{display:none;}
		.tabCon{
		  display:none; 
		  width: 100%;
		  text-align:left; 
		  padding: 20px;
		  position:absolute; 
		  left:0; top:40px; 
		  box-sizing: border-box; 
		  border : 5px solid #f9f9f9;
		}
		.tabmenu input:checked ~ label{
		  background:#ccc;
		}
		.tabmenu input:checked ~ .tabCon{
		  display:block;
		}
	    
	</style>
</head>
<body style="background: rgb(249,248,255);">
	<!-- registerrole.jsp -->
    <div id="div1"><img alt="" id="logo1" src="/lighting/asset/images/a.webp"></div>
    <div id="tx">회원가입을 위해 <br> 아래 서비스 <b>이용약관에 동의</b>해주세요.</div> 
	<div class="tabmenu out-tabmenu">
  <ul>
    <li id="tab1" class="btnCon"> 
      <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">이용약관동의<br>01</label>
      <div class="tabCon" >
        
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
      
      </div>
      
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">회원정보입력<br>02</label>
      <div class="tabCon" >It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</div>
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">회원가입완료<br>03</label>
      <div class="tabCon" >There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div>
      
    </li>
  </ul>
</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>