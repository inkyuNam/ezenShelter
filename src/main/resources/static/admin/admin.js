

function new_shelter_img(){
	var url = "selectShelterImg";
	var opt = "toolbar=no, menubar=no, status=no, scrollbars=no, location=no, resizable=no,";
	opt = opt + " height=150, width=200, top=100, left=700,";
	window.open(url,"selectShelterImg",opt);
}











/* 로그인 */
function admin_log_chk(){
	if(document.ad_log.id.value==""){
		document.ad_log.id.focus();
	}else if(document.ad_log.pwd.value==""){
		document.ad_log.pwd.focus();
	}else{
		document.ad_log.submit();
	}
}





/* 헬프 디테일 */
function end_chk(hnum){
	if(confirm('완료처리 하시겠습니까?')){
		location.href="help_end?h_num="+hnum;	
	}
	
}

function del_chk(h_num){
	if(confirm('정말 삭제해도 되겠는감?')){
		location.href="help_del?h_num="+h_num;	
	}
}


/* 펫 리스트  */
$(function (){
	$('.imgsz').mouseover(function (){	
		$(this).addClass("big_imgs");
		$(this).css("z-index",5000);
		$('.big_imgs img').css("width","500px");
	});
	$('.imgsz').mouseout(function (){
		$('.big_imgs img').css("width","200px");
		$(this).css("z-index",1);
		$(this).removeClass("big_imgs");
	});
});
	


/* 펫 디테일 */
function state_update(pnum,hnum){
	if(confirm('알맞은 상태에 체크되었는지 다시 한번 확인 후에 확인 버튼을 눌러주세요.')){
		var value = $('input:radio[name=state]:checked').val();
		
		location.href="DC.do?command=updatePetState&p_num="+pnum+"&state="+value+"&hnum="+hnum;
	}
}


function change_shelter(){
	var url = "DC.do?command=selectShelter";
	var opt = "toolbar=no, menubar=no, status=no, scrollbars=no, location=no, resizable=no,";
	opt = opt + " height=650, width=900, top=100, left=700,";
	window.open(url,"selectShelter",opt);
}

	/* 보호소 선택 팝업창	*/
	$(function(){
				var item = $('.classa').click(function(){
					$('.classa').removeClass('checked');
					$(this).addClass('checked');
					$('.shelter_detail').removeClass('selected_shelter');
					$('.shelter_detail').eq(item.index(this)).addClass('selected_shelter');
					
				});
			});
			
			function sel_shel(s_num,s_name) {
				
				opener.update_frm.sh_name.value=s_name;
				opener.update_frm.s_num.value=s_num;
				self.close();
			}




function update_pet(){
	
	document.update_frm.action="DC.do";
	document.update_frm.submit();
}

function update_date(num){
	
	if(confirm('정확한 일자를 선택했는지 다시 한번 확인해주세요 ')){
		var date = document.getElementById('new_date').value;
		location.href="DC.do?command=updateDate&num="+num+"&date="+date; 
	}
	
}

/* 새로운 펫 추가 */
function simple_chk(){
	if(confirm('새로운 아이가 왔나요?')){
		location.href='DC.do?command=addPetForm';
	}
}

function read_img(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('imgs').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else{
		document.getElementById('imgs').src = "";
	}
}


/* 후기 게시판 삭제  */
function ConfirmDelete(b_num){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}else{
		location.href="DC.do?command=adminBoardDelete&b_num=" + b_num;
	}
}


/* qna 답변 작성 */
function qna_answer(qa_num){
	var answer = document.getElementById('qna_answer').value;
	if(answer==""){
		alert("답변내용을 작성해주세요.");
	}else{
	if(confirm('답변완료하시겠습니까?')){	
		location.href="adminQnaAnswer?qa_num="+qa_num+"&answer="+answer;
		}
	}
}

