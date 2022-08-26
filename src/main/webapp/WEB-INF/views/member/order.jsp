<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function update_ship(){
		var frm = document.frm;
		if(frm.box.checked==true){
			frm.name.value="${member.name}";
			frm.phone.value="${member.phone}";
			frm.address1.value="${member.address1}";
			frm.address2.value="${member.address2}";
		}else{
			frm.name.value="";
			frm.phone.value="";
			frm.address1.value="";
			frm.address2.value="";
		}
	}

</script>
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
</head>
<body>
<br>
<table style="margin-left:auto; margin-right:auto;">
	<tr><th colspan="4">주문자 정보</th></tr>
	<tr><th>주문자 이름</th><td>${member.name}</td><th>연락처</th><td>${member.phone}</td></tr>
	<tr><th> 주소 </th><td>${member.address1 }</td><th>상세주소</th><td>${member.address2}</td></tr>
</table>	
<br><hr><br>
<form name="frm" method="post" action="spell">
	<input type="hidden" name="id" value="${member.id}">
	<table style="margin-left:auto; margin-right:auto;">
		<tr><th colspan="4">배송지 정보</th></tr>
		<tr><td colspan="4">배송지 정보가 주문자와 같음 <input type="checkbox" name="box" onchange="update_ship()"></td></tr>
		<tr>	<th>수령자 이름</th><td><input type="text" name="name" value=""></td>
				<th>연락처</th><td><input type="text" name="phone" value=""></td>
		</tr>
		<tr>	<th> 주소 </th><td><input type="text" name="address1" value=""></td>
				<th>상세주소</th><td><input type="text" name="address2" value=""></td>
		</tr>
	</table>
	<br><hr><br>
	
	<table style="margin-left:auto; margin-right:auto;">
		<tr><th>상품 이미지</th><th>이름</th><th>갯수</th><th>가격</th></tr>
		<c:forEach items="${cartlist}" var="cart">
			<input type="hidden" name="cseq" value="${cart.cseq}">
			<tr>	<td>${cart.image}</td><td>${cart.pname}</td>
					<td>${cart.quantity}</td><td>${cart.price2 * cart.quantity} 원</td>
			</tr>
		</c:forEach>
		<tr><th colspan="3" align="right">총 주문 금액</th><td>${totalPrice} 원</td>
		<tr><th colspan="3" align="right">결제 방식</th><td>무통장입금 <input type="radio" checked="checked"></td></tr>
	</table>
	<div style="position: relative;width: 200px;margin-left: 800px;">
	<input type="submit" value="결제하기" onclick="#">	<!-- 바로 마이페이지 주문 현황으로 -->
	<input type="button" value="다시 선택하기" onclick="location.href='cartlist'">
	</div>
</form>

<%@ include file="../include/headerfooter/footer.jsp" %>