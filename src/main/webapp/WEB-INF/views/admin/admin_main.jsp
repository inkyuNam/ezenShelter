<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>

	<div id="blank"></div>
		
			<div class="borderlist">
				<h2>1:1 문의 </h2>
				<table id="obo_board">
					<tr style="background-color: rgb(186, 227, 216);">
						<td>WriteDate</td>
						<td>Title</td>
						<td>id</td>
						<td>result</td>
					</tr>

					<c:forEach var="posting" items="${qna_n}" end="2">
						<tr>
							<td><fmt:formatDate value="${posting.indate}" type="date"/></td>
							<td><div onclick="location.href='adminQnaDetail?qa_num=${posting.qa_num}'" style="cursor:pointer;">
									${posting.qa_title}</div></td>
							<td>${posting.id}</td>
							<td>
							<c:if test="${posting.answer == null}">
							n
							</c:if>
							</td>
						</tr>
					</c:forEach>

				</table>
				<c:if test="${fn:length(qna_n) > 3}">
						외 ${fn:length(qna_n)-3} 건의 문의가 남아있음.
				</c:if>
			</div>
	
	<div id="blank"></div>
	<!-- 이 아래는 구조요청이 들어갈 것. 또는 위로 -->
		<div class="borderlist">
				<h2>Help게시판</h2>
				<table id="obo_board">
					<tr style="text-align: right; background-color: #ffb8b8;;">
						<td>작성 날짜</td>
						<td>이름</td>
						<td colspan="2">내용</td>
						<td>answer</td>
					</tr>
					<c:forEach var="posting" items="${help_n}" end="2">
						<tr>
							<td><fmt:formatDate value="${posting.writedate}" type="date"/></td>
							<td>${posting.h_name } 님</td>
							<td colspan="2" >
								<div onclick="location.href='adminHelpDetail?h_num=${posting.h_num}'" 
									style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:320px; cursor:pointer;">${posting.h_content}</div>
							</td>
							<td>${posting.result }</td>
						</tr>
						</c:forEach>										
				</table>
				
					<c:if test="${help_cnt > 3}">
						외 ${help_cnt -3} 건의 구조요청이 남아있음.
					</c:if>
			</div>
		
		</div>

</body>
</html>