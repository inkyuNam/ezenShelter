<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function write(){
		document.productReviewWriteFrm.submit();
		self.close();
	}
</script>
<style type="text/css">
textarea{resize:none; border:1px solid yellowgreen; font-size:15px;}
</style>
</head>
<body>
	<h1>사용한 제품 후기 작성 하기</h1>
	<form method="post" name="productReviewWriteFrm">
		<textarea rows="4" cols="60" name="input"></textarea>
		<input type="button" value="작성" onClick="write();">
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>