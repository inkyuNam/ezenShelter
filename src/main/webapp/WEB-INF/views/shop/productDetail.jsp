<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function cal_price(){
		document.frm.totalprice.value=document.frm.price2.value * document.frm.quantity.value;
	}
	
	// 상품 페이지 -> 장바구니
	function go_cart(){	
		document.frm.action="gocart";
		document.frm.submit();
	}
</script>
</head>

<style type="text/css">
.menu-list{padding-top:70px; padding-bottom:70px;}
.menu-list .pl-container{max-width: 1200px; margin: auto;}
.menu-list .pl-container .pl-title ul{padding-left: 0; list-style: none; margin: 50px 0px; border-bottom: 2px solid black; padding-bottom: 15px;}
.menu-list .pl-container .pl-title ul li{ display: inline; margin-right: 30px;}
.menu-list .pl-container .pl-title ul li a{ text-decoration: none; color: #444;}
.menu-list .pl-container .pl-title ul li a:hover{color: #061f5c; font-weight: bold;}



.menu-list .pl-container .pd-wrap{ display: flex; flex-direction: row; flex-wrap: wrap; justify-content: flex-start;}
.menu-list .pl-container .pd-wrap .pd-detail{border: 1px solid #eee; border-radius: 5px; width: 1100px; padding: 5px; 
margin: 40px;}

.menu-list .pl-container .pd-wrap .pd-detail .pd-img img{ height: 500px; width: 500px; margin: 50px 250px;}
select{width: 100px; height: 30px; margin: 20px 0px;}
.button{width: 200px; height: 200px;}

.menu-list .pl-container .pd-wrap .pd-detail .detail-img{ border-top: 3px dotted #eee; margin-top: 60px;}
.menu-list .pl-container .pd-wrap .pd-detail .detail-img img{ margin: 50px 150px; }
.menu-list .pl-container .pd-wrap .pd-detail .pd-text .pd-price{  border: 1px dotted gray; padding: 20px;}
.menu-list .pl-container .pd-wrap .pd-detail .pd-text .pay-button{margin-top: 20px;}

</style>

<body>

	<!-- 이미지가 여러개가 들어가는거같은데 일단 한개니까 대표 이미지만? -->
	
	<section class="menu-list">
		<div class="pl-container">
			<div class="pl-title">
                <h1 style="font-size: 30px;">PRODUCT LIST</h1>
                <ul>
                    <li><a href="">BEST</a></li>
                    <li><a href="">DOG</a></li>
                    <li><a href="">CAT</a></li>
                    <li><a href="">OTHER</a></li>
                </ul>
			</div>

		<form name="frm" method="post">
		<input type="hidden" name="pseq" value="${pvo.pseq}">
		<input type="hidden" name="id" value="${loginUser.id}">
            <div class="pd-wrap">
                <div class="pd-detail">
                    <div class="pd-img">
                        <img src="https://www.bodeum.co.kr/data/goodsImages/1660626352_IMAGES1.jpg">
                        
                    </div>
                    <div class="pd-text">
                        <div class="pd-text-title">
                        <p style="font-size: 30px; text-align: center; font-weight: bold;">${pvo.name}</p>
                        </div>
                        <div class="pd-price">
                        <p style="font-size: 16px; ">판매 가격&nbsp;&nbsp;</p>
                        <input type="hidden" name="price2" value="${pvo.price2}">
                        <p><input type="text" name="totalprice" readonly value="${pvo.price2}" 
                         style="width: 90px; height: 20px; border: none; font-size: 25px; font-weight: bolder; color: #061f5c;">원</p>
    
                       
                            <select name="quantity" onchange="cal_price()">
                                <option value="1">1개</option>
                                <option value="2">2개</option>
                                <option value="3">3개</option>
                                <option value="4">4개</option>
                                <option value="5">5개</option>
                                <option value="6">6개</option>
                                <option value="7">7개</option>
                                <option value="8">8개</option>
                                <option value="9">9개</option>
                            </select>

                       
                        </div>
                        <div class="pay-button">
                            <input type="button" value="장바구니 담기" onclick="go_cart()" 
                            style="height: 50px; width: 150px; color: white; background: #061f5c; border: #061f5c;">
                            &nbsp;&nbsp;
                            <input type="button" value="즉시 구매하기" onclick="" 
                            style="height: 50px; width: 150px; color: black; background: #eee; border: #eee;">
                        </div>

        
                        <div class="detail-img">
                         <h1 style="text-align: center; padding-top:50px; text-decoration: underline; text-decoration-color: #061f5c;" >DETAIL VIEW</h1>
                            <img src="https://www.bodeum.co.kr/smarteditor/upload/1660627743_%2528760%2529%25ED%2599%25A9%25EC%2586%258C%25EC%258A%25A4%25ED%258B%25B1-%25EB%25B0%2594%25EC%259D%25B4%25ED%258A%25B8-%25EC%2583%2581%25EC%2584%25B8.jpg">
                        </div>
                        
                        
                        <div class="p-review" style="border-top: 3px dotted #eee;">
                            <h1 style="text-align:center; text-decoration: underline; text-decoration-color: #061f5c;">PRODUCT REVIEW</h1>
                            <table style="font-size:15px; background:#edecec5e; margin:auto;">
                              <tr>
                              <th width="100px" style="font-weight: 100; text-align: left; padding-left: 20px;">Name.</th>
                              <th width="400px" style="font-weight: 100; text-align: left; padding-left: 50px;">Review.</th>
                              <th width="150px" style="font-weight: 100; text-align: left; ">Date.</th>
                              </tr>
                            </table>
                          

	 
                        </div>
                        <!--  <table>
			<tr><td colspan="3" align="right">상품 후기</td></tr>
			<tr><th width="100px">아이디</th><th width="400px">내용</th><th width="100px">날짜</th></tr> 
			<%-- <c:forEach items="${list}" var="review">
				<tr><td>${review.id}</td><td>${review.content}</td><td>${review.indate}</td></tr>
			</c:forEach> --%>
			후기 작성은 마이페이지에서 가능하게끔 (구매한 사람만 리뷰 작성) 
		</table> -->
                    </div>
                </div>
			
			
		

			</div>
			</form>
		</div>
	</section>

<%@ include file="../include/headerfooter/footer.jsp" %>