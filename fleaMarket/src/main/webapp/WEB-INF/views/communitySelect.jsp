<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>Argon Dashboard 2 PRO by Creative Tim</title>
<!--     Fonts and icons     -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

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
	<script src="https://kit.fontawesome.com/3aab1ef667.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

  
  <script src="../../assets/js/plugins/sweetalert.min.js"></script>
<style>
.disflex {
	display: flex;
	gap: 10px;
}

.insA {
	width: 150px;
	height: 40px;
}

.searIns {
	width: 100px;
}

.insA1 {
	width: 100px;
	height: 45px;
}

.text-sm {
	line-height: 3;
}

.btnStyle {
	display: flex;
	gap: 8px;
	justify-content: flex-start;
	margin-top: 40px;
}

.insertStyle {
	height: 43px;
}

.selects {
	width: 300px;
	height: 200px;
}
.others{
  font-color:white;
}
</style>
</head>

<%@ include file="header.jsp" %>
<div>
<body>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-12">
				<div class="card" style = "margin-top: 150px;">
					<!-- Card header -->
					<div class="card-header pb-0">
						<div class="d-lg-flex">
							<div>
								<h5 class="mb-0">${pageMaker.cri.category}</h5>
								<c:if test = "${pageMaker.cri.category eq '???????????????'}">
								<p class="text-sm mb-0">?????? ???????????? ????????????</p>
								</c:if>
								<c:if test = "${pageMaker.cri.category eq '????????????'}">
								<p class="text-sm mb-0">???????????? ?????? ! ! !</p>
								</c:if>
								<c:if test = "${pageMaker.cri.category eq '??????????????????'}">
								<p class="text-sm mb-0">?????? ???????????? ?????? ! ! !</p>
								</c:if>
								<c:if test = "${pageMaker.cri.category eq '??????'}">
								<p class="text-sm mb-0">?????? ?????? ! ! !</p>
								</c:if>
							</div>
								<div class="ms-auto my-auto mt-lg-0 mt-4">
									<div class="ms-auto my-auto disflex">
										<div class="form-group searIns show">
											<select name="type" class="form-control form-control-lg"
												style="height: 45px;">
												<option value=""
													<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>??????</option>
												<option value="T"
													<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>??????</option>
												<option value="C"
													<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>??????</option>
												<option value="W"
													<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>?????????</option>
											</select>
										</div>
										<div class="input-group mb-4 insput" style="width: 60%">
											<span class="input-group-text"><i
												class="ni ni-zoom-split-in"></i></span> <input
												style="height: 45px;" class="form-control" name="keyword"
												placeholder="Search" type="text">
										</div>
										<div class="col-md-6" style="width: 25%;">
											<button
												class="btn btn-outline-primary btn-sm export mb-0 mt-sm-0 mt-1 insA1"
												type="button">??????</button>
										</div>

									</div>


								</div>


							</div>
						<div class="btnStyle">
						    <div class = "buttonSelect">
							<button type="button" id= "btbutn" class="btn btn-outline-dark" name = "showBtn" value="all">?????????</button>
							<button type="button" id= "btbutn" class="btn btn-outline-dark" name = "showBtn" value="best">?????????</button>
							</div>
							<button id = "insertButton" type="button"
								class="btn bg-gradient-primary btn-sm mb-0 insertStyle">+
								????????? ????????????</button>

							
							<select class="bg-gradient-primary form-control" id="Sort"
							style = "width: 150px;height:44px;color: aliceblue;">
											<option value="1"
												<c:out value="${pageMaker.cri.shift eq 'registDate'?'selected':'' }"/>>?????? ?????? ???</option>
											<option value="2"
												<c:out value="${pageMaker.cri.shift eq 'viewCnt'?'selected':'' }"/>>????????? ???</option>
											<option value="3"
												<c:out value="${pageMaker.cri.shift eq 'likeCnt '?' selected':'' }"/>>????????? ???</option>
							</select>
							<!-- ???????????? ?????? -->
							<form id = "showForm" method = "get">
							<input type="hidden" name="showTemplete" value="${showTemplete}">
							</form>

						</div>
					</div>


				</div>

				<div class="card-body px-0 pb-0">
					<div class="table-responsive">
						<table class="table table-flush" id="products-list">
							<thead class="thead-light">
								<tr>
									<th>?????????</th>
									<th>?????????</th>
									<th>?????????</th>
									<th>?????????</th>
									<th>????????????</th>
									<th>room</th>
									
								</tr>
							</thead>
							
				<!-- ????????? ??????  -->
							<tbody style="text-align: center">
								<c:forEach var="lists" items="${list}">
									<tr>
										<td>
											<div class="d-flex">   
											
												<div class="form-check my-auto">
												<c:if test = "${lists.bestType eq 'T'}">
												<i class="fa-solid fa-medal"></i>
												</c:if>
												</div>
												
												<img class="w-10 ms-3"
													src="${path }/resource/community/${lists.imgName}">
												<h6 class="ms-3 my-auto"><a href ="${path}
												/CommunityDetail.do?communityNumber=${lists.communitynumber}
												&pageNum=${pageMaker.cri.pageNum} 
												&keyword=${pageMaker.cri.keyword}
												&type=${pageMaker.cri.type}
												&shift=${pageMaker.cri.shift}
												&category=${pageMaker.cri.category}
												">${lists.title }</a></h6>
										</td>
										<td class="text-sm">${lists.nickname }</td>
										<td class="text-sm">${lists.viewCnt }</td>
										<td class="text-sm">${lists.likeCnt }</td>
										<td class="text-sm">${lists.registDate }</td>
										<td style="text-align: center; padding-top: 12px;"><span
											class="badge badge-secondary badge-sm">room ??????</span></td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- ????????? ?????????  -->

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center" id="pageInfo">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link pagingnum"
										href="${pageMaker.startPage-1}" tabindex="-1"> <i
											class="fa fa-angle-left"></i> <span class="sr-only">Previous</span>
									</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
										<a class="page-link" href="${num }">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item"><a class="page-link pagingnum"
										href="${pageMaker.endPage+1}"> <i
											class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
                    <!-- ?????? ?????? -->
						<form id="moveForm" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name ="shift" value ="${pageMaker.cri.shift }">
							<input type="hidden" name = "category" value = "${pageMaker.cri.category }">
							<input type="hidden" name ="showTemplete" value = "${bestValue}">
						</form>
						<!-- ????????? ????????? -->
					</div>
				</div>	
				<!-- ????????? ?????? -->
				<form id="pageForm" method="get" action = "${path }/CommunityDetail.do">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name ="shift" value ="${pageMaker.cri.shift }">
							<input type="hidden" name = "category" value = "${pageMaker.cri.category }">
							<input type="hidden" name ="showTemplete" value = "${bestValue}">
				</form>
			</div>
		</div>
	</div>
	<footer class="footer pt-3  ">
		<div class="container-fluid">
			<div class="row align-items-center justify-content-lg-between">
				<div class="col-lg-6 mb-lg-0 mb-4">
					<div class="copyright text-center text-sm text-muted text-lg-start">
						??
						<script>
                  document.write(new Date().getFullYear())
                </script>
						, made with <i class="fa fa-heart"></i> by <a
							href="https://www.creative-tim.com" class="font-weight-bold"
							target="_blank">Creative Tim</a> for a better web.
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
</div>
<form id = "insertForm" method = "post" action="${path }/communityInsertPage.do" >
       <input type = "hidden" name = "category" value = "${pageMaker.cri.category }"/>
