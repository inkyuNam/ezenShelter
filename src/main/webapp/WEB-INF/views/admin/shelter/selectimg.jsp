<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function selectimg(){
		document.frm.submit();
	}
 </script>
</head>
<body>
	
	<form name="frm" action="shelterimgupload"  method="post" enctype="multipart/form-data">
		<h1>파일 선택</h1>
		<input type="file" name="image" onchange="selectimg()">
	</form>
	
</body>
</html>