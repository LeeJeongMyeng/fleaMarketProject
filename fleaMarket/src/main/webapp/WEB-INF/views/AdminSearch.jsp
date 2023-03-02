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
<link id="pagestyle"
	href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>
<script type="text/javascript">
	
</script>
<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<%@include file="sideheader.jsp" %>	
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
									<h5 class="mb-0">회원목록조회</h5>
									<p class="text-sm mb-0">검색할 회원명을 하단 검색창에 입력해주세요</p>
								</div>
								<div class="ms-auto my-auto mt-lg-0 mt-4">
									<div class="ms-auto my-auto">
										<div class="modal fade" id="import" tabindex="-1"
											aria-hidden="true">
											<div class="modal-dialog mt-lg-10">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="ModalLabel">회원 탈퇴</h5>
														<i class="fas fa-upload ms-3"></i>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p>선택한 회원을 탈퇴시키겠습니까?</p>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value=""
																id="importCheck"> 
																* 탈퇴처리에 동의하시면 다시 한 번 체크를 해주세요.
														</div>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn bg-gradient-secondary btn-sm"
															data-bs-dismiss="modal">취소</button>
														<button type="button"
															class="btn bg-gradient-primary btn-sm">탈퇴</button>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
							<div class="card-body px-0 pb-0">
							</div>
							<form id="frm01" class="form"  method="post"> 
							
							<div class="row">
								<div class="col-10 input-group mb-3 w-25">
								  <button class="btn btn-outline-primary bg-primary mb-0 ms-3" type="submit" style="color:white;" id="button-addon1">　검색　</button>
								  <input type="text" class="form-control form-control-outline-primary" style="border: 1px solid #5e72e4;"  name="name" value="${sch.name}" placeholder="　회원명을 입력하세요">
								</div>
								<div class="col-2 ms-auto my-auto">
									<button type="button" class="btn btn-outline-danger btn-md mb-0 me-2 " data-bs-toggle="modal" data-bs-target="#import">회원탈퇴</button>
									<button class="btn btn-outline-primary btn-md export mb-0 ms-3" data-type="csv" type="button" name="button">Export</button>
								</div>
							</div>
							<div class="table-responsive mt-3">
								<table class="table table-flush" id="products-list">
									<thead class="thead-light">
										<tr style="background-color: #ebebeb;">
											<th width="10%">
													<div class="d-flex">
													<div class="form-check my-auto">
														<input class="form-check-input" type="checkbox"
															id="customCheck3">
													</div>
												</div>
											</th>
											<th width="20%">이메일</th>
											<th width="10%">회원명</th>
											<th width="10%">닉네임</th>
											<th width="10%">권한</th>
											<th width="40%">주소</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="Member" items="${MemberList}">
							    		<tr>
							    		<td>
							    		<div class="d-flex">
													<div class="form-check my-auto">
														<input class="form-check-input" type="checkbox"
															id="customCheck3">
													</div>
												</div>
							    		</td>
							    		<td>${Member.email}</td>
							    		<td>${Member.name}</td>
							    		<td>${Member.nickname}</td>
							    		<td>${Member.authority}</td>
							    		<td>${Member.address}</td>
							    		</tr>
							    		</c:forEach>
										
										</tbody></table></div></div></div></div></div>
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
</body>
</html>