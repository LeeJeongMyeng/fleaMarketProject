    //회원가입 양식 애니메이션
    const firstSection = document.querySelector('#SignUp_firstSection'); //두번째 섹션
	const secondSection = document.querySelector('#SignUp_secondSection'); //첫번쨰 섹션
	const Signup_infomation = document.querySelector('.Signup_infomation');//step문구
	secondSection.style.display ='none';
	
	
	function SignUpNext(number){
		var documentVal1;
		var documentVal2;
		if(number==1){
			documentVal1 = '#SignUp_firstSection'
			documentVal2 = '#SignUp_secondSection'
		}else if(number==2){
			
		}
		
		SignUpNextStage(documentVal)
	}
	
	
	//다음버튼눌렀을 때,
    function SignUpNextStage(documentVal1,documentVal2){
		const Section = document.querySelector(documentVal1); //두번째 섹션
    	Signup_infomation.innerHTML = '<span class="font-weight-bolder">step 2/2</span><br>추가정보를 기입하시고,<br> 회원가입을 완료하세요!</p>'
    	Section.classList.add('animate__fadeOutLeft'); // 엘리먼트에 애니메이션 클래스 부여
    }
    firstSection.addEventListener('animationend', () => {
    	secondSection.style.display ='block';
    	secondSection.classList.add('animate__fadeInRight');
    	
    });
    
    //이전 버튼 눌렀을때,
    function SignUpPrev(){
		Signup_infomation.innerHTML ='<span class="font-weight-bolder">step 1/2</span><br>가입하실 회원님의 정보를 입력해주세요.</p>';
		firstSection.classList.remove('animate__fadeOutLeft');
		secondSection.classList.add('animate__fadeOutRight');
		
	}
	secondSection.addEventListener('animationend', () => {
    	firstSection.style.display ='block';
    	firstSection.classList.add('animate__fadeInLeft');
    	
    });
    
    
	//회원가입 완료 버튼
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }