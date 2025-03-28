<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<style>  

    .body {
        width:1300px;
        height:auto;
        align-content:center;
        display: flex;  
        flex-direction: column;
        margin: 0 auto;
    }

#logo {  
        
        width: 220px;  
        height: auto;  
        margin-bottom: 20px; /* 로고와 다음 요소 사이의 간격 */  
        position: relative;
        top: 20px; /* 상단 20px 떨어지게 */  
        left: 20px; /* 왼쪽 20px 떨어지게 */  
    }  

    .header {  
        font-size: 15px;  
        color: #888;  
        cursor: pointer;  
        display: flex; /* 수평으로 나열하기 위해 flex 사용 */  
        justify-content: flex-end; /* 오른쪽 정렬 */  
        width: calc(100% - 40px);
        text-decoration: none;
    }  

    #userinfo {  
        display: flex; /* 유저 정보 항목 수평 정렬 */  
        gap: 20px; /* 링크 간의 간격 */ 
        position: relative;
        bottom: 50px;
        text-decoration: none;
    }  

    .search-container {  
        display: flex;  
        justify-content: center;  
        align-items: center;
        padding-top : 50px;  
    }  

    .search-box {  
        width: 700px;  
        height: 50px;  
        padding: 7px 35px 7px 15px;   
        border: none;   
        border-radius: 30px;   
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);  
    }  

    .search-button {  
        background: none;  
        border: none;  
        cursor: pointer;  
        margin-left: -60px; /* 검색창과 버튼의 간격 조정 */  
    }  

    .search-button img {  
        width: 30px;  
        height: 30px;  
        color: rgb(13, 1, 67);  
    }  
</style>  

<header class="body">  
    <img alt="로고" src="/lighting/images/logo_가로.png" id="logo">  
    <div class="header">  
        <div id="userinfo">  
            <a id="login" href="/lighting/login/login.do">LOGIN</a>  
            <a id="logout" href="">LOGOUT</a>  
            <a id="join" href="">JOIN</a>  
            <a id="mypage" href="">MY PAGE</a>  
        </div>  
    </div>  
    <div class="search-container">  
        <input type="text" class="search-box" placeholder="&ensp;&ensp;모임을 검색해 보세요." />  
        <button class="search-button" onclick="performSearch()">  
            <img src="/lighting/images/search.png" alt="Search">
        </button>  
    </div>  
</header>
