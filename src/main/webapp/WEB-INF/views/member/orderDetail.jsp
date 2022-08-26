<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>

<style type="text/css">
table{
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.2;
  margin: 10px 50px;
  margin-left: auto; 
  margin-right: auto;
}
table, th {
  width: 530px;
  padding: 5px;
  font-weight: bold;
  vertical-align: top;
  color: black;
  background: #b8dbb194 ;
}
table, td {
  width: 780px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
</style>

<article>
	<h2>My Page(주문 상세 정보)</h2>
	<form>
		<h3> 배송지 정보 </h3>
		<table id="cartList">
			<tr><th>주문일자</th><th>주문번호</th><th>수령자</th><th>주문총액</th></tr>
			<tr><td><fmt:formatDate value="${Recipient.indate}" type="date"/></td>
				<td align="center"> ${Recipient.oseq} </td><td>${Recipient.mname}</td>
				<td><fmt:formatNumber type="currency" value="${totalPrice}"/></td>
			</tr>
			<tr>
				<th style="height:100px;">배송지</th><td>${Recipient.address1}</td><th>상세주소</th><td>${Recipient.address2}</td>
		</table>
		<br><br>
		<h3>주문 상품 정보</h3>
		<table id="cartList">
			<tr><th>상품명</th><th>상품별 주문번호</th><th>수량</th><th>가격</th><th>처리 상태</th></tr>
			<c:forEach items="${orderVO}" var="orderVO">
				<tr><td><a href="productDetail?pseq=${orderVO.pseq}">${orderVO.pname}</a></td>
					<td align="center">${orderVO.odseq}</td>
					<td>${orderVO.quantity}</td>
					<td><fmt:formatNumber type="currency" value="${orderVO.price2 * orderVO.quantity}"/>
					<td>
						<c:choose>
							<c:when test='${orderVO.result eq "1"}'>결제 대기</c:when>
							<c:when test='${orderVO.result eq "2"}'>결제 완료</c:when>
							<c:when test='${orderVO.result eq "3"}'>배송중</c:when>
							<c:otherwise><span>배송 완료</span>
							<input type="button" value="후기 작성" onClick="reviewProduct()"></c:otherwise>							
						</c:choose>
						<script type="text/javascript">
								function reviewProduct(){								
									var opt = "toolbar=no,menubar=no,resizable=no,width=530,height=220,left=800px,top=300px";
									window.open('reviewProductForm' , 'addReview', opt);
								}
						</script>
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</form>
</article>


<%@ include file="../include/headerfooter/footer.jsp" %>