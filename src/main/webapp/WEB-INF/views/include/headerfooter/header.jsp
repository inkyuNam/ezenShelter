<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠,쉼터</title>    
<link  rel="stylesheet" href="/css/main/main.css">
<link  rel="stylesheet" href="/css/board/board.css">   
<script type="text/javascript" src="/script/main.js"></script>

</head>
<body>	
<div id="wrap">

    <div id="head">
        <div class="logo">
            <a href="/"><img src="/images/logo.png" width="200" height="70"></a>
        </div>
        
       <div id="menubar">
            <ul class="menues">
            	<li><a href="company">회사소개</a></li>
                <a href="adopt_procudure"><li>입양공고</li></a>
                <a href="board"><li>후기 게시판</li></a>
                <a href=""><li>이젠샵</li></a>
            <c:choose>
					<c:when test="${empty loginUser}">
					<div id="log"><li style="margin-left: 220px; cursor:pointer;"><a href="loginForm">로그인</a></li></div>
					</c:when>
					
					<c:otherwise>	
					<li><a href="mypage">[${loginUser.name}(${loginUser.id})] 님</a></li>
					<li><a href="logout">로그아웃</a></li>
					</c:otherwise>
			</c:choose>
             
            </ul>
        </div>
    </div>
    <div id="clear"></div>
    

        
	