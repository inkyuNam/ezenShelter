// main 이미지 슬라이드

	var timer1;
    var imgNum=0;   

        function moveImg(){
            timer1 = window.setInterval(function(){
            var dist= imgNum*1200*(-1);
            document.getElementById('slide').style.left = dist+"px";
            imgNum++;
            if(imgNum>2)imgNum=0;
            },2500)
        }
            
        function stop(){
            window.clearInterval(timer1);
        }
        
        
        $(function(){
	
	        $('#slide').hover(function(){
				 stop();
			})
			
			$('#slide').mouseout(function(){
				moveImg();
			})
			
		})
		
// 로그인 체
function loginCheck(){
    	if(document.loginFrm.id.value==""){
    		alert("아이디를 입력하세요.");
    		document.loginFrm.id.focus();
    		return false;
    	}
    	if(document.loginFrm.pwd.value==""){
    		alert("비밀번호를 입력하세요.");
    		document.loginFrm.pwd.focus();
    		return false;
    	}else{
    		document.loginFrm.action="DC.do?command=login";
    		document.loginFrm.submit();
    	}
}


// div 숨김처리한거 보이게 하는거랑 사라지는거    
     $(function (){
        $('#log').click(function(){
            $('#loginForm').fadeIn(500,function(){});
        });
        $('.closeLog').click(function(){
            $("#loginForm, #terms ,#help_wrap").fadeOut(500,function(){});
        });
        $('#join').click(function(){
        	$('#terms').fadeIn(500,function(){});
        	$('#loginForm').fadeOut(500,function(){});
        });
        $('#help_icon').click(function(){
			$('#help_wrap').fadeIn(500,function(){});
		});
    });  

  $(document).mouseup(function (e){
    var loginForm = $('#loginForm');
    if( loginForm.has(e.target).length === 0){
      loginForm.css('display','none');
    }
});