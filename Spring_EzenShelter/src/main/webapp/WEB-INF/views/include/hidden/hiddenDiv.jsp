<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- 히든 로그인 폼 -->
<div id="login_wrap">
	<div id="loginForm" onload=function()>
		<h1 align="center">로그인</h1><div class="closeLog">X</div><br>
		<form method="post" name="loginFrm">
			<div id="line">
			<div id="id">
				<input class="login" name="id" type="text" maxlength="20" placeholder="아이디">
			</div>
			<div id="pwd">
				<input class="login" name="pwd" type="password" placeholder="비밀번호">
			</div>
			</div>
			<div id="message">${message}</div>
			<div id="loginButton" onClick="loginCheck()">
			    로그인
			</div>
			
			<div id="bottom">
			<div id="join">회원가입</div>
			<div id="find" onClick="findAcount();" style="cursor:pointer;">아이디/비밀번호 찾기</div>
			</div>
		</form>
	</div>
</div> 