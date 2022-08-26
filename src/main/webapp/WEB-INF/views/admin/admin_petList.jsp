<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/admin/admin_header.jsp" %>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
				$('.sel_state').eq(${tp}).addClass('selected');
		});
	</script>
	
	<div class="borderlist">
				<h2>상담 대기중인 아이들</h2>
				<table id="pet_board">
					<tr style="text-align: right; background-color: #ffff8c;">
						<td style="width:220px;">이미지</td>
						<td style="width:130px;">상담자 이름</td>
						<td style="width:130px;">상담 일정</td>
						<td style="width:200px;">보호소 이름</td>
					</tr>
					
					
					<c:forEach var="posting" items="${waitlist}">
						<tr style="text-align: right; background-color: #ffff8c;">
							<td style="width:220px;">
								<div style="position:relative; width:100%; height:100%;">
									<div class="imgsz">
										<a href="adminPetDetail?p_num=${posting.p_num}"><img src="adopt/images/${posting.p_image}";></a>
									</div>
								</div>
							</td>
							<td style="width:160px;">${posting.m_name}</td>
							<td style="width:140px;">${posting.notimedate}</td>
							<td style="width:140px;">${posting.s_name}</td>
						</tr>
					</c:forEach>

				</table>
			</div>

		
		<div id="blank"></div>
		<div class="borderlist">
		<input type="button" value="새로운 친구가 왔어요" onclick="simple_chk()">
			<div>
				<a href="adminPetList?the=0"><div class="sel_state">입양 완료</div></a>
				<a href="adminPetList?the=1"><div class="sel_state">입양 대기중</div></a>				
				<a href="adminPetList"><div class="sel_state">모두 보기</div></a>
			</div>
				<h2>펫 리스트들</h2>
				
				<table id="pet_board">
					<tr style="text-align: right; background-color: #ffff8c;">
						<td style="width:160px;">이미지</td>
						<td style="width:160px;"></td>
						<td style="width:160px;">이름</td>
						<td style="width:160px;">나이</td>
						<td style="width:160px;">종류</td>
					</tr>
		
					<c:forEach var="posting" items="${etclist}">
						<tr <c:if test="${posting.state eq 'y'}"> style="background-color:#dff9fb;" </c:if> >
							<td style="width:220px;">
								<div style="position:relative; width:100%; height:100%;">
									<div class="imgsz">
										<a href="adminPetDetail?p_num=${posting.p_num}"><img src="adopt/images/${posting.p_image}"></a>
									</div>
								</div>
							</td>	
							<td></td>						
							<td>${posting.p_name }</td>
							<td>	<div>${posting.age }</div></td>
							<td>${posting.type2}</td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
			<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
				<c:url var="action" value="adminPetList?the=${tp}"/>
				<c:if test="${paging.prev}">
					<a href="${action}&petpage=${paging.beginPage-1}">◀</a>&nbsp;
				</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:choose>
						<c:when test="${paging.page==index}">
							<span style="color:red;">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${action}&petpage=${index}">${index}</a>&nbsp;
						</c:otherwise>	
					</c:choose>
				</c:forEach>
				<c:if test="${paging.next}">
					<a href="${action}&petpage=${paging.endPage+1}">▶</a>&nbsp;
				</c:if>
			</div>

		
</body>
</html>