<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" href="/css/mypage/member.css">
<script src="/script/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
function joinIdCheck(){
	if(document.joinFrm.id.value==""){
		alert("아이디를 입력하고 중복체크를 진행하세요.");
		document.joinFrm.id.focus();
		return;
	}
	var url="idCheckForm?id=" + document.joinFrm.id.value;
	var opt="toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	window.open(url,"IdCheck",opt);
}
</script>
</head>
<body>

<div id="ezenLogo"><a href="/"><img src="/images/logo.png" width="200" height="70"></a></div>
	<form name="joinFrm" method="post">	
	<div class="joinWrap" id="joinFirst" style="z-index:1">
		<div style="font-weight:bold; font-size:150%; color: #061f5c;">회원가입</div>
		<div class="fonts" style="position:absolute; top:80px;">아이디 *</div>
		<div class="userInput" style="top:110px; border:none;">
		<div id="joinIdInput"><input type="text" size="20" name="id" value="${dto.id}"><input type="hidden" name="reid" value="${reid}"></div>
		<div class="fonts" id="joinIdCheck" onClick="joinIdCheck()">중복확인</div>
		</div>
		<div class="fonts" style="position:absolute; top:150px;">이름 *</div>
		<div class="userInput" style="top:180px;"><input type="text" size="37" name="name" value="${dto.name}"></div>
		<div class="fonts" style="position:absolute; top:220px;">비밀번호 *</div>
		<div class="userInput" style="top:250px;"><input type="password" size="37" name="pwd" value="${dto.pwd}"></div>
		<div class="fonts" style="position:absolute; top:290px;">비밀번호 확인 *</div>
		<div class="userInput" style="top:320px;"><input type="password" size="37" name="rePwd" value="${rePwd}"></div>
		<div class="fonts" style="position:absolute; top:360px;">전화번호 *</div>
		<div class="userInput" style="top:390px;"><input type="text" size="15" name="phone" value="${dto.phone}"></div>
		<div class="fonts" style="position:absolute; top:430px;">이메일 *</div>
		<div class="userInput" style="top:460px;"><input type="text" size="37" name="email" value="${dto.email}"></div>
		<div class="fonts" style="position:absolute; top:500px;">우편번호 *</div>
		<div class="userInput" style="top:530px; width:100px;">
		<div><input type="text" id="sample6_postcode" size="9" name="post_code" readonly value="${dto.post_code}"></div>
		<div id="postBtn"><input style="right:50px;" type="button" onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기"></div>		
		</div>
		<div class="userInput" style="top:570px;">
		<input type="text" id="sample6_address" size="37" name="address1" value="${dto.address1}" readonly></div>
		<div class="userInput" style="top:610px;">
		<input type="text" id="sample6_detailAddress" size="37" name="address2" value="${dto.address2}" placeholder=" 상세주소 입력"></div>
		<div class="userInput" style="top:650px; width:200px;">
		<input type="text" id="sample6_extraAddress" size="15" name="address3" value="${dto.address3}" readonly></div>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script><br>
		<div id="msg">${msg}</div>
		<div class="fonts" id="prevBtn" onClick="location.href='/'">
			메인 페이지로
		</div>
		<div class="fonts" id="joinBtn"  onClick="go_join()">
			회원 가입
		</div>
		<script type="text/javascript">
			function go_join(){
				document.joinFrm.action = "join";
				document.joinFrm.submit();
			}
		</script>
	</div>	
</form>


</body>
</html>