<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<!-- 헤더를 넣어서 저거 뭐라하지 나눠져있는거 설정 -->
<!-- 신상품 아직은 넣을 예정이 없어서 	베스트 / 강아지 / 고양이 / 그 외 동물     기본적으로 사료랑 간식만? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/script/shop.js"></script>
<style type="text/css">

	#wrap {position: relative; background: white; width: 1200px; margin: 0 auto; z-index: 1;}
	#go_list{position:relative; width:600px; margin:0 auto; height:20px; text-align:right; border:1px solid black;}
	.listbox{position:relative; width:600px; margin:0 auto; height: 150px; overflow:hidden;}
	#listinbox{position:relative; width:1800px; height:100%;}
	.listItem{position:relative; width:200px; height:148px; float:left; border:1px solid blue;}
	
	<!--상단메뉴-->
	.cate-wrap{width:1200px; margin:0 auto; }
	.cate{float:left; text-align:center; list-style-type:none;  margin-top:40px;}
	.cate li { display:inline-block; text-align:center; display:inline;  cursor:pointer;}
	.cate span{background:#333; color:#fff; padding:10px 20px; margin:0 10px; margin-top:50px; border-radius:80px;}
	.cate span:hover{background:#061f5c;}
				
	<!--베스트 롤링-->
	*{margin:0; padding:0; padding-inline-start:0;}
	li{list-style:none;}
	.bestproduct-wrap{position:relative; width:960px; height:390px; margin:0 auto;  overflow:hidden; }
	.bprdList{position:absolute; left:0; top:0; height:360px; overflow:hidden;
				transition:left 0.5s ease-out; padding:0;}
	.bprdBox:not(:last-child){float:left; margin-right:30px;}
	.controls{text-align:center;}
	.controls span{background:#333; color:#fff; padding:10px 20px; margin:0 10px; margin-top:50px; cursor:pointer;}
	.controls span.span.prev{right:calc(100%+50px);}
	.controls span.span.next{right:calc(100%+50px);}
	
	<!--후기배너-->
	img{display: block; margin: 0px auto; }
	
	<!--상품리스트-->
	*{margin:0; padding:0;}
	li{list-style:none;}
	.product-wrap{position:relative; width:1000px; height:1200px; margin:0 auto; overflow:hidden; }
	.prdList{position:absolute; left:0; top:0; height:330px; overflow:hidden;}
	.prdBox{margin-right:30px; margin-bottom:20px;}
	
	.prdInfo{width:300px; height:60px;}
	.prdName{font-size:80%; color:gray;}
	.prdPrice{font-size:150%; font-weight:bold; color:#061f5c;}

</style>

</head>
<body>


	<!----------------- 상단메뉴 ----------------->
	<div class="cate-wrap">
		<ul class="cate">
			<li class="menecate"><a href="bestlist"><span>판매베스트</span></a></li>
			<li class="menecate"><a href="Productlist?kind=2"><span>강아지</span></a></li>
			<li class="menecate"><a href="Productlist?kind=1"><span>고양이</span></a></li>
			<li class="menecate"><a href="Productlist?kind=0"><span>그 외 동물</span></a></li>
		</ul>
	</div><br/><br/><br/>
<!-- ----------------------- 서브 메뉴(또는 헤더) 이거 귀찮아서 별도 파일 아직 안 만든것. ----------------------------  -->



	<br><br><br>
	<!-- 메인페이지 배너처럼 쇼핑몰 상단 메인 이미지 ?  -->
	
	
	<!---------------------- 베스트/추천 상품 버튼 롤링 ---------------------->
	<div style="text-align:center;"><h2>🔥BEST SELLER🔥</h2></div>
	<div class="bestproduct-wrap">
		<ul class="bprdList">
		<c:forEach items="${hotlist}" var="list" end="6" varStatus="status">
			<li class="bprdBox">
				<a href="productDetail?pseq=${list.pseq}"><img src="/images/shop/01.jpg"></a>
					<div class="prdInfo">
			            	<div class="prdName">${list.name }</div>
			            	<div class="prdPrice">${list.price1} 원</div>
			        </div>
			</li>
		</c:forEach>			
		</ul>
	</div>
		<p class="controls">
			<span class="prev">이전</span>
			<span class="next">다음</span>
		</p>
		<br/><br/><br/>
	
	<!------------------------- 상품 후기 연결 배너 ------------------------->
	<div OnClick="location.href ='board'" style="cursor:pointer; text-align : center;">
		<img src="/images/shop/shop_banner.jpg">
	</div><br/><br/><br/>
	
	<!---------------------------- 상품 리스트 ---------------------------->
	<div style="text-align:center;"><h2>NEW PRODUCT⚡️</h2></div>
	<div class="product-wrap" style=" position:relative; width:1000px; height:1600px; margin:0 auto;">
	<c:forEach items="${hotlist}" var="list" varStatus="status">
		<c:if test="${status.first}"><ul style="height:330px; padding:0;"></c:if>
		    <c:choose>
		        <c:when test="${status.count % 3 == 0 }">
		            <li class="prdBox" style="float:left;">
		            <a href="productDetail?=${list.pseq}"><img src="/images/shop/08.jpg"></a>
			            <div class="prdInfo">
			            	<div class="prdName">${list.name }</div>
			            	<div class="prdPrice">${list.price1} 원</div>
			            </div>
		            </li>
		        </ul>
		        <ul  style="height:330px; padding:0;">
		        </c:when>
		        <c:otherwise>
		            <li class="prdBox" style="float:left;">
		            <a href="productDetail?=${list.pseq}"><img src="/images/shop/03.jpg"></a>
		            	<div class="prdInfo">
			            	<div class="prdName">${list.name }</div>
			            	<div class="prdPrice">${list.price1} 원</div>
			            </div>
		            </li>
		        </c:otherwise>
		    </c:choose>
		<c:if test="${status.last }"></ul></c:if>
	</c:forEach>
	</div>
	<br/>
</body>
</html>

<script type="text/javascript">

	var bprdList = document.querySelector('.bprdList'),
		bprdBox = document.querySelectorAll('.bprdBox'),
		currentIdx = 0,
		bprdBoxCount = bprdBox.length,
		prevBnt = document.querySelector('.prev'),
		bprdBoxWidth = 300,
		bprdBoxMargin = 30,
		nextBnt = document.querySelector('.next');
	
		bprdList.style.width = (bprdBoxWidth + bprdBoxMargin)*bprdBoxCount - bprdBoxMargin + 'px';
		
		/*************버튼기능****************/
		function moveSlide(num){
			bprdList.style.left = -num * 330 + 'px';
			currentIdx = num;
		}
		
		/*다음*/
		nextBnt.addEventListener('click', function(){
			if(currentIdx < bprdBoxCount-3 ){
			moveSlide(currentIdx +1);
			}else{
				moveSlide(0);
			}
		});
		
		/*이전*/
		prevBnt.addEventListener('click', function(){
			if(currentIdx > 0 ){
			moveSlide(currentIdx -1);
			}else{
				moveSlide(bprdBoxCount-3);
			}
		});
		
		
</script>



<%@ include file="../include/headerfooter/footer.jsp" %>