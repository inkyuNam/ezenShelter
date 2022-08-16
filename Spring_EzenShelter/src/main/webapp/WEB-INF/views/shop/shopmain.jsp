<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더를 넣어서 저거 뭐라하지 나눠져있는거 설정 -->
<!-- 신상품 아직은 넣을 예정이 없어서 	베스트 / 강아지 / 고양이 / 그 외 동물     기본적으로 사료랑 간식만? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 헤더를 어디에 둬야할지 모르겠다 -->
	<ul>
		<li><a href="bestlist"></a></li>
		<!-- 이름이 베스트리스트긴 하지만 매진이 가까워진 물품들 나열 / 아니면 이름 바꾸고 
			할인하는 얘들이랑 같이 표시하는것도 괜찮을거같음 -->
		<li><a href="dogProductlist"></a></li>
		<li><a href="catProductlist"></a></li>
		<li><a href="etcProductlist"></a></li>
	</ul>


	쇼핑몰 메인 페이지가 될 예정인 곳
	쇼핑몰 상단 메인 이미지 넣어놓고 
	<!-- 매진 임박 -->
	<c:forEach items="${hotlist}" var="list" end="6">
	 
	</c:forEach>
	
	<!-- 보듬 컴퍼니 기준	신상품 / 베스트 / 이벤트 로 메인이 구성 -->
	
	이벤트는 몰..루겠다
	
	
</body>
</html>