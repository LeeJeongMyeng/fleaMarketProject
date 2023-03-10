<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>플리마켓 등록</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle"
	href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<%-- gps --%> 
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75"></script> 
	
<script src="${path}/assets/js/plugins/fullcalendar.min.js"></script>
<%--주소 설정해주기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
var msg = "${msg}"
	if (msg != "") {
		alert(msg)
		if (msg + "\n 조회화면으로 이동하시겠습니까?") {
			location.href = "${path}/totalSearch.do"
		}
	}



$(document).ready(function(){

	//내용
	$('#editor .ql-editor').keyup(function(){
	
	 	var expeditor=$(this).html() 
		console.log("dd",expeditor);
		$('input[name=content]').val(expeditor); 
	})

	//등록하기 버튼
	$("#insBtn").click(function(){
		$("#aform").submit()
	})

	
});

</script>

</head>
<link href="${path}/resource/css/FleaMarketRe/FleaMarketRe.css"
	rel="stylesheet" />
<style>
#callendar01 {
	display: none;
}
</style>
<%@include file="header.jsp"%>
<body class="g-sidenav-show   bg-gray-100">

	<div class="min-height-300 bg-primary position-absolute w-100"></div>

	<main class="main-content position-relative border-radius-lg ">

		<!-- End Navbar -->
		<div class="container-fluid py-4"  style="margin-top:100px;">
			<div class="row">
				<div class="col-lg-9 col-12 mx-auto">
					<form  method="post"  action="fleaMarketins.do" id="aform" onsubmit="return checkForm1()"
						name="aform" enctype="multipart/form-data">
						<div class="card card-body mt-4">
							<h6 class="mb-0 fleamarket">플리마켓 등록</h6>
							<hr class="horizontal dark my-3">
							<input type="hidden" name="email" value="${Login.email}">
							<input type="hidden" name="bisenessNumber" value="${Login.businessnumber}">
							<label for="title" class="form-label labelFont">제목</label> 
							<input type="text" class="form-control" id="projectName" name="title">

			                <br>
                            <!-- 주소지정해주기 -->
							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">주소 설정</label> 
									<div class = "s_form">
									   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
									   <input name = "addrs1" onkeyup="callAdd(this)" type="text" id="sample6_address" class="form-control soooo2" placeholder="주소">
									<script>
									function callAdd(ob){
										//등록 버튼 추가해주기 
										if(event.keyCode==13){
											alert("등록:"+ob.value)
											geocoder.addressSearch(ob.value, mafun );  
											
										}
										//
										
										
									}
									
									
									</script>
									   <br>	
									  
									   				
                                    </div>
							     </div>
							</div>
							
							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">플리마켓 시작일</label> 
									<input class="form-control datetimepicker" type="text"
										placeholder="시작일을 선택해주세요" name="openDate" data-input>
								</div>
								<div class="col-6">
									<label class="form-label labelFont">플리마켓 종료일</label><input
										class="form-control datetimepicker" type="text"
										placeholder="종료일을 선택해주세요" name="closeDate" data-input>
								</div>
							</div>

							<!-- 캘린더 -->
							<div class="card card-calendar">
								<div class="card-body p-3">
									<div class="calendar" data-bs-toggle="calendar" id="calendar"></div>
								</div>
							</div>


							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">모집 인원</label> <input
										class="form-control" type="text" name="approvalMaxCnt">
								</div>
							</div>


							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">모집 시작일</label> <input
										class="form-control datetimepicker" type="text"
										placeholder="시작일을 선택해주세요" name="recruitmentStartDate"
										data-input>
								</div>
								<div class="col-6">
									<label class="form-label labelFont">모집 종료일</label> <input
										class="form-control datetimepicker" type="text"
										placeholder="종료일을 선택해주세요" name="recruitmentEndDate" data-input>
								</div>
							</div>

							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">장소</label>

								</div>

								<!-- gps -->
								<div class="map_wrap">
									<div id="map"
										style="width: 580px; height: 300px; position: relative; overflow: hidden;"></div>
									<div class="hAddr">

										<span id="centerAddr2"> </span> <span id="centerAddr3">
										</span>
									</div>
									<input Type="text" name="address" value="">
									
								</div>
								</div>

								<label class="mt-4 labelFont">내용</label>

								<div id="editor" style="height:294px;">

									<p id="contents">
										<br>
									</p>
								</div>
								<input type="hidden" name="content" id="content" value="">

								<div class="row">
									<div class="col-sm-4 col-6">
										<label class="form-label mt-4">첨부파일 유무</label> 
										<select	class="form-control" name="checkForm" id="choices-gender">
											<option value="N">필요없음</option>
											<option value="P">개인양식</option>
											<option value="C">공통파일</option>
										</select>
									</div>
								</div>
                          
								<label class="mt-4 form-label labelFont">첨부파일</label>
								<div class="row mt-3">
		                        <div class="col-2" style="height:120px;">
		                          <input type="file" name="pro" class="form-control" style="width:230px"
		                          		id="isFile" multiple  accept="">
		                           <div id="image_container"></div>
		                        </div>
		                      </div>
		             							
					</form>
					<div class="d-flex justify-content-end mt-4">
						<button type="button" id="insBtn"
							class="btn bg-gradient-primary m-0 ms-2">등록하기</button>
					</div>
				</div>
			</div>
		</div>


	</main>




	<!--   Core JS Files   -->
	<script src="${path}/assets/js/plugins/choices.min.js"></script>
	<script src="${path}/assets/js/plugins/quill.min.js"></script>
	<script src="${path}/assets/js/plugins/flatpickr.min.js"></script>
	<script src="${path}/assets/js/plugins/dropzone.min.js"></script>
	<script>

    
   //템플릿
  
    if (document.getElementById('editor')) {
      var quill = new Quill('#editor', {
        theme: 'snow' // Specify theme in configuration
      });
    }

    if (document.getElementById('choices-multiple-remove-button')) {
      var element = document.getElementById('choices-multiple-remove-button');
      const example = new Choices(element, {
        removeItemButton: true
      });

      example.setChoices(
        [{
            value: 'One',
            label: 'Label One',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Label Two',
            selected: true
          },
          {
            value: 'Three',
            label: 'Label Three'
          },
        ],
        'value',
        'label',
        false,
      );
    }

    if (document.querySelector('.datetimepicker')) {
      flatpickr('.datetimepicker', {
        allowInput: true
      }); // flatpickr
    }

    Dropzone.autoDiscover = false;
    var drop = document.getElementById('dropzone')
    var myDropzone = new Dropzone(drop, {
      url: "/file/post",
      addRemoveLinks: true

    });
  </script>
	<!-- Kanban scripts -->
	<script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
	<script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>



	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="${path}/resource/js/Req3000/address.js"></script>
