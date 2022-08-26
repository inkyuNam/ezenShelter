<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/headerfooter/header.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<article id="art">
<!------------------- 약관동의 ------------------->
<div class="contract">
	<h2 style="font-family: 'Jua', sans-serif;font-weight: 10; color: #061f5c; font-weight:bold;">
	정보 수집 동의 약관</h2>
	
	<form  method="post"  name="contractFrm" style="font-family: 'Gothic A1', sans-serif; font-weight: 400; color: #061f5c;">
		이젠보호소 의  회원님 개인신상에 관한 정보는<br> ‘정보통신망이용촉진 
		및 정보보호등에	관한 법률’에 의해 회원님의 동의없이<br> 제 3자에게 제공되지 않으며, 철저히 
		보호되고 있사오니 안심하고 이용하시기	바랍니다.<br><br>	
		
		<textarea rows="8" cols="90" style="font-family: 'Gothic A1', sans-serif; font-weight: 700; color: #061f5c;">
			① 개인정보를 제공받는 자 :  이젠쉼터
			
			② 개인정보를 제공받는 자의 개인정보 이용 목적 : 입양 및 분양
			 
			③ 제공하는 개인정보의 항목 : 성명, 전화번호, 생년월일,
			
			④ 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 예시)제공 후 1년
			
			⑤ 동의를 거부할 수 있으며,  동의 거부시 입양  서비스가 제공되지 않습니다.
		</textarea>	
		<br><br>
		<div id="agree" style="text-align: center;">
			<input type="hidden"  id="p_num" value="${p_num}" name="p_num" id="date">
			<input type="radio" name="okon" > 동의함 &nbsp; &nbsp; &nbsp;
			<input type="radio" name="okon" checked> 동의안함
			<!-- <input type="button" value="신청" class="submit" onClick="go_nexts(${p_num})" 
			style="margin-left: 250px; font-family: 'Gothic A1', sans-serif; font-weight: 700; color: #061f5c;" > -->
		</div><br><br><br>
		
<!------------------- 상담신청 ------------------->		
		<div id="ibyang2">
		<h1>상담신청서</h1>
				<input type="hidden" value="${p_num}" name="p_num">
				<label>상담날짜</label><br><br>
				<input type="date" value="" name="date" id="consultingDate">
					<script>
			           document.getElementById('consultingDate').value = new Date().toISOString().substring(0, 10);
			           document.getElementById('consultingDate').min = new Date().toISOString().substring(0, 10);
			       </script>
				<br><br><br>
				<label>입양사유</label>
				<p id="adopt_reason"> 하단에 입양사유를 작성해주세요.</p>
				<textarea rows="10" cols="53" name="reason" value="입양사유는 보호소에 전달됩니다"></textarea><br>
				<input id="submit" type="submit" value="제출"  onclick="ibyang_End(${p_num})" >
		</div><br/><br/><br/>
	</form>
</div>	
</article>



<script type="text/javascript">
function ibyang_End(p_num){
	if( document.contractFrm.okon[1].checked==true){
		alert('약관에 동의하여야 신청가능합니다');
		return false;
	}
	if( document.contractFrm.reason.value==""){
		alert('입양사유를 입력해주세요');
		return false;
	 }
		 
	var consulting = document.contractFrm.date.value;
	var reason = document.contractFrm.reason.value;
	   
	document.contractFrm.action = "petpic?p_num="+p_num+"&consulting="+consulting+"&reason="+reason;
	document.contractFrm.submit();
	}
</script>

<style type="text/css">
#submit
{width:100px; 
height: 55px; 
background-color: white; 
border: 3px solid #061f5c; 
border-radius: 5px;
font-size:130%;
text-align:center;
font-family: 'Gothic A1', sans-serif; 
font-weight: 700;
cursor:pointer
}
#submit:hover{ background-color : #061f5c; color : white;}
</style>







<%@ include file="../include/headerfooter/footer.jsp" %> 