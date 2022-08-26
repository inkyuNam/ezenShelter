<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerfooter/header.jsp" %>


<article>
<div id="midyfyWrap" align="center">   
	<form name="WriteFrm" method="post" action="reviewModify">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" name="oldImage" value="${board.b_image}">
	 	
	  <h2> 입양 후기 수정</h2>
	  <h4> 작성한 후기를 수정해주세요</h4> 
		 <table>
		 <tr><th>작성자</th><td>${loginUser.id}
		<input type ="hidden" name="id" value="${loginUser.id}"></td></tr>
	     <tr><th>제 목</th><td>
	     <input id="replaceTitle" type="text" name="title" size="30" maxlength="20" value="${board.title}"></td></tr>
		 <tr><th>내 용</th><td><textarea cols="80" rows="10" name="b_content" 
		 style="resize:none;">${board.b_content}</textarea></td>
		 <tr><th>사 진</th>
		 <td>
		 <img src="/upload/${board.b_image}" width="200pt">
		 <div id="image" style="float:left"></div>
		<input type="hidden" name="b_image">
		<input type="button" value="파일선택" onClick="selectimg();">
		<img src="" id="previewimg" width="150" style="display:none"/><br> 파일을 수정하고자 할때만 선택하세요.
		<input type="hidden" name="oldfilename" value="${board.b_image}">
				
				<script type="text/javascript">
					function selectimg(){
						var opt = "toolbar=no,menubar=no,resizable=no,width=450,height=200";
						window.open('selectimg' , 'selectimg', opt);
					}				
				</script>
				
		 </td></tr>
		</table><br>
			<input type="submit"  value="수정"  class="modyfyBnt" onclick="return review_write()">		
			<input type="reset"   value="재작성"   class="modyfyBnt">
			<input type="button"  value="목록"  class="modyfyBnt" 
				onclick="location.href='board'">
	</form>
</div>	
</article>


<%@ include file="../include/headerfooter/footer.jsp" %>