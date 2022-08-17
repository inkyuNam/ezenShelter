<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerfooter/header.jsp" %>


<br>
<form name="boardFrm" method="post">
<div id="searchWrap">
	<div id="tool">
	
	<select name="searchKind" style="width:100px; height:37px; font-size:100%; border:none; font-weight:bold; 
	color:#061f5c; border-radius:5px; background-color:#f0f2ef;">
			<option value="title" style="font-weight:bold;"> 제목</option>
            <option value="content" style="font-weight:bold;"> 내용</option>
            <option value="id" style="font-weight:bold;"> 아이디</option>
    </select>
       
	</div>
	<div id="inputSearch"><input id="searchInput" type="text" size="13" name="key" value="${key}"></div>
	<div id="searchGo" onClick="view_search('reviewBoard')">검&nbsp;색</div>
	<div id="listView" onClick="view_list('reviewBoard')">전체 목록</div>	
	
	
	<c:choose>
		<c:when test="${empty loginUser}">
			<div class="writeView" onClick="afterLogin();">글쓰기</div>
			<script type="text/javascript">
				function afterLogin(){
					alert("로그인 후 작성 가능합니다.");
				}
			</script>
		</c:when>
		<c:otherwise>
			<div class="writeView" onClick="location.href='reviewWriteForm'">글쓰기</div>
		</c:otherwise>
	</c:choose>	
	
</div>
</form><br>
	<div id="boardViewWrap">

	<c:choose>
	    	<c:when test="${boardListSize<=0}">
	    		<tr><td width="100%" colspan="7" align="center" height="23">검색 결과가 없습니다.</td></tr>
	    	</c:when>
	    	<c:otherwise>
		
				<c:forEach items="${boardList}" var="bl">
				<table id="reviewTable">
					<tr>
						<td id="boardImg" rowspan="2" style="border:none;"><img src="/upload/${bl.B_IMAGE}"/></td>
						<td id="boardTitle"><a href="reviewBoardDetail?num=${bl.B_NUM}">${bl.TITLE}</a></td>
					</tr>
					<tr>		
						<td id="boardInfo">작성자 : ${bl.ID} &nbsp;|&nbsp; 조회수 : ${bl.B_COUNT}<br>
						작성일 : <fmt:formatDate value="${bl.B_INDATE}"></fmt:formatDate></td>
					</tr>
				</table><br>
				</c:forEach>				
			</c:otherwise>
	</c:choose>
	
	<div id="boardPaging">
		<c:url var="action" value="board"/>
	
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
	
	
	
		

<%@ include file="../include/headerfooter/footer.jsp" %>