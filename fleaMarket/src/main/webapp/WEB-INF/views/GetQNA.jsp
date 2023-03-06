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

var sessId = "${Login.email}"
	if(sessId!="${qna.email}"){
		alert("해당 페이지에 접근 권한이 없습니다. \n이전페이지로 돌아갑니다.");
		location.href="QNAList.do"
	}
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
								
									<label class="postInsertTitle" style="margin-left: -0.5%;">분류</label>
										<c:if test="${qna.method=='q'}">
										<input class="multisteps-form__input form-control" name="method" type="text" value="문의사항" readonly />
										</c:if>
										<c:if test="${qna.method!='q'}">
										<input class="multisteps-form__input form-control" name="method" type="text" value="공지사항" readonly />
										</c:if>
								</div>
								<!-- 관리자만 게시글 최종 수정일 확인 가능 -->
								<c:if test="${Login.authority=='관리자'}">
								<div class="col-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">최종 수정일</label>
									<input class="multisteps-form__input form-control" name="uptdate" type="text" value="${qna.uptdate}" readonly/>
								</div>
								</c:if>
							</div>
							
							
							<div class="row ms-3 mb-4">
								<div class="col-2 ms-n2 me-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">게시글번호</label>
									<input class="multisteps-form__input form-control" name="qnano" type="text" value="${qna.qnano}" readonly/>
								</div>
								<div class="col-2 ms-n2 me-2">
									<label class="postInsertTitle">작성자</label>
							 		<input class="multisteps-form__input form-control" name="email" type="text" value="${qna.email}" readonly />
								</div>
								<div class="col-2 me-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">등록일</label>
									<input class="multisteps-form__input form-control" name="regdate" type="text" value="${qna.regdate}" readonly/>
								</div>
							</div>
							<div class="mb-3" style="margin-left: 26px;">
									<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
									<input class="multisteps-form__input form-control w-50" name="title" type="text" value="${qna.title}"/>
							</div>
							<div class="mb-7" style="width: 98%; margin-left: 23px; height: 300px;">
								<label class="mt-4 postInsertTitle" style="margin-left: -0.5%;" >게시글내용</label>
								<div id="editor">${qna.content}</div>
								<!-- 
									<button type="submit" style="float: right;" class="btn btn-primary btn-md mb-0 me-2">첨부파일다운로드</button>
							 -->
							</div>
							<div class="mb-3" style="margin-left: 26px;">
								 <input name="qnafiles" type="file" id="${Login.authority=='관리자'?'qnafilesadmin':'qnafiles'}" multiple/>
							</div>	
   						
							<div class="" style="margin-left:85%;">
							<c:if test="${Login.authority!='관리자'}">
							<button type="submit" class="btn btn-outline-primary btn-md mb-0 me-1">수정</button>
							</c:if>
							<button type="button" id="goQNAList" class="btn btn-outline-secondary btn-md mb-0 me-1">취소</button>	
							
							</form>
							<button type="button"  data-bs-toggle="modal" data-bs-target="#DeleteQnaModal" id="DeleteQnaModalbtn"  class="btn btn-outline-danger btn-md mb-0 me-1">삭제</button>  <!-- 모달창추가 -->
							</div>	
							
							
							
							
							
							
						
						<c:forEach var="QNAFile" items="${qna2}">
						<form action="downloadqna.do" method="get">
						<div style="width:50%;">
								<label class="mt-4 form-label labelFont">첨부파일</label>
									<div class="fallback">
									 <div class="download_Wrap">
										<input type="hidden" name="filepath" value="${QNAFile.filepath}">
									 	<input type="hidden" name="filename" value="${QNAFile.filename}">
										<input value="${QNAFile.filename}" type="submit" class="form-control">
									</div>
									</div>
								</div>
						</form>
							</c:forEach>
							
							
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

</body>
</html>