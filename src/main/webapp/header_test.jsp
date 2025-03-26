<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<style>
  .body {
    width: 1300px;
    height: auto;
    display: flex;  
    flex-direction: column;
    margin: 0 auto;
  }
  #logo {  
    width: 220px;  
    height: auto;  
    margin-bottom: 20px;
    position: relative;
    top: 20px;
    left: 20px;
  }
  .header {  
    font-size: 15px;  
    color: #888;  
    cursor: pointer;  
    display: flex;  
    justify-content: flex-end;  
    width: calc(100% - 40px);
    text-decoration: none;
  }
  #userinfo {  
    display: flex;  
    gap: 20px; 
    position: relative;
    bottom: 50px;
    text-decoration: none;
  }
  .search-container {  
    display: flex;  
    justify-content: center;  
    align-items: center;  
  }
  .search-box {  
    width: 700px;  
    height: 30px;  
    padding: 7px 35px 7px 15px;   
    border: none;   
    border-radius: 30px;   
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);  
  }
  .search-button {  
    background: none;  
    border: none;  
    cursor: pointer;  
    margin-left: -60px;
  }
  .search-button img {  
    width: 30px;  
    height: 30px;  
    color: rgb(13, 1, 67);  
  }
</style>
<header class="body">  
  <img alt="로고" src="images/logo_가로.png" id="logo">  
  <div class="header">  
    <div id="userinfo">  
      <a id="login" href="">LOGIN</a>  
      <a id="logout" href="">LOGOUT</a>  
      <a id="join" href="">JOIN</a>  
      <a id="mypage" href="">MY PAGE</a>  
    </div>  
  </div>  
  <div class="search-container">  
    <input type="text" class="search-box" placeholder="&ensp;&ensp;모임을 검색해 보세요." />  
    <button class="search-button" onclick="performSearch()">  
      <img src="images/search.png" alt="Search">
    </button>  
  </div>  
</header>
