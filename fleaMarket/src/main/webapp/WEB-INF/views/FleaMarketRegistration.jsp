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
									   <input name = "addrs1" type="text" onchange="asd(this)" id="sample6_address" class="form-control soooo2" placeholder="주소"><br>						
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
<script src="${path}/resource/js/Req3000/gps.js"></script>






</html>