<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>


<article>
<div id="wrap" align="center">   
	<form action="reviewWrite" method="post" name="WriteFrm">
	  <h2 style="color:#004080;"> 입양 후기 </h2>
	  <h4> '이젠'을 통해 반려동물을 입양한 후기를 작성해주세요</h4>
		 <table id="board_write_tb">
		 <tr><th>작성자</th><td>${loginUser.id}
		<input type ="hidden" name="id" value="${loginUser.id}"></td></tr>
	     <tr><th>제 목</th><td><input type="text" name="title" size="50" value="${title}"></td></tr>
		 <tr><th>내 용</th><td><textarea cols="80" rows="10" name="b_content" value="${b_content}"></textarea></td>
		 <tr><th>이미지</th>
		 <td>
			<input type="button" value="파일선택" onClick="selectimg();">
			<div id="image" style="float:left"></div>
			<div><input type="hidden" name="b_image"></div>
			<img src="" id="previewimg" width="150" style="display:none"/>
		</td></tr>
		<tr>${msg}</tr>
		</table><br>
			<input type="submit"  value="글쓰기"  class="bnt">
			<script type="text/javascript">
			
			function selectimg(){
				var opt = "toolbar=no,menubar=no,resizable=no,width=450,height=200";
				window.open('selectimg' , 'selectimg', opt);
			}
			</script>
			<input type="reset"   value="취소"  class="bnt">
			<input type="button"  value="목록"  class="bnt" 
				onclick="location.href='board'">
	</form>
	
</div>	
</article>


<%@ include file="../include/headerfooter/footer.jsp" %>