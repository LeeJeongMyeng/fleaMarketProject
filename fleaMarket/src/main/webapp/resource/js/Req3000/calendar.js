var toDay = new Date().toISOString().split("T")[0];
var calendar = new FullCalendar.Calendar(document.getElementById("calendar"), {
    initialView: "dayGridMonth",
    headerToolbar: {
      start: 'title', // will normally be on the left. if RTL, will be on the right
      center: '',
      end: 'today prev,next' // will normally be on the right. if RTL, will be on the left
    },
    selectable: true,
    editable: true,
    initialDate: toDay,
    //캘린더 정보 불러오기 
    events:function(info, successCallback, failureCallback){
		$.ajax({
			type:"post",
			url:"/springweb/calendarAjax.do",
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
