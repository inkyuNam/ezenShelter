<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>

	
		<div id="blank"></div>		
			<div class="borderlist">
				<h2>1:1 문의 </h2>
				<table id="obo_board">
					<tr style="background-color: rgb(186, 227, 216);">
						<td>작성일</td>
						<td>유형</td>
						<td>제목</td>
						<td>아이디</td>
						<td>답변상태</td>
					</tr>

					<c:forEach var="posting" items="${list_n}">
						<tr>
							<td><fmt:formatDate value="${posting.indate}" type="date"/></td>
							<td>
								<c:if test="${posting.qa_sel==1}">
									입양문의
								</c:if>
								<c:if test="${posting.qa_sel==2}">
									상품문의
								</c:if>
							</td>
							<td><div onclick="location.href='adminQnaDetail?qa_num=${posting.qa_num}'" style="cursor:pointer;">
									${posting.qa_title}</div></td>
							<td>${posting.id }</td>
							<td>${posting.result}</td>
						</tr>
					</c:forEach>

				</table>
			</div><br>
		
		
		<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
				<c:url var="action" value="adminQnalist"/>
				<c:if test="${paging1.prev}">
					<a href="${action}?page=${paging1.beginPage-1}">◀</a>&nbsp;
				</c:if>
				<c:forEach begin="${paging1.beginPage}" end="${paging1.endPage}" var="index">
					<c:choose>
						<c:when test="${paging1.page==index}">
							<span style="color:red;">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${action}?page=${index}">${index}</a>&nbsp;
						</c:otherwise>	
					</c:choose>
				</c:forEach>
				<c:if test="${paging1.next}">
					<a href="${action}?page=${paging1.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
		
		
			
			<div id="blank"></div>		
			<div class="borderlist">
				<h2>1:1 문의 (조치 완료) </h2>
				<table id="obo_board">					
					<tr style="background-color: rgb(186, 227, 216);">
						<td>WriteDate</td>
						<td>Title</td>
						<td>id</td>
						<td>result</td>
					</tr>

					<c:forEach var="posting" items="${list_y}">
						<tr>
							<td><fmt:formatDate value="${posting.indate}" type="date"/></td>
							<td><div onclick="location.href='adminQnaDetail?qa_num=${posting.qa_num}'"} style="cursor:pointer;">
									${posting.qa_title}</div></td>
							<td>${posting.id }</td>
							<td>${posting.result}</td>
							<!-- <td>{posting.답변유무 }</td> -->
						</tr>
					</c:forEach>

				</table>
			</div><br>
			
			<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
				<c:url var="action" value="adminQnaList"/>
				<c:if test="${paging2.prev}">
					<a href="${action}?qnapage=${paging2.beginPage-1}">◀</a>&nbsp;
				</c:if>
				<c:forEach begin="${paging2.beginPage}" end="${paging2.endPage}" var="index">
					<c:choose>
						<c:when test="${paging2.page==index}">
							<span style="color:red;">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${action}?qnapage=${index}">${index}</a>&nbsp;
						</c:otherwise>	
					</c:choose>
				</c:forEach>
				<c:if test="${paging2.next}">
					<a href="${action}?qnapage=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>

</body>
</html>