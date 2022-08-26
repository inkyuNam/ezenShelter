<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>
<style type="text/css">
* {
	text-decoration: none;
}
.qbox .dview {
	max-width: 900px;
	border: 1px dotted #bfbbbb;
	border-radius: 15px;
	displat: inline;
}
.qbox .dview .qa_title {
	display: inline;
	text-align: center;
}
.qbox .dview .content .d_con {
	display: inline;
	text-align: center;
}
.qbox .dview .content .d_con p {
	text-align: center;
	word-break: initial;
	padding: 10px 60px 10px 60px;
	line-height: 2;
	font-size: 17px;
	
}
.qbox .dview .content {
	border-top: 1px dotted #bfbbbb;
}
.qbox .dview .qa_title {
	text-align: center;
}
.qbox .dview .qa_title h1 {
	font-size: 150%;
}

.qbox .dview .qa_title .writer p {
	color: gray;
	font-size: 100%
}
.qbox .dview .content .answer{background:#f6f6f6; margin:50px 20px;}
.qbox .dview .content .answer .atxt p{text-align: center;
	word-break: initial;
	padding: 0px 60px 30px 60px;
	line-height: 2;
	font-size: 15px;}
	
.qbox .dview .content .answer .atxt h4{padding-top:20px; font-size:18px; margin-left:30px; }
.qbox .dview .return button{border: 1px solid black;  width: 200px; height: 50px; margin: 20px 300px; border-radius: 50px; font-size: 20px; background: white; transition: .5 ease;}
.qbox .dview .return button a{color: black; transition: .5 ease;}
.qbox .dview .return button:hover{transition: .5 ease; border: 2px solid #061f5c; background: transparent; background-color: #061f5c; color: white; cursor:pointer;}
.qbox .dview .return button a:hover{color: white; transition: .5 ease;}
</style>

<div class="main-area">
<h2>1:1 문의 게시판</h2>

<section class="qbox">
	<div class="dview">
		<div class="qa_title">
			<h1>${qnaVO.qa_title}</h1>
			<div class="writer">
				<p>작성일 : ${qnaVO.indate}</p>
			</div>
		</div>
		<!-- 등록일 작성자 조회수 ?-->
		<div class="content">
			<div class="d_con">
				<p> ${qnaVO.qa_content}</p>
			</div>
			<div class="answer">
			<div class="atxt">
			<h4>[답변]</h4>
			<p>${qnaVO.answer}</p>
			</div>
			</div>
			<div class="return">
                    <button onClick="location.href='mypageQna'">목록으로</button>
               	</div>
		</div>
	</div>
</section>
</div>
<div style="clear:both;"></div>

<%@ include file="../include/headerfooter/footer.jsp" %>