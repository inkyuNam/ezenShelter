<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/headerfooter/Mheader.jsp" %>

	<div class="main1" style="margin-top: 50px;">
        <!-- 슬라이드 영역 -->
        
        <div  id="slide1" style="position:relative;">
            <div id="slide" style="position:absolute;">
                <a href="reviewBoard"><img src="/images/infoimg2.jpg"  class="inimg" alt="" style="width: 760px" height="300px" ></a>
                <a href="adopt_procudure"><img src="/images/infoimg3.jpg"  class="inimg" alt="" style="width: 760px" height="300px" ></a>
                <a href="company"><img src="/images/infoimg1.jpg"  class="inimg" alt="" style="width: 760px" height="300px" ></a>
            </div>
        </div>
        <img src="/images/main.jpg">

	</div>
	
	<div id="toclose" onclick="go_close_help()">XX</div>
	<div id="help_icon"></div>
	
	<div id="help_wrap">
		<h1 style="text-align:center;">구조요청 게시판 양식</h1><div class="closeLog">X</div><br><hr>
		<h5>유기견, 유기묘를 보호하고 계신분이나 <br>
		목격하신분들은 1:1상담 카톡이나 아래 내용을 작성해주세요.</h5>
		<form name="hell" method="post" action="helpRequest">
			<table id="help_tb">		
				<tr>
					<td style="text-align:center;">이름</td>
					<td><input type="text" name="h_name" size="5" style="border:1px solid silver" value="${dto.h_name}"></td>
					<td width="120px" style="text-align:center;">연락처</td>
					<td><input type="text" name="h_phone" size="9" style="border:1px solid silver" value="${dto.h_phone}"></td>
				</tr>
				<tr>
					<td colspan="4" style=""><textarea rows="20" cols="53" name="h_content" 
					placeholder = "아이를 발견한 날짜와 나이, 상태 등을 아는대로 적어주세요." style="resize:none;">${dto.h_content}</textarea></td>
				</tr>	
			</table>
			<div style="position:absolute; left:160px;"><input type="submit" id="btn119" value="구조요청"></div>
			<div><input type="hidden" id="helpMsg" value="${msg}">${msg}</div>
		</form>
	</div>
	
<%@ include file="include/headerfooter/Mfooter.jsp" %>