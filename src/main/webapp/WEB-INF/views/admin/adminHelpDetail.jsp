<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>

<div id="gocenter">
		<h1>구조요청 상세페이지</h1>
		<table id="help_detail">
			<tr>
				<td>이름</td>
				<td>${hvo.h_name}</td>
				<td>연락처</td>
				<td>${hvo.h_phone}</td>
				<td>작성시간</td>
				<td>${hvo.writedate}</td>
			</tr>
			<tr>
				<c:if test="${hvo.result eq 'n' }">
					<td colspan="6" style="background-color:#ffb8b8;">${hvo.h_content}</td>
				</tr>
				<tr>
					<td colspan="4"> 조치 전 </td>
					<td style="text-align:center;">
						<div class="help_bts" onclick="end_chk(${hvo.h_num})">완료</div>
					</td>
				</c:if>
				
				<c:if test="${hvo.result eq 'y' }">
					<td colspan="6" style="background-color:#bfbfbf;">${hvo.h_content}</td>
				</tr>
				<tr>
					<td colspan="4" > 조치 완료</td>
					<td style="text-align:center;"><div class="help_bts" onclick="del_chk(${hvo.h_num})">삭제</div></td>
				</c:if>
			
				
				<td style="text-align:center;">
					<div class="help_bts" onclick="location.href='adminHelplist'">목록으로</div>
				</td>
			<tr>
		</table>
	</div>
</div>

</body>
</html>