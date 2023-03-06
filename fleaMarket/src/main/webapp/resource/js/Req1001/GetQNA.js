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
	
