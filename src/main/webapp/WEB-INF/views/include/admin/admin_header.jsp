<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>    
    <link rel="stylesheet" href="/admin/admin.css">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Jua&display=swap" rel="stylesheet">
    
    <script src="main/script/jquery-3.6.0.js"></script>
    <script src="/admin/admin.js"></script>
    
</head>

<body>


		
<div id="wrap">
    <div id="head">
        <div class="logo">
            <a href="adminmain"><img src="main/images/logo.png" width="200" height="70"></a>
        </div>
        
       <div id="menubar">
            <ul class="menues">
                <a href="adminHelplist"><li><div style="position:relative">구조 요청<div class="smallAndRed">${help_cnt}</div></div></li></a>
                <a href="adminPetlist"><li><div style="position:relative">펫리스트<div class="smallAndRed">${pet_cnt}</div></div></li></a>
                <a href="adminShelter"><li><div>보호소 정보</div></li></a>
                <a href="adminProduct"><li><div>상품</div></li></a>
                <a href="adminQnalist""><li><div style="position:relative">문의<div class="smallAndRed">${qna_cnt}</div></div></li></a>
                <a href="adminBoard"><li><div>게시판</div></li></a>
                <a href="adminLogout"><li>로그아웃</li></a>
            </ul>
        </div>
    </div>
    <div id="clear"></div>
    
        
	