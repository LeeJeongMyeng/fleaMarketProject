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
<title>문의글 상세</title>
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

$(document).ready(function(){
	//글쓰기 부분ㅇㅇ
	$('#editor .ql-editor').keyup(function(){
	 	var expeditor=$(this).html() 
		$('input[name=content]').val(expeditor); 
	})
})
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
						<div class="card-header pb-0 mb-4">
							<div class="d-lg-flex">
								<div>
									<h5 class="mb-0">문의글상세</h5>
									<p class="text-sm mb-0">소중한 문의의견에 감사드립니다.</p>
								</div>
							</div>
						</div>
						<form action="QNAUpdate.do" method="post" enctype="multipart/form-data">
							<div class="row ms-2 mb-3">
							 
								<div class="col-2">
								
									<label class="postInsertTitle" style="margin-left: -0.5%;">문의종류</label>
										<input name="method" type="text" value="${qna.method}" readonly />
								</div>
							</div>
							<div class="row ms-3 mb-4">
								<div class="col-2 ms-n2 me-2">
									<label class="postInsertTitle">작성자</label>
							 		<input class="multisteps-form__input form-control" name="email" type="text" value="${qna.email}" readonly />
								</div>
								<div class="col-2 me-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">등록일</label>
									<input class="multisteps-form__input form-control" name="regdate" type="text" value="${qna.regdate}" readonly/>
								</div>
								<div class="col-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">수정일</label>
									<input class="multisteps-form__input form-control" name="uptdate" type="text" value="${qna.uptdate}" readonly/>
								</div>
								<div class="col-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">게시글번호</label>
									<input class="multisteps-form__input form-control" name="qnano" type="text" value="${qna.qnano}" readonly/>
								</div>
							</div>
							<div class="mb-3" style="margin-left: 26px;">
									<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
									<input class="multisteps-form__input form-control w-50" name="title" type="text" value="${qna.title}" />
							</div>
							<div class="mb-7" style="width: 98%; margin-left: 23px; height: 300px;">
								<label class="mt-4 postInsertTitle" style="margin-left: -0.5%;" value="${qna.content}">게시글내용</label>
								<div id="editor"></div>
							</div>
								<input type="hidden" id="contentInput" name="content" />
							<div style="width: 50%; margin-left: 23px;">
								<label class="mt-4 form-label labelFont">첨부파일</label>
									<div class="fallback">
										<input name="qnafiles" type="file" id="Prodimg" multiple />
									</div>
								</div>
							</div>
						</form>
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



var quill = new Quill('#editor', {
  modules: { toolbar: true },
  theme: 'snow'
});

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