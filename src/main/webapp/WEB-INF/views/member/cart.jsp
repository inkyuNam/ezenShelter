<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<script type="text/javascript">
	

function go_buy(){

	var frm = document.frm;
	var cnt = 0;
	
	if (frm.checked.length == undefined){ //단일
		if (frm.checked.checked==true)
	    	cnt++;
	} else{
		for(i=0; i<frm.checked.length; i++){
			if (frm.checked[i].checked==true)
				cnt++;
		 }
	}
	if(cnt==0)
		alert('체크박스에 체크를 한 뒤 진행 해주세요');
	else{
		frm.action="goOrder";
		frm.submit();
	}
}

function go_delete(){
	
	var frm = document.frm;
	var cnt = 0;
	
	if (frm.checked.length == undefined){ //단일
		if (frm.checked.checked==true)
	    	cnt++;
	} else{
		for(i=0; i<frm.checked.length; i++){
			if (frm.checked[i].checked==true)
				cnt++;
		 }
	}
	if(cnt==0)
		alert('체크박스에 체크를 한 뒤 진행 해주세요');
	else{
		frm.action="deleteCart";
		frm.submit();
	}
	
}

function cal_sum(){
	
	var sum = 0;
	if (frm.checked.length == undefined){ //단일
		if (frm.checked.checked==true)
	    	{}// sum = frm.price3.value;
	} else{
		for(i=0; i<frm.checked.length; i++){
			if (frm.checked[i].checked==true)
				{}//sum += frm.price3[i].value;
		 }
	}
	// sum 값을 총 가격에 넣기 (.html 뭐시기였던가)
}

</script>
<style type="text/css">
table{
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 50px;
  margin-left: auto; 
  margin-right: auto;
}
table, th {
  width: 155px;
  padding: 5px;
  font-weight: bold;
  vertical-align: top;
  color: black;
  background: #ce4869 ;
}
table, td {
  width: 780px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
</style>

<form name="frm">
	<table>
	<tr><th>주문번호</th><th>상품명</th><th>수량</th><th>총 가격</th><th>주문 / 삭제</th></tr>
		<c:forEach items="${CartList}" var="cvo">
			<tr>
				<td>${cvo.cseq}</td><td>${cvo.pname}</td><td>${cvo.quantity }</td>
				<td>${cvo.price2 * cvo.quantity}<input type="hidden" name="price3" value=""></td>
				<td>
					<c:choose>
						<c:when test="${cvo.stock != 0 }">
							<input type="checkbox" name="checked" checked value="${cvo.cseq}" onchange="cal_sum()">
						</c:when>
						<c:otherwise>	<!-- cart 테이블의 result를 품절 여부로? 해도 될거같은데 -->
							<input type="checkbox" name="checked" disabled>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan=3></td><td>총 가격</td><td><div name="total"></div></td></tr>
	</table>
	<div style="position:relative; width:150px;  left:70%;">
	<input type="button" name="" value="구매하기" onclick="go_buy()">
	<input type="button" name="" value="삭제하기" onclick="go_delete()">
	</div>
</form>
<%@ include file="../include/headerfooter/footer.jsp" %>