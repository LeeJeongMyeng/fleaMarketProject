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
									<c:if test="${qna.method == 'a'}">
									  <h5>문의답변 조회</h5>
									</c:if>
									<c:if test="${qna.method == 'q'}">
									  <h5>문의글 조회</h5>
									</c:if>
									<c:if test="${qna.method == 'n'}">
									  <h5>공지사항 조회</h5>
									</c:if>
								</div>
							</div>
						</div>
						<form action="QNAUpdate.do" method="post" enctype="multipart/form-data" onsubmit="okmsg('update')">
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
							<input type="hidden" name="secretwhether" value="${qna.secretwhether }"> 
							<div class="mb-3" style="margin-left: 26px;">
									<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
									<input class="multisteps-form__input form-control w-50" name="title" type="text" value="${qna.title}"/>
							</div>
							<div class="mb-7" style="width: 98%; margin-left: 23px; height: 300px;">
								<label class="mt-4 postInsertTitle" style="margin-left: -0.5%;" >게시글내용</label>
								<div id="editor">${qna.content}</div>
								<input type="hidden" id="contentInput" name="content" value="${qna.content }" />
							</div>
							<div class="mb-3" style="margin-left: 26px;">
								 <input name="qnafiles" type="file" id="${Login.authority=='관리자'?'qnafilesadmin':'qnafiles'}" multiple/>
								 <div id="imgs_wrap" style="display:flex;">
							</div>	
   						</div>
   						<div align="right">
							<%--
							<div class="" style="margin-left:80%;">
							 --%>
						<%--
						${(Login.authority=='관리자' || qna.method=='q' && Login.email==qna.email)?'':'none'}
						  <c:if test="${Login.authority=='관리자' || qna.method=='q' && Login.email==qna.email }">--%>	
								<button type="submit" ${(Login.authority=='관리자' || (qna.method=='q' && Login.email==qna.email))?'':'style="display:none;"'} class="btn btn-outline-primary btn-md mb-0 me-1">수정</button>
								<button type="button" ${(Login.authority=='관리자' || (qna.method=='q' && Login.email==qna.email))?'':'style="display:none;"'} data-bs-toggle="modal" data-bs-target="#QNADeleteModal" id="DeleteQnaModalbtn"  class="btn btn-outline-danger btn-md mb-0 me-1">삭제</button>  <!-- 모달창추가 -->
						<%--  	</c:if>--%>
							<%--
							<c:if test="${Login.authority=='관리자' && qna.method=='q'}">
							--%>
								
							<button type="button" ${Login.authority=='관리자' && qna.method=='q'?'':'style="display:none;"'} class="btn btn-outline-success btn-md mb-0 me-1" id="QNAAnswerBtn">답변</button>  
							<button type="button" id="goQnaList" class="btn btn-outline-secondary btn-md mb-0 me-1" style="margin-left:auto;">취소</button>	
							<%--
							</c:if>
							 --%> 
							</div>
							</form>
							<%--
							</div>	
							--%>

						<c:forEach var="QNAFile" items="${qna2}">
						<form action="downloadqna.do" method="get">
						<div style="width:50%;">
								<label class="mt-4 form-label labelFont">첨부파일</label>
									<div class="fallback">
									 <div class="download_Wrap">
										<input type="hidden" name="filepath" value="${QNAFile.filepath}">
									 	<input type="hidden" name="filename" value="${QNAFile.filename}">
										<input value="${QNAFile.filename2}" type="submit" class="form-control">
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
	<!-- 아이디 비밀번호 찾기 모달창 -->
 <!--  <div data-bs-toggle="modal" data-bs-target="#QNADeleteModal" id="#QNADeleteModal"></div> -->
	<div class="modal fade" id="QNADeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="top:119px;">
	      <div class="modal-header" style="background-color: #e74f58;">
	        <h3 class="modal-title fs-6 text-center" id="MemberFindTitle" style="color: white;">게시글 삭제</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	     
	      <div class="modal-body">
			<div class="card multisteps-form__panel p-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <div class="multisteps-form__content">
                    <div class="mb-4" style="font-weight:bold;">해당 글을 정말 삭제하시겠습니까??</div>
                    <form action="QNADelete.do" method="post">
                      <div class="row">
                        <input type="hidden" name="qnano" value="${qna.qnano}">
                        <div class=col-6>
                       	 	<button class="btn w-100" type="submit" style="background-color:#e74f58; color:white;">삭제</button>
                        </div>
                        <div class=col-6>
                         	<button type="button" class="btn btn-secondary w-100" data-bs-dismiss="modal">닫기</button>
                        </div>
                      </div>
                     </form>
                    </div>
                  </div>
                  <!--single form panel-->
	      </div>
	      
	      <div class="modal-footer">
	        회사소개 | 이용약관 | <strong>개인정보처리방침</strong>
	      </div>
	     
	    </div>
	  </div>
	</div> <!-- sns확인모달 모달끝 -->
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
<script src="${path}/resource/js/Req1000/fileupload.js"></script>
<script src="${path}/resource/js/Req1001/GetQNA.js"></script>
</body>
</html>