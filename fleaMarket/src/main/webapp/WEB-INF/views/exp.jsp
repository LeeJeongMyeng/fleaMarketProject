<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="sideheader.jsp" %>	
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>회원목록조회</title>
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
<link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>
<script type="text/javascript">
	
</script>
<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>

	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<!-- 상단 -->
		
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- Card header -->
						<div class="card-header pb-0">
							<div class="d-lg-flex">
								<div>
									<h5 class="mb-0">문의글등록</h5>
									<p class="text-sm mb-0">소중한 문의의견에 감사드립니다.</p>
								</div>
							</div>
						</div>
							<div class="card-body px-0 pb-0">
							</div>
						
							<div class="row ms-3">
								<div class="col-2 mb-3">
									<label class="postInsertTitle">게시글 분류</label>
									<c:choose>
										<c:when test="${Login.authority=='관리자'}">
											<div class="col-12 col-sm-11 mt-3 mt-sm-0">
												<input class="multisteps-form__input form-control" type="text" placeholder="공지사항" name="" readonly />
											</div>
										</c:when>
										<c:when test="${Login.authority!='관리자'}">
											<div class="col-12 col-sm-11 mt-3 mt-sm-0">
												<input class="multisteps-form__input form-control" type="text" placeholder="문의사항" name="" readonly />
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="col-2 ms-n2 me-2">
									<label class="postInsertTitle">작성자</label>
							 		<input class="multisteps-form__input form-control" name="email" type="text" value="${Login.email}" readonly />
								</div>
								<div class="col-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">등록일</label>
									<input class="multisteps-form__input form-control" name="title" type="text" placeholder="제목을 작성해주세요." />
								</div>
							</div>
							<div class="mb-3" style="margin-left: 26px;">
									<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
									<input class="multisteps-form__input form-control w-50" name="title" type="text" placeholder="제목을 작성해주세요." />
							</div>
							<div style="width: 98%; margin-left: 23px;">
								<label class="mt-4 postInsertTitle" style="margin-left: -0.5%;">게시글내용</label>
								<div id="editor">
									<p id="contents">
										<br>
									</p>
								</div>
							</div>
								<input type="hidden" id="contentInput" name="content" />
							<div style="width: 50%; margin-left: 23px;">
								<label class="mt-4 form-label labelFont">첨부파일</label>
								<div class="form-control dropzone mb-3" id="dropzone">
									<div class="fallback">
										<input name="filePath" type="file" id="Prodimg" multiple />
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<footer class="footer pt-3  ">
				<div class="container-fluid">
					<div class="row align-items-center justify-content-lg-between">
						<div class="col-lg-6 mb-lg-0 mb-4">
							<div
								class="copyright text-center text-sm text-muted text-lg-start">
								©
								<script>
                  document.write(new Date().getFullYear())
                </script>
								, made by <a
									href="https://www.creative-tim.com" class="font-weight-bold"
									target="_blank">CONTIGO</a> for a better FleaMarket.
							</div>
						</div>
						<div class="col-lg-6">
							<ul
								class="nav nav-footer justify-content-center justify-content-lg-end">
								<li class="nav-item"><a href="https://www.creative-tim.com"
									class="nav-link text-muted" target="_blank">Creative Tim</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/presentation"
									class="nav-link text-muted" target="_blank">About Us</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/blog"
									class="nav-link text-muted" target="_blank">Blog</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/license"
									class="nav-link pe-0 text-muted" target="_blank">License</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
	</main>
<script>
// 등록 버튼 클릭 시,
$("#insert").click(function(){
   //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
   var expeditor=$('#edit-deschiption .ql-editor').html()
   $('input[name=content]').val(expeditor);
   $("form").submit()
})

$(".ql-link").hide()

if (document.getElementById('editor')) {
      var quill = new Quill('#editor', {
        theme: 'snow' // Specify theme in configuration
      });
    }

Dropzone.autoDiscover = false;
var drop = document.getElementById('dropzone')
var myDropzone = new Dropzone(drop, {
  url: "/file/post",
  addRemoveLinks: true

});
</script>
<%-- <script src="${path}/resource/js/Req1001/AdminSearch.js"></script> --%>
</body>
</html>