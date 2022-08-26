<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/headerfooter/header.jsp" %> 

<div id="petdetail" >


<article>
	<div id="detail_content">
	
<!----------- 제목 ----------->
	<div id="tit">${pet.type2} "${pet.p_name}" 입양♥</div>
<!---------- 본문 내용 --------->
	<div id="p_detail"><br><br>
	<form method="post" name ="frm"'>
		<table id="p_info">
		<div id="img">
			<img src="images/adopt/${pet.p_image}">
		</div>	
			<tr><th>이름</th><td colspan="3">${pet.p_name}</td><tr>
			<tr><th>품종</th><td>${pet.type2}</td><th>나이</th><td>${pet.age}</td><tr>
			<tr><th>중성화(Y/N)</th><td>${pet.ntr}</td><th>성별(F/M)</th><td>${pet.p_gender}</td><tr>
			<tr><th>좋아함</th><td>${pet.enjoy}</td><th>싫어함</th><td>${pet.dislike}</td><tr>
			<tr><td colspan="5">자세한 사항은 입양상담시 확인가능합니다</td><tr>
			
		</table>
		<br><br><br>
		<th><img src="images/adopt/${pet.content}"  style="width:1000px;"></th>
		<br><br>
		
		
<!----------- 관심버튼 ----------->

	<c:if test="${loginUser != null}">
		<c:if test="${HeartDto==null}">			
			<input class="heart" type="button"
			value="🤍" onclick="return add_heart(this);" />
		</c:if>
		<c:if test="${HeartDto!=null}">			
			<input class="heart" type="button"value="❤️" onclick="return remove_heart(this);" />
		</c:if><br><br><br>


		<script type="text/javascript">
			function change( bnt ){
			    if ( bnt.value === "🤍" ) {
			    	bnt.value = "❤️";
			    	alert('관심동물에 등록되었습니다');
			    	add_heart();
			    } else ( bnt.value === "❤️" )
			    bnt.value = "🤍";
			    alert('관심동물에서 해제되었습니다');
			    	remove_heart();
			}
			
			
			function add_heart(bnt){
				bnt.value = "❤️";
				alert('관심동물에 등록되었습니다');
				document.frm.action = "addHeart?p_num="+${pet.p_num};
				document.frm.submit();
			}
			
			function remove_heart(bnt){
				bnt.value = "🤍"
				alert('관심동물에서 해제되었습니다');
				document.frm.action = "removeHeart?p_num="+${pet.p_num};
				document.frm.submit();
			}
		</script>
</c:if>

<c:if test="${loginUser == null}">
</c:if>
</form>
	</div>
</article>
</div>


<!----------- 입양버튼 ----------->
<c:if test="${loginUser != null}">
	<div style="margin: 0 auto; width:300px;"><a href="adopt_contract?p_num=${pet.p_num}">
	<img src="/images/adopt/adopt_button.png"></a></div>
</c:if>
<c:if test="${loginUser == null}">
	<h3 style="text-align:center;"> <a href="" onclick=""> 입양을 원하시는 분은 로그인을 해주세요</a></h3>
</c:if>
<br><br><br>

<%@ include file="../include/headerfooter/footer.jsp" %> 