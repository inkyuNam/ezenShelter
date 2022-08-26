<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>
<style type="text/css">

#qnaPaging{width:300px; font-size:100%;  margin:0 auto; text-align:center;}	

h2{font-weight:bold; font-size:30px}
h3{font-weight:200;}

table#obo_board{
    width: 800px;
    border-collapse: collapse;
    line-height: 24px;
	}
	#obo_board td,#obo_board th {
	    border-top:1px solid black;
	    border-bottom:1px solid black;
	    border-collapse: collapse;
	    text-align: left;
	    padding: 10px;
	}
	#obo_board th {
		background: rgb(221, 221, 221);
	}
	#write_obo_board{
	    text-decoration: none;
	    color: black;
	}
	#write_obo_board:hover{
	    text-decoration: underline;
	 
	}
	.return button{border: 1px solid black;  width: 200px; height: 50px; margin: 20px 350px; border-radius: 50px; font-size: 20px; background: white; transition: .5 ease;}
   .return button a{color: black; transition: .5 ease;}
    .return button:hover{transition: .5 ease; border: 2px solid #061f5c; background: transparent; background-color: #061f5c; color: white; cursor:pointer;}
  .return button a:hover{color: white; transition: .5 ease;}
</style>

<div class="main-area">
<h2> 1:1 문의 게시판 </h2>
<h3> 1:1 문의 게시판입니다. 문의 내용을 상세히 기입해주세요.</h3>

<input type="button" value="글 작성하기" class="submit" onClick="location.href='QnaWriteForm'">
<form name="form" method="post">
<table id="obo_board">
	<tr>	
		<th>번호</th><th>카테고리</th><th>제목</th><th>작성일</th><th>답변상태</th>
	</tr>
	<c:forEach items="${qnaList}"  var="qnaVO">
		<tr>
		<td> ${qnaVO.QA_NUM}</td>
		<td>
			<c:choose>
				<c:when test="${qnaVO.QA_SEL=='1'}"> 입양문의 </c:when>
				<c:when test="${qnaVO.QA_SEL=='2'}"> 상품문의 </c:when>
			</c:choose>
		</td>	
		<td><a href="qnaView?qnaNum=${qnaVO.QA_NUM}">${qnaVO.QA_TITLE}</a></td>
       		<td><fmt:formatDate value="${qnaVO.INDATE}" type="date"/></td>
       		<td><c:choose>
				<c:when test="${qnaVO.RESULT=='n'}"> no </c:when>
				<c:when test="${qnaVO.RESULT=='y'}"> yes </c:when>
			</c:choose></td>    
   		</tr>
  	</c:forEach>
</table>
</form>
<br>
<div id="boardPaging" style="text-align: center;">
		<c:url var="action" value="mypageQna"/>
	
		<c:if test="${paging.prev}">
			<a href="${action}?page=${paging.beginPage-1}">[이전]</a>&nbsp;		
		</c:if>
		
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="color:red">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="${action}?page=${index}">${index}&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.next}">
			<a href="${action}?page=${paging.endPage+1}">[다음]</a>&nbsp;	
		</c:if>
</div>


</div>


<div  class="clear" style="clear:both;"></div><br>



<%@ include file="../include/headerfooter/footer.jsp" %>