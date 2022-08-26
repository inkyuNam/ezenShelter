<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<link  rel="stylesheet" href="/css/mypage/member.css">
<div id="topForm">
	<div style="position:absolute; left:0px; width:200px; font-size:160%; font-weight:bold;">회원탈퇴 안내</div>
	<div id="procedure">
	<ul>
	<li>1. 본인 확인</li>
	<li>2. 설문조사</li>
	<li class="this_step">3. 회원탈퇴 완료</li>
	</ul>
	</div>
</div><br><br><hr>
<div id="success">
	<h1 style="text-align:center;">회원탈퇴가 정상적으로 완료되었습니다.</h1>
	<p style="text-align:center; font-size:110%;">보다 나은 이젠으로 만나뵐 수 있기를 바랍니다.
	<div id="re" onClick="location.href='/'">메인으로</div>
</div>
<br><br><br>
<%@ include file="../include/headerfooter/footer.jsp" %>