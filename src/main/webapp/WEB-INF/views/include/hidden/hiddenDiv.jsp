<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- 히든 로그인 폼 -->
<div id="login_wrap">
	<div id="loginForm" onload=function()>
		<h1 align="center">로그인</h1><div class="closeLog">X</div><br>
		<form method="post" action="login" name="loginFrm">
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
			<div id="loginButton"><input type="submit" value="로그인"></div>
			
			<div id="bottom">
			<div id="join">회원가입</div>
			<div id="find" onClick="findAcount();" style="cursor:pointer;">아이디/비밀번호 찾기</div>
			</div>
		</form>
	</div>
</div> 



	<div id="help_wrap">
		<h1 style="text-align:center;">구조요청 게시판 양식</h1><div class="closeLog">X</div><br><hr>
		<h5>유기견, 유기묘를 보호하고 계신분이나 <br>
		목격하신분들은 1:1상담 카톡이나 아래 내용을 작성해주세요.</h5>
		<form name="hell" method="post">
			<table id="help_tb">
				<tr>
					<td width="80px" style="text-align:center;">주소</td>
					<td colspan="3">
						<select name="address1">
							   <option value="-1">선택해주세요.</option>
							   <c:forEach var="list" items="${adds}" varStatus="status">
							 	  	<option value="${status.count}" >${list}</option>
							   </c:forEach>
						</select> 
					</td>			
				</tr>
				<tr>
					<td style="text-align:center;">이름</td>
					<td><input type="text" name="name" size="5" style="border:1px solid silver"></td>
					<td width="120px" style="text-align:center;">연락처</td>
					<td><input type="text" name="phone" size="9" style="border:1px solid silver"></td>
				</tr>
				<tr>
					<td colspan="4" style=""><textarea rows="20" cols="53" name="content" 
					placeholder = "아이를 발견한 날짜와 나이, 상태 등을 아는대로 적어주세요." style="resize:none;"></textarea></td>
				</tr> 				
			</table>
			
			<div id="btn119" onclick="help_chk()">
			구조요청
			</div>
		</form>
	</div>
	
	<div id="toclose" onclick="go_close_help()">XX</div>
	<div id="help_icon"></div>