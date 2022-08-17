<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap" align="center" style="width:100%">
	<form name="frm" action="fileupload" method="post" enctype="multipart/form-data">
		<h1>파일선택</h1>
		<input type="file" name="image" onchange="selectedimage();">
	</form>
	<script type="text/javascript">
	function selectedimage(){
		document.frm.submit();
	}
	</script>
</div>

</body>
</html>