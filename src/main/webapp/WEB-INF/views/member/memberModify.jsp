<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../include/sub01/myPageSub.jsp" %>


<div class="main-area">
                <h2>회원 정보 수정</h2><hr>
                <form name="update_frm" method="post" action="updateMember">              
                
                <div class="rightBlock">
                    <div class="userInfo">
                        <h4>이름</h4>
                         <div class="userDetail">
                        <div id="valued">${loginUser.name}</div>
   						<input type="hidden" name="name" value="${loginUser.name}">
   						<input type="hidden" name="id" value="${loginUser.id}">
                         </div>

                        <h4>아이디</h4>
                         <div class="loginid">
                         <div id="valued">${loginUser.id}</div>
                         </div>
                        
                         <h4>비밀번호</h4>
                        <div class="loginpwd">
                        	<div>
                         		<input type="password" name="pwd"  placeholder="새로운 비밀번호 입력" class="input_value">
                         	</div><br>
                         	<div>
                     			<input type="password" name="pwd_check" placeholder="비밀번호 확인" class="input_value">
                     		</div>
                        </div>


                <h4>휴대폰</h4>
				    <div class="phone">
							<div>
							<input type="text" name="phone" class="input_value" maxlength="12" value="${loginUser.phone}">
							</div>									               
                    </div>
            </div>
            </div>


                                    
             <div class="leftBlock">
             	<div class="userAdress">
                 <h4>주소</h4>
                 <div style="float:left;"><input id="sample6_postcode" name="post_code" size=5 value="${loginUser.post_code}" readonly></div>
                 <div style="float:left; margin-left: 10px" ><input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></div>
                 <div class="address">
                 	<div><input id="sample6_address" name="address1" size=25 value="${loginUser.address1}" readonly></div>
                    <div><input type="text" id="sample6_detailAddress" size=25 name="address2" placeholder="세부 주소 입력" value="${loginUser.address2}" ></div>
                    <div><input id="sample6_extraAddress" name="address3" size=10 value="${loginUser.address3}" readonly></div>
                  </div>
                  <div style="clear:both;"></div>
             </div>
             
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
</script>
             
              
                <div class="mail">
                    <h4>이메일</h4>
                     
                     <div><input type="text" name="email" placeholder="이메일 주소 입력"  class="input_value"  value="${loginUser.email}"></div>
                     
                </div>



            </div>
            
            <div style="clear:both;"></div>
            
           	<input type="submit" class="myButton" value="수정하기" onclick="return update_chk()">
			</form>
</div>
     <div style="clear:both;"></div>
     
     <script type="text/javascript">
     function update_chk(){   		
    		if(document.update_frm.pwd.value ==""){
    			alert('비밀번호를 입력하세요');
    			document.update_frm.pwd.focus();
    			return false;
    		} else if(document.update_frm.pwd.value != document.update_frm.pwd_check.value){
    			alert('비밀번호가 일치하지 않습니다.');
    			document.update_frm.pwd.focus();
    			return false;
    		} else if(document.update_frm.phone_one.value == ""){
    			alert('전화번호를 입력해 주세요');
    			document.update_frm.phone_one.focus();
    			return false;
    		}else if(document.update_frm.m_phone_two.value == ""){
    			alert('전화번호를 입력해 주세요');
    			document.update_frm.m_phone_two.focus();
    			return false;
    		} else if(document.update_frm.address1.value == ""){
    			alert('주소를 선택해주세요');
    			document.update_frm.name.focus();
    			return false;
    		}    		
    		alert('회원정보가 성공적으로 수정되었습니다.');
    		return;
    	}
     </script>
	

<%@ include file="../include/headerfooter/footer.jsp" %>