<%--캘린더 js --%>
<script src="${path}/resource/js/Req3000/calendar.js"></script>
<%--gps --%>
<%-- <script src="${path}/resource/js/Req3000/gps.js"></script>  --%> 
<script type="text/javascript">
//gps 
var container = document.getElementById('map');// 지도를 표시할 div 
var options = {
   center: new kakao.maps.LatLng(33.450701, 126.570667),// 지도의 중심좌표
   level: 3 // 지도의 확대 레벨
};

//지도를 생성합니다    
var map = new kakao.maps.Map(container, options);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
    infowindow = new kakao.maps.InfoWindow({zindex:1}); 

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});
function searchAddrFromCoords(coords, callback) {// 좌표로 주소 정보를 요청합니다
   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {// 좌표로 상세 주소 정보를 요청합니다
   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   
}


//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
   if (status === kakao.maps.services.Status.OK) {
     var infoDiv = document.getElementById('centerAddr');

       for(var i = 0; i < result.length; i++) {
           // 행정동의 region_type 값은 'H' 이므로
           if (result[i].region_type === 'H') {
               infoDiv.innerHTML = result[i].address_name;
               break;
           }
       }
   }    
} 

/* function serar */
//동에 대한 default  
    
    function mafun(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map.setCenter(coords);
        } 
    }
    
    
    
