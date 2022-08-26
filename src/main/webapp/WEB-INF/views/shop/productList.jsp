<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu-list{padding-top:70px; padding-bottom:70px;}
.menu-list .pl-container{max-width: 1200px; margin: auto;}
.menu-list .pl-container .pl-title ul{padding-left: 0; list-style: none; margin: 50px 0px; border-bottom: 2px solid black; padding-bottom: 15px;}
.menu-list .pl-container .pl-title ul li{ display: inline; margin-right: 30px;}
.menu-list .pl-container .pl-title ul li a{ text-decoration: none; color: #444;}
.menu-list .pl-container .pl-title ul li a:hover{color: #061f5c; font-weight: bold;}
.menu-list .pl-container .pl-list{ display: flex; flex-direction: row; flex-wrap: wrap; justify-content: flex-start;}
.menu-list .pl-container .pl-list .item{border: 1px solid #eee; border-radius: 5px; height: 350px; width: 300px; padding: 5px; 
margin: 40px;}
.menu-list .pl-container .pl-list .item a{text-decoration: none;}
.menu-list .pl-container .pl-list .item img{ height: 250px; width: 300px;}

</style>
</head>

<body>


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
			
		
			<div class="pl-list">
			<c:forEach items="${list}" var="item" varStatus="status">
				<c:if test="${status.index %4 ==0}">
				</c:if>
                <div class="item">
                <a href="productDetail?pseq=${item.pseq}">
                    <div class="pl-img">
                        <img src="https://www.bodeum.co.kr/data/goodsImages/1629366124_IMAGES1.png">
                    </div>
                    <div class="pl-text">
                        <p style="font-size: 15px; color:black">${item.name}</p>
                        <p style="font-size: 17px; font-weight: bold; margin-left: 2px; color:#061f5c;">${item.price2}</p>
                        </a>
                    </div>
        
                </div>
			</c:forEach>

			</div>
		</div>
	</section>


	<!-- 이미지같은게 들어가야할것같은데 음 -->
	

	
	
	<!-- 페이징 -->
	<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
		<c:url var="action" value="Productlist?kind=${kind}"/>
		<c:if test="${paging.prev}">
			<a href="${action}?page=${paging.beginPage-1}">◀</a>&nbsp;
		</c:if>
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="color:red;">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="${action}?page=${index}">${index}</a>&nbsp;
				</c:otherwise>	
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="${action}?page=${paging.endPage+1}">▶</a>&nbsp;
		</c:if>
	</div>

<%@ include file="../include/headerfooter/footer.jsp" %>