
	var OkEamil = false;
	var OkPass1 = false;
	var OkPass2 = false;
	var OkName = false;
	var OkRrn = false;
	var OkPhonenum = false;
	var OkAddress =false;
	var OkAuth=false;
	
	$('.SignUp_ProfileWrap').slideUp('slow') //사업자등록증 input
	
	//회원가입 다음스탭 이전스탭 넘기는 핸들러
	function SignUpHandler(number){
		var absnumber = Math.abs(number) //섹션 지정용 절대값
		var documentVal1 = '#SignUp_'+absnumber+'Section'; //기준섹션
		var documentVal2 = '#SignUp_'+(absnumber+1)+'Section'; //옮겨질 섹션
		var infomationText;//step에 출력될 문구 선언
		var Method; // 다음/이전 지정
		
		if(number==1){ //섹션에 표현될 문구 지정
			infomationText = '<span class="font-weight-bolder">step 2/3&nbsp;&nbsp;&nbsp;추가 정보를 기입해주세요</p>'			
		}else if(number==2){			
			infomationText = '<span class="font-weight-bolder">step 3/3&nbsp;&nbsp;&nbsp;마지막 정보를 선택해주세요</p>'		
		}else if(number==-2){
			infomationText = '<span class="font-weight-bolder">step 2/3&nbsp;&nbsp;&nbsp;추가 정보를 기입해주세요</p>'		
		}else if(number==-1){
			infomationText = '<span class="font-weight-bolder">step 1/3&nbsp;&nbsp;&nbsp;다음 정보를 입력해주세요.</p>'
		}	
		var Method = number>0?'next':'prev'; // 다음,이전 선택

		return SignUpSectionMove(documentVal1,documentVal2,infomationText,Method);
	}
	
	//핸들러에서 온 정보를가지고 이전/타음스탭 행동
	function SignUpSectionMove(documentVal1,documentVal2,infomationText,method){
		Section = document.querySelector(documentVal1); //두번째 섹션
		Section2 = document.querySelector(documentVal2); //두번째 섹션
		 document.querySelector('.Signup_infomation').innerHTML = infomationText;//step문구
		Section.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		Section2.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		if(method=='next'){
			Section2.style.display='block';
			Section.classList.add('animate__fadeOutLeft');
			Section2.classList.add('animate__fadeInRight');
		}else{
			Section.style.display='block';
			Section2.classList.add('animate__fadeOutRight');
			Section.classList.add('animate__fadeInLeft');
		}
	}
    
   //마지막스탭 이쁘게 하는고
   	$('.SignUp_cardgroup .card').click(function(){
		   //이뿌게하기
		   if($(this).attr('id')=="SignUp_SellerCard"){   
		   	$(this).children('img').attr('src','https://cdn-icons-png.flaticon.com/512/3981/3981099.png').css("transform","scale(1.4)")		
			$('#SignUp_buisnessmanCard img').attr('src','https://cdn-icons-png.flaticon.com/512/1378/1378542.png')
						.css("transform","scale(1.0)")
			$('#SignUp_buisnessmanCard').css('background-color','white');
			$('.SignUp_ProfileWrap').slideUp('slow')
			
		   }else{
			//이뿌게하기
		   	$(this).children('img').attr('src','https://cdn-icons-png.flaticon.com/512/1378/1378644.png').css('transform','scale(1.4)')
			$('#SignUp_SellerCard img').attr('src','https://cdn-icons-png.flaticon.com/512/3981/3981072.png')
						.css("transform","scale(1.0)")
			$('#SignUp_SellerCard').css('background-color','white');
			alert("사업자 가입은 사업자등록증이 필수로 첨부되어야합니다.")
			$('.SignUp_ProfileWrap').slideDown('slow')			
		   }
		   $(this).css('background-color','#f5f2f6')
	   })
	 
	 
	//이메일 양식확인
$('#CheckEmailBtn').click(function(){
	var RegEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var EmailVal = $('[name=email]').val()
	var Emaildoc = $('[name=email]')
	if(!RegEmail.test(EmailVal) || EmailVal==''){
		//$('pass1feedback').text('이메일 형식이 맞지않습니다.')
		Emaildoc.addClass('is-invalid')
		return false;
	}else{
		var qstr ="email="+EmailVal
		$.ajax({
			url:"DuplicateEmail.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				if(data==null){
					Emaildoc.removeClass('is-invalid')
					Emaildoc.addClass('is-valid')
					sendEmail()
				}else{
					alert("중복된 이메일이 있습니다. 다시입력바랍니다.")
					$('#emailfeedback').text('이메일 형식이 맞지않습니다.')
					Emaildoc.val('')
					Emaildoc.focus()
					Emaildoc.addClass('is-invalid')
				}
			},
			error:function(xhr,status,error){
                  console.log(xhr)
                  console.log(status)
                  console.log(error)
            }
		})
		
		
	}
})


//이메일 보내기
emailjs.init("mzN3R1G0GZQBRs8hh");
var SixRanNum = ""; 
        function sendEmail(){
        	SixRanNum=""
        	//6자 난수생성
        	for(let i = 0; i < 6; i++) {
        		SixRanNum += Math.floor(Math.random() * 10)
        	  }           	
        	
          var templateParams = {
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                to_name: $('[name=email]').val(),
                to_email : $('[name=email]').val(),
                message : SixRanNum
                
          }
         emailjs.send('service_ee7pra4','template_azph6ba', templateParams)
         //emailjs.send('service ID', 'template ID > emailjs 페이지에서 만든 템플릿에서 확인이 가능하다', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       alert('입력하신 메일을 확인하시고, 인증번호를 입력부탁드립니다.')
         	       
         	    }, function(error) {
         	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!')
         	    });
       } 
        
 $('#checkEmailCode').keyup(function(){
    	 if($(this).val()==SixRanNum){
			 alert("확인되었습니다. 감사합니다.")
			 $('[name=email]').attr('readonly',true)
    		 $(this).attr('readonly',true)
    		 $(this).addClass("is-valid")
    		 OkEamil = true;
    	 }
      });
	 
	 
	
    
	//회원가입 완료 버튼
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }