<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>네이버 로그인 Call Back</title>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("b06toaGrqKSfcX7fTe6V", "http://localhost:7008/views/naverCallback.jsp");
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
//	백엔드랑 통신 
</script>
</body>
<script type ="text/javascript">
</script>
</html>