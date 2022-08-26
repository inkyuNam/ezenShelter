<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠,쉼터</title>    
<script src="/script/jquery-3.6.0.min.js"></script>
<link  rel="stylesheet" href="/css/main/mobileMain.css">
<link  rel="stylesheet" href="/css/adopt/mobileAdopt.css">
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
            	<li><a href="CompanyM">회사소개</a></li>
                <a href="adopt_procudureM"><li>입양공고</li></a>
                <a href="boardM"><li>후기 게시판</li></a>
                <a href="shoppingM"><li>이젠샵</li></a>
            <c:choose>
					<c:when test="${empty loginUser}">
					<div id="log"><li style="margin-left: 220px; cursor:pointer;">로그인</li></div>
					</c:when>
					
					<c:otherwise>	
					<div style="position:absolute; bottom:0px; right:580px;"><a href="cartlist"><img src="/images/cart.png" style="width:50px; height:50px;"></a></div>
					<li><a href="mypageM">[${loginUser.name}(${loginUser.id})] 님</a></li>
					<li><a href="logoutM">로그아웃</a></li>
					</c:otherwise>
			</c:choose>
             
            </ul>
        </div>
    </div>
    <div id="clear"></div>
    
    
<!-- 히든 로그인 폼 -->
<!-- 로그인 폼 -->
<div id="login_wrap">
	<div id="loginForm" onload=function()>
		<h1 align="center">로그인</h1><div class="closeLog">X</div><br>
		<form method="post" action="loginM" name="loginFrm">
			<div id="line">
			<div id="id">
				<input class="login" name="id" type="text" maxlength="20" placeholder="아이디">
			</div>
			<div id="pwd">
				<input class="login" name="pwd" type="password" placeholder="비밀번호">
			</div>
			</div>
			<div id="message">${message}</div>
			<input type="hidden" id="msg" value="${message}">
			<div style="text-align:center;"><input type="submit" id="loginButton" value="로그인"></div>
			
			<div id="bottom">
			<div id="join">회원가입</div>
			<div id="find" onClick="findAcount();" style="cursor:pointer;">아이디/비밀번호 찾기</div>
			</div>
		</form>
	</div>
</div> 
	
<!-- 회원가입 약관 -->

<div id="terms">
<h1 style="text-align:center">약관 동의</h1><div class="closeLog">X</div><br>
<form id="join" method="post" name="terms">
이젠 유기견 입양홈페이지 약관 안내 페이지입니다.<br><br>			
<textarea rows="15" cols="53"  style="align:center;"spellcheck= "false" style="align: center; resize:none;"  readonly >
가. 개인정보의 수집 및 이용 목적&#10;&#10;① 이젠쉼터는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.&#10;
1. 이젠쉼터 서비스 제공을 위한 회원관리 1) 공간정보 다운로드, 오픈API 신청 및 활용 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 개인정보를
처리합니다. 나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법&#10;
① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.&#10;
② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.&#10;
③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.&#10;
④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.&#10;
⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.&#10;
⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.&#10;
다. 수집하는 개인정보의 항목 ① 국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호
라. 개인정보의 보유 및 이용기간   ① 국가공간정보포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
1. 국가공간정보포털 회원정- 수집근거: 정보주체의 동의   - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
- 보존근거: 정보주체의 동의   마. 동의 거부 권리 및 동의 거부에 따른 불이익
위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.				
</textarea>			
<br><br>
<div style="text-align:center;">
	<input type="radio" name="okon" value="0">동의함&nbsp;&nbsp;
	<input type="radio" name="okon" value="1"checked>동의안함
</div>
	<input type="button" value="확인" onClick="go_next();" style="float:right;">
</form>
</div>