/*	var adrs = f.value()${add}*/
/*
	geocoder.addressSearch('${add}', function(result, status) {
   var infoDiv2 = document.getElementById('centerAddr2'); 
   var infoDiv3 = document.getElementById('centerAddr3'); 

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">요기!</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        var infoDiv = document.getElementById('centerAddr'); 

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {         
                infoDiv.innerHTML = result[i].address_name;       
                break;
            }
        }
    } 

    
     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
           searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
               if (status === kakao.maps.services.Status.OK) {
                   var detailAddr2 = !!result[0].road_address ? result[0].road_address.address_name : '';
                   detailAddr3 = result[0].address.address_name;
                        
                         
                      /* console.log("도로명주소:"+result[0].road_address.address_name)
                      console.log("지번주소:"+result[0].address.address_name) */
                   /*
                   var content = '<div class="bAddr">' +
                                   '<span class="title">주소정보</span>' + 
                                   detailAddr2 + 
                               '</div>';

                   // 마커를 클릭한 위치에 표시합니다 
                   marker.setPosition(mouseEvent.latLng);
                   marker.setMap(map);

                   // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                   infowindow.setContent(content);
                   infowindow.open(map, marker);
                   infoDiv=detailAddr2;
                   infoDiv2.innerHTML=detailAddr2;
                   infoDiv3.innerHTML=detailAddr3;
                   
                   // 지도 선택한 부분 input 들어감 
                   var aform = document.querySelector("#aform")
                   aform.address.value = document.getElementById("centerAddr3").innerText;
           
                   
               }   
           });
       });

});
*/
	//필수항목 조건식 
	 function checkForm1(){	
	if(!document.aform.email.value){
		    var loginState="로그인을 하셔야합니다."
		    alert(loginState)
		    if(loginState+"\n 로그인 화면으로 이동하시겠습니까?"){
				location.href="SignIn.do"
			}        
	        return false;
	 }

/* 	if(!document.aform.bisenessNumber.value){
		    var bcontent="사업자 번호 등록을 해주세요"
	        alert(bcontent);
	        if(bcontent){
				location.href="AdminSearch.do"
			} 
	        return false;
	 } */
	if(!document.aform.title.value){
	        alert("글제목을 입력하세요");
	        return false;
	 }
		    
	 if(!document.aform.openDate.value){
	     alert("플리마켓 시작일을 입력하세요");
	     return false;
	 }
	 
	 if(!document.aform.closeDate.value){
	     alert("플리마켓 종료일을 입력하세요");
	     return false;
	 }
	 
	 if(!document.aform.approvalMaxCnt.value){
	     alert("모집인원을 입력해주세요");
	     return false;
	 }
	 if(!document.aform.recruitmentStartDate.value){
	     alert("모집시작일을 입력해주세요");
	     return false;
	 }
	 if(!document.aform.recruitmentEndDate.value){
	     alert("모집종료일을 입력해주세요");
	     return false;
	 }
	 if(!document.aform.address.value){
	     alert("장소를 선택해주세요");
	     return false;
	 }
	 if(!document.aform.content.value){
	     alert("내용 적어주세요");
	     return false;
	 }
	 
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf|docx|hwp)$/;
	 if(!document.aform.pro.value){
	     alert("첨부파일은 필수");
	     return false;
	 }

	 if(!fileForm.test(document.aform.pro.value)){
	     alert("첨부할 수 없는 파일입니다.");
	     return false;
	 }
	 
	  return true;
	}
	     

</script>







</html>