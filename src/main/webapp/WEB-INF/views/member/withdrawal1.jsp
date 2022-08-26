<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<link  rel="stylesheet" href="/css/mypage/member.css">

<script type="text/javascript">

function withDrawalForm2(){	
	if(document.reCheck.pwd.value==${loginUser.pwd}){
		$(".step").removeClass("this_step");
		$(".step").eq(1).addClass("this_step");	
		$("#step_two").show();
		$("#step_one").hide();
	 }else{
		 alert("비밀번호 오류");
	 }	
}


 

function conFirm(){
	 var ok = confirm("정말 탈퇴 하시겠습니까?")
	 if(ok==true){												// 로그인 유저의 아이디
		location.replace('withdrawalCommit?id=${loginUser.id}');
		// 서블릿으로 가서 멤버 삭제하고 다음 페이지로 가는거 하면 될듯  
   } else {
   }
} 

function agreeCheck()
{
   if (document.reCheck.checkButton.disabled==true)
    document.reCheck.checkButton.disabled=false
   else
    document.reCheck.checkButton.disabled=true
}

</script>

<div id="topForm">
	<div style="position:absolute; left:0px; width:200px; font-size:160%; font-weight:bold;">회원탈퇴 안내</div>
	<div id="procedure">
	<ul>
	<li class="step this_step">1. 본인 확인</li>
	<li class="step">2. 설문조사</li>
	<li class="step">3. 회원탈퇴 완료</li>
	</ul>
	</div>
</div><br><br><hr>

<div id="step_one">
<form method="post" name="reCheck" > <!--action="DC.do" 나중에 서블릿 경유 추가-->
<input type="hidden" name="command" value="withDrawal">

<div id="mainForm">
<h4>회원탈퇴 전 유의사항을 확인하세요.</h4><br>
-회원탈퇴 시 회원전용 웹 서비스 이용이 불가능합니다.<br><br>
-거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약 철회에 관한 기록, 
대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.<br><br>
-회원탈퇴 후 해당 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 
회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br><br>
상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하기기 바랍니다.
-이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.<br><br>
	<div id="conFirm"><input type="checkbox" onClick="agreeCheck(this.form)">
		회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</div>
	</div>

	<div id="bottomForm">
		본인확인 비밀번호를 다시 입력해주세요.
		<div id="input_chk">
		<label>비밀번호</label>
		<input type="password" name="pwd">
		<input type="button" name="checkButton" value="본인 확인" disabled 
		onClick="withDrawalForm2()"> <!-- type="submit"  서블릿 경유 추가 후 등록--> 
		</div>
	</div>	
</form>
</div><br>



<div id="step_two">
<h3>&nbsp;설문조사</h3>
1. 더 나은 서비스를 위해서
'이젠돌봄' 회원탈퇴 사유를 체크해주세요<br><br><br>
<form>
<div id="select">
<input type="radio"  name="chk" value="1">
회원탈퇴 후 재가입을 위해서<br>
<input type="radio"  name="chk" value="2">
사이트 사용 빈도가 낮아서<br>
<input type="radio"  name="chk" value="3">
서비스 및 고객지원이 만족스럽지 않아서<br>
<input type="radio"  name="chk" value="4">
인터넷 익스플로러 이외 브라우저 사용<br>
<input type="radio"  name="chk" value="5">
MaxOs 의 사용으로 서비스 이용이 어려움<br>
<input type="radio"  name="chk" value="6">
기타사항<br><br>
</div><br>
2. 이젠 돌봄 서비스에 바라는 점을 남겨주세요.<br><br>
<textarea name="opinion" cols="50" rows="7"> </textarea><br><br>
<input type="button" id="btn" onClick="conFirm()" value="회원탈퇴" /><br><br>
</form>
</div><br>



<%@ include file="../include/headerfooter/footer.jsp" %>