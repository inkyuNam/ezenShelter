<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>


<div class="borderlist">
	<h2>Help 게시판</h2>
	<table id="obo_board">
		<tr style="text-align: right; background-color: #ffb8b8;">
			<td style="width:160px;">작성 날짜</td>
			<td style="width:160px;">이름</td>
			<td colspan="2">내용</td>
			<td style="width:160px;">result</td>
		</tr>
		
		
		<c:forEach var="posting" items="${help_n}">
			<tr>
				<td><fmt:formatDate value="${posting.writedate}" type="date"/></td>
				<td>${posting.h_name} 님</td>
				<td colspan="2" >
					<div onclick="location.href='adminHelpDetail?h_num=${posting.h_num}'" 
						style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:320px; cursor:pointer;">${posting.h_content}</div>
				</td>
				<td>${posting.result}</td>
			</tr>
		</c:forEach>

	</table>
</div>
		
		<div id="blank"></div>
	<div class="borderlist">
				<h2>Help 조치 완료 리스트</h2>
				<table id="obo_board">
					<tr style="text-align: right; background-color: #dbc8c8;">
						<td style="width:160px;">작성 날짜</td>
						<td style="width:160px;">이름</td>
						<td colspan="2">내용</td>
						<td style="width:160px;">result</td>
					</tr>
		
					<c:forEach var="posting" items="${help_y}">
						<tr>
							<td><fmt:formatDate value="${posting.writedate}" type="date"/></td>
							<td>${posting.h_name }</td>
							<td colspan="2" >
								<div onclick="location.href='adminHelpDetail?h_num=${posting.h_num}'" 
									style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:320px; cursor:pointer;">${posting.h_content}</div>
							</td>
							<td>${posting.result }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
				<c:url var="action" value="adminHelp"/>
				<c:if test="${paging.prev}">
					<a href="${action}&helppage=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:choose>
						<c:when test="${paging.page==index}">
							<span style="color:red;">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${action}&helppage=${index}">${index}</a>&nbsp;
						</c:otherwise>	
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next}">
					<a href="${action}&helppage=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>
			
	</div>
</body>
</html>