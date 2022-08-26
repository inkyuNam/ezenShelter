<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/headerfooter/Mheader.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css -->
<style type="text/css">
.petlist {flex: 0 0 auto; position: relative; margin:0 auto; flex-wrap: wrap; 
justify-content: space-between; width:915px; height:930px; align:center; }
        
.box {position:relative; height: 300px; width: 300px; overflow:hidden; 
align-items:center; margin-left:5px;}

td img{position:absolut; width:100%; height:100%; object-fit:cover; cursor:pointer;}
.box:hover{filter: brightness(60%);}
#PetPaging{position:relative; align:center; margin:0 auto; font-family: 'Jua', sans-serif; font-size:120%;
		text-align:center; height:100px; line-height:100px; text-decoration:none; font-color:black;}

ul{ list-style:none;}
</style>


<script type="text/javascript">

$(document).ready(
		function(){
			$('.title li').eq(${region}).addClass('selected');
			$('.title li').eq(${type1}+9).addClass('pet_selected');
		}
		);
		
		
		$(function(){
			$('.title li').on('click',function(){
				var n = $(this).index();
				if (n>8){
					location.href="petList?region="+(${region})+"&type1="+(n-9);
				}else{
					location.href="petList?region="+n+"&type1="+${type1};
				}
			});
		});
</script>

<!------------------------- 지역/동물타입 선택 ------------------------->
<div class="container">	
	<div class="title">
		<h1>&nbsp;&nbsp;&nbsp;목록</h1>
			<ul class="region">
				<li style="float:left;">수도권</li>
				<li style="float:left;">강원</li>
				<li style="float:left;">충북</li>
				<li style="float:left;">충남</li>
				<li style="float:left;">경북</li>
				<li style="float:left;">경남</li>
				<li style="float:left;">전북</li>
				<li style="float:left;">전남</li>
				<li style="float:left;">그 외</li>
				<li style="float:right;">그 외</li>
				<li style="float:right;">고양이</li>
				<li style="float:right;border-left: none;">강아지</li>
			</ul>		
	</div><br>


<!----------------------------- 동물 리스트 ----------------------------->
<div class="petlist">
<form method="post" name="frm">
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<table>
		<c:forEach items="${petList}" var="petList">
			<c:if test="${i%j} ==0 ">
				<tr>
			</c:if>
			
			<!-- 입양완료시 디테일페이지 이동X --> 	<!-- 입양완료 띠지 표시 -->
			 <c:choose>
				<c:when test="${petList.state eq 'y' }">
					<td class="box">
						<div id="adopt_y" style="background-image: url(/images/adopt/${petList.p_image}); background-size: 150%;
							background-position: center center; background-repeat:no-repeat;">
							<img src="/images/adopt/adopt.png">
						</div>
					</td>	
				</c:when>
				
				<c:otherwise>
					<td class="box" onclick="location.href='petDetailM?p_num=${petList.p_num}'">
						<img src="/images/adopt/${petList.p_image}">
					</td>
				</c:otherwise>
			</c:choose>
			 
			
			<c:if test="${i%j ==j-1}">
			<tr>
			</tr>
			</c:if>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>		
	</table>

</form>
</div>


<!----------------------------- 페이징  ----------------------------->
	<div id="PetPaging">
		<c:url var="action" value="petList?region=${region}&type1=${type1}"/>
	
		<c:if test="${paging.prev}">
			<a href="${action}&page=${paging.beginPage-1}">[이전]</a>&nbsp;		
		</c:if>
		
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="weight:bold; color:skyblue;">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="${action}&page=${index}">${index}&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.next}">
			<a href="${action}&page=${paging.endPage+1}">[다음]</a>&nbsp;	
		</c:if>
	</div>



</div>  


<%@ include file="../include/headerfooter/Mfooter.jsp" %> 