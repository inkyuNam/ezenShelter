<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>
<div id="mypagelistwrap">
	<table>
		<caption>주문 내역</caption>
		<colgroup>
			<col width="15%">
			<col width="30%">
			<col width="25%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<tr style="height: 40px">
			<th>주문 일자</th>
			<th>상품명</th>
			<th>계좌..?</th>
			<th>결제금액</th>
			<th>배송 현황</th>
		</tr>
		<c:forEach items="${newList}" var="order">
			<tr>
				<td><fmt:formatDate value="${order.indate}" pattern="yyyy-MM-dd"/></td>
				<td><a href="orderDetail?oseq=${order.oseq}">${order.pname}</a></td>
				<td>농협 이젠(주)<br>123-456789</td>
				<td>${order.price2} 원</td>
				<td>
					<c:if test="${order.result eq '1'}">
						결제 대기
					</c:if>
					<c:if test="${order.result eq '2'}">
						결제 완료
					</c:if>
					<c:if test="${order.result eq '3'}">
						배송중
					</c:if>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	
	
	<br>
	<br>
	<br>

	<table>
		<caption>지난 주문 내역</caption>
		<colgroup>
			<col width="20%">
			<col width="50">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<tr style="height: 40px">
			<th>주문일자</th>
			<th>상품이름</th>
			<th>결제 금액</th>
			<th>배송 현황</th>
		</tr>		
		
		<c:forEach items="${oldList}" var="order">
			<tr>
				<td><fmt:formatDate value="${order.indate}" pattern="yyyy-MM-dd"/></td>
				<td><a href="orderDetail?oseq=${order.oseq}">${order.pname}</a></td>
				<td>${order.price2} 원</td>				
				<td>
					<c:if test="${order.result eq '4'}">
						배송 완료
					</c:if>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</div>

<%@ include file="../include/headerfooter/footer.jsp" %>