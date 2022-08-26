<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp" %>





<div><a href="newshelter">새 보호소 추가</a></div>
<!-- 기존 보호소 나열  -->
<table>
	<c:forEach items="${list}" var="shelter">
		<tr><td><!-- 반복이 정상적으로 되고있다는거 확인. --> </td></tr>
	</c:forEach>
</table>	
