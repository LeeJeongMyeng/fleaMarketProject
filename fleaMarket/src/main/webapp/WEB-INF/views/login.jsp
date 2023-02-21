<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜꽁 로그인</title>
<style type = "text/css">
 .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
</style>
<link href="login_css.css" rel="stylesheet">
</head>
<script type="text/javascript">
</script>
<body>
<div class="wrapper">
    <header>
        <a href = "/ljw/pg0000.jsp" class="logo"><img src="/index_markup/img/main_logo.png" alt="#"></a>
    </header>
    <section>
        <div class="content">
            <form action="/loginController" method="POST" onsubmit= "return userLoginCheck()">
                <div class="input-box">
                    <input id="username" type="text" name="email" placeholder="이메일">
                    <label for="username">이메일</label>
                </div>
    
                <div class="input-box">
                    <input id="password" type="password" name="pws" placeholder="비밀번호">
                    <label for="password">비밀번호</label>
                </div>
                <div id="forgot">
                    <div id = "s01">
                    <input type = "checkbox" name = "sVal"> 로그인 유지하기
                    <a href="emailAuth.jsp">비밀번호 찾기</a>
                </div>
                </div>
                <input type="submit" value="로그인">
            </form>
            <div id = "insert">
                <input id = "kakao" type = "button" value = "카카오톡으로 시작하기" class = "btnK01" onclick = "kakaoLogin();"/>
                <div id="naver_id_login"></div>
              <!--  <input id="naverIdLogin" type = "button" value = "페이스북으로 시작하기" class = "btnK"/> -->  
                <p id = "insert01">회원이 아니신가요? <a href = "/jyh/views/insertMember.jsp">회원가입 하러가기</a></p>
            </div>
            
            </div>
    </section>
    <footer>
        <nav class="footer_nav">
            <ul>
                <li><a href="#">서비스 이용약관</a></li>
                <li><a href="#">개인정보 처리방침</a></li>
                <li><a href="#">제휴 문의</a></li>
                <li><a href="#">채용 공고</a></li>
            </ul>
        </nav>
        <p class="jjim_info">
            (주) 찜꽁<br>
            대표 : 이지원<br>
            주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
            사업자등록번호 : 202212142126<br>
            개인정보담당 : service@jjimggong.co.kr
        </p>

    </footer>
</div>
</body>
<script type = "text/javascript" src  ="/jyh/views/login.js"></script>
<!-- 카카오로그인  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type = "text/javascript">
Kakao.init('03e5c6119df4ebdf957a08df6af0c7b8'); // 카카오 javascript 인증키 
console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>
<!-- 네이버 로그인 sdk  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type = "text/javascript"> 

// 네이버 로그인 부분 
var naver_id_login = new naver_id_login("Pp6ncKR77fvsHhOSuTz1", "http://localhost:8090/fleaMarket/login.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:7008/jyh/views/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
  	
 //부모창에 있어야함. 	
  	function nloginform(naverEmail){
  		var frm = document.createElement('form');
  		frm.setAttribute('method', 'post');
  		frm.setAttribute('action', '/makeSession');
  		var hiddenInput = document.createElement('input');
  		hiddenInput.setAttribute('type','hidden');
  		hiddenInput.setAttribute('name','email');
  		hiddenInput.setAttribute('value',naverEmail);
  		frm.appendChild(hiddenInput);
  		document.body.appendChild(frm);
  		frm.submit();
  	}

  	function createHiddenform(naverId,email,nik){	
  		var fm = document.createElement('form');
  		fm.setAttribute('method','post');
  		fm.setAttribute('action','/naverController');
  		var hInput = document.createElement('input');
  		hInput.setAttribute('type','hidden');
  		hInput.setAttribute('name','id');
  		hInput.setAttribute('value',naverId);
  		fm.appendChild(hInput);
  		var hInput1 = document.createElement('input');
  		hInput1.setAttribute('type','hidden');
  		hInput1.setAttribute('name','email');
  		hInput1.setAttribute('value',email);
  		fm.appendChild(hInput1)
  		var hInput2 = document.createElement('input');
  		hInput2.setAttribute('type','hidden');
  		hInput2.setAttribute('name','nik');
  		hInput2.setAttribute('value',nik);
  		fm.appendChild(hInput2);
  		document.body.appendChild(fm);
  		fm.submit();
  	}
  	
  	var naver_id_login = new naver_id_login("Pp6ncKR77fvsHhOSuTz1", "http://localhost:8090/fleaMarket/login.do");
    // 접근 토큰 값 출력
    // alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
      var id = naver_id_login.getProfileData('id');
      var nik = naver_id_login.getProfileData('nickname');
      var email = naver_id_login.getProfileData("email");
      console.log(id);
      console.log(nik);
      console.log(email);
      var xhr = new XMLHttpRequest();
      //아이디값으로 바꾸기 ㅇㅋ? 
  		xhr.open("get","/checkIDservice?email="+email,true);
  		xhr.send();
  		
  		xhr.onreadystatechange=function(){
  			if(xhr.readyState==4 && xhr.status==200){
  				var ck = xhr.responseText;
  					if(ck =="naver_auth"){
  						 //만약 DB 아이디 설정이 있을 때 카카오 아이디가 바뀔수 있어서 
  						 //db 값을 불러옴 ㅇㅋ? 
  						 alert("네이버 인증되었습니다.");
  						 window.opener.nloginform(email);
  						 window.close();
  					}else if(ck == "kakao_auth"||ck.chId == "zzim_auth"){
  						alert("다른 연동 계정이 있습니다.");
  						window.close();
  						location.href = "/jyh/view/login.jsp";
  					}else{
  						alert("네이버 인증 회원가입 실행");
  						console.log(id);
  						window.opener.createHiddenform(id,email,nik);
  						window.close();
  					}
  			}
  		}
    }
//  	백엔드랑 통신 
</script>
</html>