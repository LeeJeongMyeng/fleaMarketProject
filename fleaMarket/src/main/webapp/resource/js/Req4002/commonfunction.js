/**
 * 
 */
// 로그인세션확인
function loginCk(sessionid){
	if(sessionid==""){
		alert("[안내메시지]로그인을 하셔야 이용이 가능합니다.")
		location.href="/fleaMarket/SignIn.do"
	}
}

// 유효성체크에 따른 focus처리
function contentfocus(what){
	$("button[title='Prev']").click()
  	 if(what=="title"){
  		$("input[name='title']").focus()
  	 }else{
  		expeditor.focus()
  	 }
  }
  
// 내용에 파일업로드 버튼 숨김처리
$(".ql-link").hide()