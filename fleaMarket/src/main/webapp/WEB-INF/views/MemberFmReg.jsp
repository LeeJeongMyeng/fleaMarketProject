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
<title>내가 쓴 플리마켓 모집글</title>
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
									<h5 class="mb-0"  style="margin-top:15%;">내가 쓴 플리마켓 모집글</h5>
								<p class="text-sm mb-0">회원님께서 작성하신 플리마켓 모집글 입니다.</p>
								</div>
								<div class="ms-auto my-auto mt-lg-0 mt-4">
									<div class="ms-auto my-auto">
										<div class="modal fade" id="import" tabindex="-1"
											aria-hidden="true">
											<div class="modal-dialog mt-lg-10">
												<div class="modal-content">
													<div class="modal-header">
														<i class="fas fa-upload ms-3"></i>
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
								<div class="col-2 ms-auto my-auto">
								</div>
							</div>
							<div class="table-responsive mt-3">
								<table class="table table-flush" id="products-list">
									<thead class="thead-light">
										<tr style="background-color: #ebebeb;">
											<th width="15%">제목</th>
											<th width="15%">공고시작일</th>
											<th width="15%">공고마감일</th>
											<th width="15%">플리마켓개최일</th>
											<th width="15%">플리마켓종료일</th>
											<th width="15%">플리마켓장소</th>
											<th width="15%">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="FleaMarket" items="${FleaMarketList}">
							    		<tr>
							    		  <input type="hidden" td:value="${Login.email}" />
							    		
							    		<td>${FleaMarket.title}</td>
							    		<td>${FleaMarket.recruitmentStartDate}</td>
							    		<td>${FleaMarket.recruitmentEndDate}</td>
							    		<td>${FleaMarket.openDate}</td>
							    		<td>${FleaMarket.closeDate}</td>
							    		<td>${FleaMarket.address}</td>
							    		<td>${FleaMarket.viewCnt}</td>
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