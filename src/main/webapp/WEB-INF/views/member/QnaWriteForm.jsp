<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>

<style type="text/css">
select{margin:-10px 0px 20px 0px; width:70px; height:30px;}
h3{font-weight:100;}
table tr {line-height:1.5; }
table th {font-weight:40;}
#qnaSubmit:hover{border:1px solid #061f5c}
#qnaCancel:hover{border:1px solid #061f5c}
</style>

<article>
<div class="main-area">
<h2> 1:1 문의 게시판 </h2>
	<h3> 1:1 문의 게시판입니다. 문의 내용을 상세히 기입해주세요.</h3>    
<form name="form" method="post"	action="qnaWrite">
	<input type="hidden" name="id" value="${loginUser.id}">
	<fieldset style="border-radius:30px; border:1px dotted gray;"> 
	<table>
		<tr>&nbsp;&nbsp;
		<input type="radio" name="qa_sel" value="1" checked>입양문의
		<input type="radio" name="qa_sel" value="2">상품문의</tr>
        <tr><th>작성자&nbsp;</th><td><span class="thick">${loginUser.id}</span><th>작성일&nbsp;</th><td><span class="thick">${qnaVO.indate}</span>
        <tr><th>제목&nbsp;</th><td><input type="text" name="qa_title" size="60" style="border:1px solid rgb(207, 207, 207) ;"></td></tr>
        <tr><th>내용&nbsp;</th><td><textarea cols="70" rows="20" name="qa_content" style="border:1px solid rgb(207, 207, 207); resize:none;"></textarea></td>       
    </table>
	</fieldset>
	<div class="clear"></div>
	<div id="button" style="margin:20px 400px;">
	
		<input type="submit" value="등록하기" class="submit" id="qnaSubmit"
		style="width:110px; height:30px; border-radius:10px; background-color:white; color:black;
		font-size:15px; cursor:pointer; border:1px solid gray; float:left;"> 
		
		<input type="reset"   value="취소하기"     class="cancel" id="qnaCancel"
		style="width:110px; height:30px; border-radius:10px; background-color:white; color:black;
		font-size:15px; cursor:pointer; border:1px solid gray;"
			onClick="location.href='mypageQna'">
	</div>
</form>
</div>
</article>
<div class="clear" style="clear:both;"></div>
<%@ include file="../include/headerfooter/footer.jsp" %>