    //회원가입 양식 애니메이션
    //const firstSection = document.querySelector('#SignUp_firstSection'); //두번째 섹션
	//const secondSection = document.querySelector('#SignUp_secondSection'); //첫번쨰 섹션
	//const thirdSection = document.querySelector('#SignUp_thirdSection'); //첫번쨰 섹션
	const Signup_infomation = document.querySelector('.Signup_infomation');//step문구
	//secondSection.style.display ='none';
	
	
	function SignUpHandler(number){
		var documentVal1 = '#SignUp_'+absnumber+'Section'; //기준섹션
		var documentVal2 = '#SignUp_'+(absnumber+1)+'Section'; //옮겨질 섹션
		var absnumber = Math.abs(number) //섹션 지정용 절대값
		var infomationText;//step에 출력될 문구 선언
		var Method; // 다음/이전 지정
		
		if(number==1){ //섹션에 표현될 문구 지정
			infomationText = '<span class="font-weight-bolder">step 2/3</span><br>추가 정보를 기입해주세요</p>'			
		}else if(number==2){			
			infomationText = '<span class="font-weight-bolder">step 3/3  마지막입니다ㅠㅠ</span><br>추가정보를 기입하시고,회원가입을 완료하세요</p>'		
		}else if(number==-2){
			infomationText = '<span class="font-weight-bolder">step 2/3</span><br>추가 정보를 기입해주세요</p>'		
		}else if(number==-1){
			infomationText = '<span class="font-weight-bolder">step 1/3</span><br>다음 정보를 입력해주세요.</p>'
		}
		
		var Method = number>0?'next':'prev'; // 다음,이전 선택

		return SignUpSectionMove(documentVal1,documentVal2,infomationText,Method);
	}
	
	
	function SignUpSectionMove(documentVal1,documentVal2,infomationText,method){
		Section = document.querySelector(documentVal1); //두번째 섹션
		Section2 = document.querySelector(documentVal2); //두번째 섹션
    	Signup_infomation.innerHTML = infomationText;
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
    
	//회원가입 완료 버튼
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }