<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>


<div id="gocenter4">
		<h2> 1:1 문의 </h2>
		<c:if test="${qvo.result eq 'n' }">
			<table id="qna_detail">
				<tr>
					<td>id</td><td>${qvo.id}</td>
					<td>작성 날짜</td><td><fmt:formatDate value="${qvo.indate}" type="date"/></td>
				</tr>
				<tr>
					<td>제목</td><td>${qvo.qa_title }</td>
					<td>항목</td>
					<td>
					<c:if test="${qvo.qa_sel==1}">
						입양문의
					</c:if>
					<c:if test="${qvo.qa_sel==2}">
						상품문의
					</c:if>
					</td>
				</tr>
				<tr>
					<td>내용</td><td colspan="3"><div style=" width: 80%;height: 100%; margin-left:10%">${qvo.qa_content}</div></td>
				</tr>
				<tr>
					<td colspan="4"><textarea id="qna_answer"></textarea></td>
				</tr>		
			</table>
			<div class="help_bts" onclick="qna_answer(${qvo.qa_num})" style="float:right;">작성 완료</div>
		</c:if>
		
		<c:if test="${qvo.result eq 'y'}">
		
		<table id="qna_detail">
				<tr>
					<td>id</td><td>${qvo.id}</td>
					<td>작성 날짜</td><td><fmt:formatDate value="${qvo.indate}" type="date"/></td>
				</tr>
				<tr>
					<td>제목</td><td colspan="3">${qvo.qa_title }</td>
				</tr>
				<tr>
					<td>내용</td><td colspan="3"><div style=" width: 80%;height: 100%; margin-left:10%">${qvo.qa_content}</div></td>
				</tr>
				<tr>
					<td colspan="4"><textarea id="qna_answer" readonly="readonly">${qvo.answer}</textarea></td>
				</tr>		
			</table>
			
		
		</c:if>
		<div class="help_bts" onclick="location.href='adminQnalist'" style="float:right;">목록으로</div>
	
	</div>
</div>


</body>
</html>