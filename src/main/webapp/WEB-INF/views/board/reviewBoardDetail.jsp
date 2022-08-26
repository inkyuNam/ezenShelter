<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style type="text/css">

    *{ text-decoration: none;}
    .container .detailview {margin: auto; max-width: 900px; border: 1px dotted #bfbbbb; border-radius: 15px;}
    .container .detailview .b_title h1{font-size: 30px; text-align: center;}
    .container .detailview .b_title{ display: inline;} 
    .container .detailview .b_title .writer{ text-align: right; margin-right: 15px; font-size: 15px; color: gray;} 

    .container .detailview .content .d_con{display: inline; text-align: center; }
    .container .detailview .content .d_con img{ width: 500px; height: 350px;}
    .container .detailview .content .d_con p{ text-align: center; word-break: initial; padding: 10px 60px 10px 60px; line-height: 2;
    font-size: 17px; border-bottom: 1px dotted #bfbbbb; }

   
    .container .detailview .reply .re_view .top h1{ padding-left: 20px; font-size: 20px; line-height: 2;}
    .container .detailview .reply .re_view .username h2{ padding-left: 20px; font-size: 15px;}
    .container .detailview .reply .re_view .txt p{font-size: 15px; padding-left: 20px;}
    .container .detailview .reply .re_view .txt{float:left;}

    .container .detailview .reply .re_write { border: 2px solid #bfbbbb; width: 860px; border-radius: 15px; margin: 40px 20px; height: 180px;}
    .container .detailview .reply .re_write .username h2{ padding-left: 20px; font-size: 15px;}
    .container .detailview .reply .re_write .txt p{font-size: 15px; padding-left: 20px; }
    .container .detailview .reply .re_write button{ float: right; margin: 10px 40px; background-color: white; border-color: white; }
    .container .detailview .reply .re_write button a{color: black;}
    .container .detailview .return button{border: 1px solid black;  width: 200px; height: 50px; margin: 20px 350px; border-radius: 50px; font-size: 20px; background: white; transition: .5 ease;}
    .container .detailview .return button a{color: black; transition: .5 ease;}
    .container .detailview .return button:hover{transition: .5 ease; border: 2px solid #061f5c; background: transparent; background-color: #061f5c; color: white; cursor:pointer;}
    .container .detailview .return button a:hover{color: white; transition: .5 ease;}

	#infoMsg{position:relative; bottom:0; left:50%; font-weight:bold; font-size:100%; color:#061f5c;}
	#re_view{position:relative; height:100px; width:100%;}
	#username{position:relative; height:15px; top:0; left:0;}
	#txt{position:relative; left:0; width:700px; word-break:break-all;}
	#replyDate{position:relative; right:0; line-height:50px;}
	#replaceBtn{position:absolute; right:50px; bottom:20px;}
	#replaceBtn input{background-color: white; border-color: white;}
	
	/* 댓글창 히든 div */
	.updateReplyForm{position:relative; background-color:#f0f2ef; display:none;}
	#updateReplyForm h2{font-size: 20px; line-height: 2; color:#061f5c; font-weight:bold;}
	#updateReplyBtn{position:absolute; right:17%; bottom:20px;}
	.closeUpdateReply{position:absolute; width:20px; height:15px; right:20%; top:5%; cursor:pointer; 
	vertical-align:middle;  text-align:center;}
	.closeUpdateReply img{max-width:30px; max-height:30px;}
	.bnts{width:100px; float:right;}
	
</style>

<script type="text/javascript">

function reply_check(){
	if(document.replyFrm.reply.value==""){
		alert("내용을 입력하세요.");
		document.replyFrm.reply.focus();
		return false;
	}
	document.replyFrm.submit();
}

function modify(b_num){
	var url = "reviewModifyForm?b_num=" + b_num;
	location.href=url;
}

function ConfirmDelete(b_num){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}else{
		location.href="reviewDelete?b_num=" + b_num;
	}
}


function confirmDelReply(r_num,b_num){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}else{
		location.href = "delReply?r_num="+r_num+"&b_num="+b_num;
	}
}


/* $(function (){
    $('.uBtnOn').click(function(){
        $('.updateReplyForm').fadeIn(500,function(){});
    });
    $('.closeUpdateReply').click(function(){
        $(".updateReplyForm").fadeOut(500,function(){});
    });
}); */

function editReplyButton(rNum){
	
//var con = document.getElementById("reEdit_"+rNum)

	 $('#edit_'+rNum).click(function(){
        $('#reEdit_'+rNum).fadeIn(500,function(){});
    });
    $('#cloEditBtn_'+rNum).click(function(){
        $('#reEdit_'+rNum).fadeOut(500,function(){});
    });
}

window.onload = function(){
	<c:forEach items="${rlist}" var="r_num" >
		editReplyButton(${r_num});
	</c:forEach>
}


function UpReply(rNum,bNum){	
	var content = document.getElementById('editReply_'+rNum).value;
	
	if(content==""){
		alert("수정할 내용을 입력하세요.");
		return false;
	}
	location.href = "updateReply?r_num="+rNum+"&b_num="+bNum+"&nContent="+content
}
</script>



<section class="container">
        <div class="detailview">
            <div class="b_title">
                <h1>${board.title}</h1>
            <div class="writer">
                <p>작성자 : ${board.id} </p>
                </div>
            </div>
            <div class="bnts">
                <c:if test="${board.id == loginUser.id}">   
                   <input type="button" value="수정" onclick="modify('${board.b_num}')">
                   <input type="button" value="삭제" 
                     onclick="ConfirmDelete('${board.b_num}');">
           		 </c:if>
            </div>
            <!-- 등록일 작성자 조회수 ?-->
            <div class="content">
                <div class="d_con">
                    <div class="img">
                        <img src="/images/${board.b_image}">
                        <p>${board.b_content}</p>
                    </div>   
                </div>
            </div>

			
			<!-- 댓글 시작 -->
				<form name="replyFrm" method="post" action="addReply">	
				<input type="hidden" name="b_num" value="${board.b_num}"/>
			
                <div class="reply">
                	<div class="top">
                       <h1>댓글</h1>
                   	</div>
                	<c:forEach items="${replyList}" var="reply">	
                	
                
                <!-- 댓글수정 폼 히든 -->            	
               <div class="updateReplyForm" id="reEdit_${reply.r_num}">
				<div class="closeUpdateReply" id="cloEditBtn_${reply.r_num}"><img src="/images/close.png"></div>
				<h2>수정할 내용</h2>
					<div class="txt">
					     <input type="text" id="editReply_${reply.r_num}" name="nContent_${reply.r_num}" maxlength='60' placeholder="댓글을 입력하세요."  
					     style="width:650px; height:90px; margin: 0px 20px; border-radius: 5px; border: 1px solid  #bfbbbb; 
					     font-size:100%; color:#061f5c;">
					     
					 </div>
				 <div id="updateReplyBtn"><input type="button" value="수정" 
				 onClick="UpReply('${reply.r_num}','${reply.b_num}');"></div>			
				</div>
                	
                			
                    <div class="re_view" id="re_view">                      
	                    <div class="username" id="username">
	                        <h2>${reply.id}</h2>
	                    </div>
	                    <div class="txt" id="txt">
	                        <p>${reply.r_content}</p>
	                    </div>
	                    <div id="replyDate">${reply.r_indate}</div>
	                    
	                    <c:if test="${reply.id==loginUser.id}">
	                    <div id="replaceBtn">
	                  
	                  
	                   <input class="uBtnOn"  id="edit_${reply.r_num}" type="button" value="수정"
	                   onClick="editReplyButton('${reply.r_num}');">
	                   
	                                   	 
	                    <input type="button" value="삭제"
	                    onClick="confirmDelReply('${reply.r_num}','${reply.b_num}');">	                    
	                    </div>
	                    </c:if>
                	</div><hr>
                	</c:forEach>
		
		
		<div id="paging" style="margin:0 auto; font-size:130%; font-weight:bold; text-align:center;">
		<c:url var="action" value="boardViewWithoutCount?b_num=${board.b_num}"/>
	
		<c:if test="${paging.prev}">
			<a href="${action}&page=${paging.beginPage-1}">[이전]</a>&nbsp;
		</c:if>
		
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="color:red">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="${action}&page=${index}">${index}&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.next}">
			<a href="${action}&page=${paging.endPage+1}">[다음]</a>&nbsp;		
		</c:if>
	</div>
	
	
				
                <div class="re_write">
                    <div class="username">
                       <h2>${loginUser.id}</h2>
                       <input type="hidden" name="id" value="${loginUser.id}">
                    </div>
                    <div class="txt">
                        <input type="text" name="r_content" maxlength='60' placeholder="댓글을 입력하세요." 
                        style="width:800px; height:90px; margin: 0px 20px; border-radius: 5px; border: 1px solid  #bfbbbb;
                        font-size:100%; color:#061f5c;">
                    </div>
                    
                     <c:choose>
					<c:when test="${empty loginUser}">
						<div id="infoMsg">&lt;로그인 완료 후 댓글작성을 할 수 있습니다.&gt;</div>
					</c:when>
					
					<c:otherwise>	
						<button onClick="return reply_check();">등록</button>
					</c:otherwise>
					</c:choose>                  
                </div>
                	
          		</div>
          	  </form>
				<div class="return">
                    <button onClick="location.href='board?page=1'">목록으로</button>
               	</div>
        </div>

</section>
<%@ include file="../include/headerfooter/footer.jsp" %>