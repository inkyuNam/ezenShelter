<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp" %>


<form name="frm">
	<table>
		<tr><th>주소1</th><td><input type="text" name="address1"></td></tr>
		<tr><th>주소2</th><td><input type="text" name="address2"></td></tr>
		<tr><th> 보호소이름 </th><td><input type="text" name="s_name"></td></tr>
		<tr><th>보호소연락처</th><td><input type="text" name="s_phone"></td></tr>
	</table>
	
	<input type="hidden" name="s_image">
	<div id="image"></div>
	<img id="previewimg" style="display:none; width:100px; ">
	이미지는 수업때 썻던 방ㅇ식대로 
</form>

<input type="button" value="이미지 선택ㅓㅑ" onclick="new_shelter_img()">
누르면 팝업창이 열리고 거기서 이미지 선택하는걸로.

</body>
</html>