    //회원가입 양식 애니메이션
    //const firstSection = document.querySelector('#SignUp_firstSection'); //두번째 섹션
	//const secondSection = document.querySelector('#SignUp_secondSection'); //첫번쨰 섹션
	//const thirdSection = document.querySelector('#SignUp_thirdSection'); //첫번쨰 섹션
	const Signup_infomation = document.querySelector('.Signup_infomation');//step문구
	//secondSection.style.display ='none';
	
	
	function SignUpHandler(number){
		var documentVal1;
		var documentVal2;
		var infomationText;
		if(number==1){
			documentVal1 = '#SignUp_firstSection';
			documentVal2 = '#SignUp_secondSection';
			infomationText = '<span class="font-weight-bolder">step 2/3</span><br>추가 정보를 기입해주세요</p>'
			return SignUpNextStage(documentVal1,documentVal2,infomationText);
		}else if(number==2){
			documentVal1 = '#SignUp_secondSection';
			documentVal2 = '#SignUp_thirdSection';
			infomationText = '<span class="font-weight-bolder">step 3/3  마지막입니다ㅠㅠ</span><br>추가정보를 기입하시고,회원가입을 완료하세요</p>'
			return SignUpNextStage(documentVal1,documentVal2,infomationText);
		}else if(number==-2){
			documentVal1 = '#SignUp_secondSection';
			documentVal2 = '#SignUp_thirdSection';
			infomationText = '<span class="font-weight-bolder">step 2/3</span><br>추가 정보를 기입해주세요</p>'
			return SignUpPrevStage(documentVal1,documentVal2,infomationText);
		}else if(number==-1){
			documentVal1 = '#SignUp_firstSection';
			documentVal2 = '#SignUp_secondSection';
			infomationText = '<span class="font-weight-bolder">step 1/3</span><br>다음 정보를 입력해주세요.</p>'
			return SignUpPrevStage(documentVal1,documentVal2,infomationText);
		}
		
		
	}
	
	
	//다음버튼눌렀을 때,
	var Section; //섹션 변수
	var Section2; //섹션2 변수
    function SignUpNextStage(documentVal1,documentVal2,infomationText){
		Section = document.querySelector(documentVal1); //두번째 섹션
		Section2 = document.querySelector(documentVal2); //두번째 섹션
    	Signup_infomation.innerHTML = infomationText;
			Section.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
			Section2.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
			Section.classList.add('animate__fadeOutLeft');
			Section2.style.display='block';
			Section2.classList.add('animate__fadeInRight');
    }
    
    //이전 버튼 눌렀을때,
    function SignUpPrevStage(documentVal1,documentVal2,infomationText){
		Section = document.querySelector(documentVal1); //두번째 섹션
		Section2 = document.querySelector(documentVal2); //두번째 섹션
		Signup_infomation.innerHTML =infomationText;
		Section.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		Section2.classList.remove('animate__fadeInRight','animate__fadeOutRight','animate__fadeInLeft','animate__fadeOutLeft');
		 Section.style.display='block';
		 Section2.classList.add('animate__fadeOutRight');
		 Section.classList.add('animate__fadeInLeft');
		
		
	}
	/*secondSection.addEventListener('animationend', () => {
    	firstSection.style.display ='block';
    	firstSection.classList.add('animate__fadeInLeft');
    	
    });*/
    
    
	//회원가입 완료 버튼
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }