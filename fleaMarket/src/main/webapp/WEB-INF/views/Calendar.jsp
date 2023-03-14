<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${path}/resource/js/Req3000/index.global.js"></script>
<script src="${path}/resource/js/Req3000/index.global.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
	

<script>
  // 위 js를 사용할 수 있게 같은 폴드에 있는 dist 폴드를
  // 복사해서 webapp/a00_com  폴드하위에 넣어주세요.
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	// 오늘 날짜로 초기화면이 로딩되게 처리
	console.log(new Date())
	console.log(new Date().toISOString())
	var toDay = new Date().toISOString().split("T")[0];
	console.log(toDay);
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: toDay,
      //navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      // eventClick: function(arg)
      //  select: function(arg)
      // 월별/주간/일별 현황에서 클릭, 스크롤, 
      select: function(arg) {
    	  // 해당 선택된 날짜의 시작/마지막 시간 일정, 
    	  // 전일/시간인지를 가져와서,
    	  // 다이얼로그 박스로 기본 데이터 표현
    	  $("h2").click();
          console.log("# 등록시 내용 # ")
          console.log(arg) 
          // 입력되는 기본 정보 재로딩 초기화
          $("form")[0].reset()
          
          $("#modalTitle").text("일정등록")
          $("#regBtn").show()
          $("#uptBtn").hide()
          $("#delBtn").hide()
          // 저장되는 시간을 ISO형식의 GMT 시간
          $("[name=start]").val(arg.start.toISOString())
          // 현재 한국시간을 표현
          $("#start").val(arg.start.toLocaleString())
          $("[name=end]").val(arg.end.toISOString())
          $("#end").val(arg.end.toLocaleString())
          $("[name=allDay]").val(arg.allDay?1:0);
          $("#allDay").val(""+arg.allDay)
    	  
    	  // 초기 등록시 이벤트 핸들러
    	/*
        var title = prompt('일정 등록:');
        console.log("# 등록시 내용 # ")
        console.log(arg)
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
        */
      },
      // 등록된 일정을 클릭시
      eventClick: function(arg) {
    	 // 등록된 데이터 이벤트 핸들러
    	  $("h2").click();
          console.log(arg) 
          // 입력되는 기본 정보 재로딩 초기화
          $("#modalTitle").text("일정상세화면")
          $("#regBtn").hide()
          $("#uptBtn").show()
          $("#delBtn").show()
          // 해당 일정에 데이터 정보를 가지고 오고,
          // arg.event : 일정에 대한 상세 정보를 가져고 온다.
    	  addForm(arg.event)	
    	/*  
        if (confirm('Are you sure you want to delete this event?')) {
          	arg.event.remove()
        }
    	*/
      },
      // 클릭하여 스크롤 해서 다른 날짜로 변경 했을 때,
      eventDrop:function(info){
			addForm(info.event)
			ajaxFun("uptCalendar.do")
	  },
	  // 시간일정에서 하단 부분을 스크롤해서 일정 범위를 변경했을 때.
	  eventResize:function(info){
			addForm(info.event)
			ajaxFun("uptCalendar.do")
	  },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
   	  // 상단에 jquery lib 호출	
      events:function(info, successCallback, failureCallback){
			$.ajax({
				type:"post",
				url:"calendarAjax.do",
				dataType:"json",
				success:function(data){
					console.log(data.callist)
					successCallback(data.callist)
				},
				error:function(err){
					console.log(err)
				}
			})
		} 
    });
	
    calendar.render();
        
    $("#regBtn").click(function(){
    	if($("[name=title]").val()==""){
    		alert("일정을 입력하세요")
    		$("[name=title]").focus()
    		return;
    	}
    	ajaxFun("insCalendar.do")
    });
	$("#uptBtn").click(function(){
		if(confirm("수정하시겠습니까?")){
			ajaxFun("uptCalendar.do")
		}
	})	     
	$("#delBtn").click(function(){
		if(confirm("삭제하시겠습니까?")){
			ajaxFun("delCalendar.do")
		}
	})	    
    
    $("[name=urllink]").dblclick(function(){
		if(confirm("페이지이동하시겠습니까?")){
			window.open($(this).val())
			//location.href=$(this).val()
		}
   	})    
  });
  /* 	function ajaxFun(url){
  		$.ajax({
  			type:"post",
  			url:"/springweb/"+url,
  			data:$("form").serialize(), // form하위 데이터 요청형식변경
  			dataType:"json",
  			success:function(data){
  				alert(data.msg)
  				location.reload() 
  				// 화면 refresh 전체데이터 로딩 처리
  			},
  			error:function(err){
  				console.log(err)
  			}
  		})
  	}
  
  	// eventClick 함수에서   addForm(arg.event) 추가
	function addForm(event){
  		console.log("# 상세화면 #")
  		console.log(event)
  		// event 객체 : DB에서  백앤드단에서 호출한 데이터를 가지고
  		// 있음.
        $("form")[0].reset()
        $("[name=id]").val(event.id)
        $("[name=title]").val(event.title)
        $("[name=textColor]").val(event.textColor)
        $("[name=backgroundColor]").val(event.backgroundColor)
        $("[name=writer]").val(event.extendedProps.writer)   
        $("[name=content]").val(event.extendedProps.content)
        $("[name=url]").val(event.url)
        $("[name=start]").val(event.start.toISOString())
        $("#start").val(event.start.toLocaleString())
        // 일일로 종일로 등록된 데이터는 마지막데이터를 가져오지 않는다.
        
        if(event.end==null){
        	$("[name=end]").val(event.start.toISOString())
        	$("#end").val(event.start.toLocaleString())
        }else{
        	$("[name=end]").val(event.end.toISOString())
        	$("#end").val(event.end.toLocaleString())
        }
        $("[name=allDay]").val(event.allDay?1:0);
        $("#allDay").val(""+event.allDay)		
    	$("[name=urllink]").val(event.extendedProps.urllink);     
		
	}
   */
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  	<div id='calendar'></div>
  	<h2 data-toggle="modal" data-target="#exampleModalCenter"></h2>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalTitle">타이틀</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="form" novalidate>
	          <input type="hidden" name="id" value="0"/>
	          <div class="mb-3">
	            <label for="title">일정명</label>
	            <input type="text" name="title" class="form-control" id="title" placeholder="일정타이틀입력" >
	          </div>
	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="start">시작일</label>
	              <!-- 
	              GMT 시간과 한국에서 사용되는 시간 +9차이
	               -->
	              <input readonly type="text" id="start" class="form-control"  >
	              <input type="hidden" name="start" class="form-control"  >
	            </div>
	            <div class="col-md-6 mb-3">
	              <label for="end">종료일</label>
	              <input readonly type="text" id="end" class="form-control">
	              <input type="hidden" name="end" class="form-control">
	            </div>  
	          </div>
	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="writer">작성자</label>
	              <input type="text" name="writer" class="form-control" id="writer" >
	            </div>
	            <div class="col-md-6 mb-3">
 	              <label for="allDay">종일여부</label>
 	              <!-- 
 	              db : 1/0
 	               -->
				  <select  id="allDay" class="form-control" >
				   	<option value="true">종일</option>
				   	<option value="false">시간</option>
				  </select>
				  <input type="hidden" name="allDay"/>
	            </div>  
	              <script type="text/javascript">
	              	$("#allDay").change(function(){
	              		$("[name=allDay]").val($(this).val()=='true'?1:0);
	      	        })
	              	// 16:05~~
	              </script>	
	            
	          </div>
	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="textColor">글자색상</label>
	              <input type="color"  value="#ccffff"  name="textColor" class="form-control" id="textColor" >
	            </div>
	            <div class="col-md-6 mb-3">
	              <label for="backgroundColor">배경색상</label>
	              <input type="color"  value="#0099cc"  name="backgroundColor" class="form-control" id="backgroundColor" >
	            </div>  
	          </div>
	          <div class="mb-3">
	            <label for="content">내용</label>
	            <textarea name="content" rows="5" class="form-control" id="content" placeholder="일정내용입력"></textarea>
	          </div>	   
  	          	
	          <div class="mb-3">
	            <label for="url">링크 주소</label>
	            <input type="url" name="urllink" class="form-control" id="url" placeholder="링크할 주소 입력" >
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button id="regBtn" type="button" class="btn btn-primary">등록</button>
	        <button id="uptBtn" type="button" class="btn btn-success">수정</button>
	        <button id="delBtn" type="button" class="btn btn-warning">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