</form>
	<!--   Core JS Files   -->
	
	<script src="${path}/assets/js/plugins/datatables.js"></script>
	<script>
	var msg = '${msg}';
	if(msg==='????????????'){
		 Swal.fire({
			 icon:'success',
		     text:'????????????!',
		 })
	}
  var insertForm = $("#insertForm");
  $('#insertButton').on("click",function(){
	  var sessions = '${session}'
	  if(sessions == ''){
		  Swal.fire({
			    icon:'warning',
		        text:'????????? ?????? ???????????? ??? ????????????.',
		        confirmButtonText:'?????????????????????',
		        showCancelButton: true,
		        cancelButtonText:'??????',
		 }).then((result) =>{
			 location.href = "${path}/SignIn.do";
		 })
	 }else{
		  insertForm.find("input[name='category']").val();
		  insertForm.submit();
	  }
  })
  
  $("#formDetail").on("click",function(e){
	  pageForm.submit();
  })
  var moveForm = $("#moveForm");
  //????????? ??????
  var showpower = "${bestValue}";
  
  // ?????????/ ?????? / ????????? ?????? 
  $("#Sort").on("change",function(e){
	  let shift = $("#Sort option:selected").val();
	  moveForm.find("input[name='showTemplete']").val(showpower);
	  moveForm.find("input[name='shift']").val(shift);
	  moveForm.find("input[name='pageNum']").val(1);
	  moveForm.submit();
	  
  })
        //????????? / ????????? ???????????? 
		$('button[name=showBtn]').on("click", function(e) {
			let show = $(this).attr('value');
			
				e.preventDefault();
				//?????????, ?????? ??????????????? ????????? 
				moveForm.find("input[name='pageNum']").val(1);
				moveForm.find("input[name='keyword']").val("");
				moveForm.find("input[name='type']").val("");
				
				//????????? ????????? 
				moveForm.find("input[name='category']").val();
				moveForm.find("input[name='showTemplete']").val(show);
				moveForm.submit();
			
		})
        //????????? ?????? 
		$(".page-item a").on("click", function(e) {

			e.preventDefault(); //?????? ?????? ??????    
			
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
		});
        //??????, ????????? ??????
		$(".disflex button").on("click", function(e) {
			e.preventDefault();
			let type = $(".disflex select").val();
			let keyword = $(".disflex input[name='keyword']").val();
			let shift = $("#Sort option:selected").val();
			
			//??????????????? ???????????? ????????? ????????????

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='shift']").val(shift);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.find("input[name='category']").val();
			moveForm.find("input[name='showTemplete']").val(showpower);
			
			moveForm.submit();
		});
	</script>
	<!-- Kanban scripts -->
	<script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
	<script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
	<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

</html>