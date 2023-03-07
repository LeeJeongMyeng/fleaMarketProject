$(document).ready(function(){
	//내용 입력시 input에 할당
	$('#editor .ql-editor').keyup(function(){
	 	var expeditor=$(this).html() 
		$('input[name=content]').val(expeditor); 
	})
	
	
});

//뒤로가기
$("#goQnaList").click(function(){
location.href="QNAList.do"	
})
	

//오케이 문구
function okmsg(){ 
			alert('수정이 완료되었습니다. 감사합니다.'); return true;
	
}

$('#QNAAnswerBtn').click(function(){

var anstitle = $('input[name=title]').val()
var ansqnano = $('input[name=qnano]').val()


location.href="MemberQnAreg.do?method=a&title="+anstitle+"&refno="+ansqnano
})