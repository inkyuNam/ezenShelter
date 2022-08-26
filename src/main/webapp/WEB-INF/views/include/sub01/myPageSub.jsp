<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link  rel="stylesheet" href="/css/mypage/member.css">
<script type="text/javascript">

$(function (){
    $('#checkPwdOpenForm').click(function(){
        $('#check_pwdForm').fadeIn(500,function(){});
    });
    $('#checkPwdCloseForm').click(function(){
        $("#check_pwdForm").fadeOut(500,function(){});
    });
});

function check_pwd(pwd){		
	if(document.check_pwdFrm.checkPwdInput.value==""){
		alert("비밀번호를 입력하세요.");
		document.check_pwdFrm.checkPwdInput.focus();
		return false;
	}else if(document.check_pwdFrm.checkPwdInput.value!=pwd){
		alert("비밀번호가 일치하지 않습니다.");
		document.check_pwdFrm.checkPwdInput.focus();
		return false;			
	}else {
		document.check_pwdFrm.action="memberModify";
		document.check_pwdFrm.submit();
	}			
}

</script>

	<!-- 회원정보 수정을 위한 비밀번호 체크 div 히든 폼 -->
    	<div id="check_pwdForm">
    	<form name="check_pwdFrm" method="post">
    		<span id="check_pwdFormFont">회원정보 수정을 위한 비밀번호를 입력해주세요.</span><div id="checkPwdCloseForm">X</div>
    		<div><br><input id="checkPwdInputCss" name="checkPwdInput" type="password"></div>
    		<div id="check_pwd_button" onClick="check_pwd(${loginUser.pwd});">확인</div>
    		<div>${msg}</div>   
    	</form>	
    	</div>

       
       
       
       
        <div class="container">           
            <div class="sidebar">
                <div class="img-section lined">
                    <img src="https://cdn4.iconfinder.com/data/icons/music-ui-solid-24px/24/user_account_profile-2-1024.png" />
                    <p>${loginUser.name}님</p>
                    <p>아이디: <span class="thick">${loginUser.id}</span></p>
                </div>
                <div class="menu-section" style="cursor:pointer;">
                    <ul class="menu">
                        <li>
                            <div id="checkPwdOpenForm">
                                <img src="/icons8-user-32.png" />회원정보수정
                            </div>
                        </li>
                        <li>
                            <a href="mypage">
                                <img src="member/icon/icons8-dog-heart-30.png" />입양현황
                            </a>
                        </li>
                        <li>
                            <a href="mypageOrderView">
                                <img src="member/icon/icons8-chat-30.png" />주문내역
                            </a>
                        </li>
                        <li>
                            <a href="mypageQna">
                                <img src="member/icon/icons8-chat-30.png" />1:1문의
                            </a>
                        </li>
                        <li>
                            <a href="withdrawal">회원탈퇴
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
        </div>