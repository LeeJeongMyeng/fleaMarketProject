<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="sideheader.jsp" %>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    CONTIGO 받은 신청 목록
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"
   integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
   crossorigin="anonymous"></script>
  <script type="text/javascript">
  /*
	var msg = "${msg}"
	if(msg=="수정완료"){
		if(confirm(msg+" 전체조회화면 이동하시겠습니까?")){
			location.href = "${path}/list.do";
		}
	}

	$(document).ready(function(){
		$("#appBtn").click(function(){
			// 유효성 check
			$.ajax({	
				url:"${path}/updateAppRe.do",
				type:"get",
				data:$("#app").serialize()
				dataType:"json",
				success:function(data){
					var appReceived = data.appReceived
					if(appReceived!=null){
						alert("수정 완료");
					}
					// 리스트 데이터 update
					var list = data.list
				}
			})
		})
	});
	*/
	// 페이징
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#frmSch").submit()
	}
	
	// 신청글 상세 조회 모달창
	function goModal(appno){
		$.ajax({
			url:"appFileView.do",
			type:"post",
			data:"applicationNo="+appno,
			dataType:"json",
			success:function(data){
				var values = "<form>";
				$(data.appFile).each(function(idx, dept){
					values+="<input type="text" value="data.appFile(1)">"
					values+="</form>"
				})
				$('#here').html(values)	
				$("#goModal").click()
				/*
				1. data.appFile for문돌리셈
				2. 돌리는데 여기다가 직접 태그들을 만들줘야함
	  			 var values = "<form>";
	                                           for문{
					values+=<input type="text" value="data.appFile(1)">
					}
				      values+=</form>
	                                        $('#asdfasdf').html(values)
				$(#goModal).click()
				*/
			},
			error:function(xhr,status,err){
	              console.log(xhr)
	              console.log(status)
	              console.log(err)
	        }
		})
	}

	function goModal2(applicationNo){
		$.ajax({	
			url:"${path}/appReceivedView.do",
			type:"get",
			data:"applicationNo="+applicationNo,
			dataType:"json",
			success:function(data){
				// d.addAttribute("dept", s
				// data.모델명
				// {dept:{deptno:10,...}}
				
				//첨부파일 불러오기 
				//var dept = data.dept
				$("#modalNoFile").click() // 모달 로딩
				/*
				$("#frm02 [name=deptno]").val(dept.deptno)
				$("#frm02 [name=dname]").val(dept.dname)
				$("#frm02 [name=loc]").val(dept.loc)
				*/
			},
			error:function(err){
				console.log(err)
			}
		})
	}
</script>
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <main class="main-content position-relative border-radius-lg ">
    <div class="container-fluid py-4">
      <!-- 상단 버튼 추가 시
      <div class="d-sm-flex justify-content-between">
        <div>
          <a href="javascript:;" class="btn btn-icon btn-outline-white">
            New order
          </a>
        </div>
        <div class="d-flex">
          <div class="dropdown d-inline">
            <a href="javascript:;" class="btn btn-outline-white dropdown-toggle " data-bs-toggle="dropdown" id="navbarDropdownMenuLink2">
              Filters
            </a>
            <ul class="dropdown-menu dropdown-menu-lg-start px-2 py-3" aria-labelledby="navbarDropdownMenuLink2" data-popper-placement="left-start">
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Paid</a></li>
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Refunded</a></li>
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Canceled</a></li>
              <li>
                <hr class="horizontal dark my-2">
              </li>
              <li><a class="dropdown-item border-radius-md text-danger" href="javascript:;">Remove Filter</a></li>
            </ul>
          </div>
        </div>
      </div>
       -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="table-responsive">
              <div class="dataTable-top">
              	<div class="dataTable-search">
              		<form id="frmSch" class="d-flex"  method="post"> 
	              		<input name="title" value="${sch.title}" class="form-control" placeholder="제목을 입력하세요" type="text">
	              		<!-- <button class="btn btn-primary" type="submit">검색</button> -->
	              		<input type="hidden" name="curPage" value="${sch.curPage}"/>
	              	</form>
              	</div>
              </div>
              <div class="dataTable-container">
	              <table class="table table-flush dataTable-table" id="datatable-search">
	                <thead class="thead-light">
	                  <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>등록일</th>
	                    <th>상태</th>
	                    <th>작성자</th>
	                    <th>첨부파일</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach var="fapplication" items="${list}">
		                  <tr onclick="goModal(${fapplication.applicationNo})">
		                    <td>
		                      <div class="d-flex align-items-center">
		                      	<p class="text-xs font-weight-bold ms-2 mb-0">${fapplication.cnt}</p>
		                      </div>
		                    </td>
		                    <td class="font-weight-bold">
		                      <span class="my-2 text-xs">${fapplication.title}</span>
		                    </td>
		                    <td class="font-weight-bold">
		                      <span class="my-2 text-xs"><fmt:formatDate pattern='yyyy.MM.dd' value="${fapplication.applicationDate}"/></span>
		                    </td>
		                    <td class="text-xs font-weight-bold">
		                      <div class="d-flex align-items-center">
		                        <c:choose>
				                   <c:when test="${fapplication.approvalWhether == 'a'}">
				                      <button class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-check" aria-hidden="true"></i></button>
	                        		  <span>승인</span>
				                   </c:when>
				                   <c:when test="${fapplication.approvalWhether == 'r'}">
				                      <button class="btn btn-icon-only btn-rounded btn-outline-danger mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-times" aria-hidden="true"></i></button>
	                       			  <span>거부</span>
				                   </c:when>
				                   <c:otherwise>
				                      <button class="btn btn-icon-only btn-rounded btn-outline-dark mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="ni ni-fat-delete" aria-hidden="true"></i></button>		                   
				                   	  <span>대기</span>
				                   </c:otherwise>
				                </c:choose>      
		                      </div>
		                    </td>
		                    <td class="text-xs font-weight-bold">
		                      <div class="d-flex align-items-center">
		                        <img src="${path}/resource/img/Member/profileimg/defaultprofile.png" class="avatar avatar-xs me-2" alt="user image">
		                        <span>${fapplication.nickname}</span>
		                      </div>
		                    </td>
		                    <td class="text-xs font-weight-bold">
		                      <i class="bi bi-paperclip"></i>
		                      <span class="my-2 text-xs">신청양식.pdf</span>
		                    </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	           </div>
            </div>
            
            <!-- 페이지네이션 -->
            <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item">
			      <a class="page-link" href="javascript:goPage(${sch.startBlock-1});">
			        <i class="fa fa-angle-left"></i>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
			    	<li class="page-item ${sch.curPage==cnt?'active':''}">
			    		<a class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
			    	</li>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="javascript:goPage(${sch.endBlock+1});">
			        <i class="fa fa-angle-right"></i>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
			</nav>
          </div>
        </div>
      </div>
      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                made with <i class="fa fa-heart"></i> by
                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
                for a better web.
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3 bg-transparent ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Argon Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0 overflow-auto">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default" onclick="sidebarType(this)">Dark</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="d-flex my-3">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark mb-1">
        <div class="d-flex my-4">
          <h6 class="mb-0">Sidenav Mini</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarMinimize" onclick="navbarMinimize(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <div class="mt-2 mb-5 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <a class="btn btn-primary w-100" href="https://www.creative-tim.com/product/argon-dashboard-pro">Buy now</a>
        <a class="btn btn-dark w-100" href="https://www.creative-tim.com/product/argon-dashboard">Free demo</a>
        <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/overview/argon-dashboard">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="https://github.com/creativetimofficial/ct-argon-dashboard-pro" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20PRO%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard-pro" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard-pro" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>
  
  
  
  
  <!-- 신청 조회 모달창 (양식 O) -->
  <p id="goModal" data-toggle="modal" data-target="#jkanban-info-modal"></p>
  <div class="modal fade" id="jkanban-info-modal" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청 조회</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group">
          	<label>첨부파일</label> <!-- 첨부파일 -->
          	<div id="here"></div>
            <c:forEach var="appFile" items="${appFile}">                     
			<form action="downloadAppFile.do" method="get">
			<%-- 
				<div class="row mt-3">
	              <div class="col-2" style="height:120px;">
	                <input type="file" name="fmFile" value="${noimg.filename}" class="form-control" style="width:230px" id="appFile" multiple>
	                 <div id="image_container"></div>
	              </div>
	            </div>
			 --%>
				<div style="width:50%;">
					<div class="fallback">
						 <div class="download_Wrap">
						 	<input type="hidden" name="filename"  value="${appFile}">
							<input value="${appFile}" type="submit" class="form-control">
						 </div>
					</div>
				</div>
			</form>
		  </c:forEach>
          </div>
          <div class="alert alert-success d-none">Changes saved!</div>
          <div class="text-end">
            <button class="m-1 btn btn-primary" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
              승인
            </button>
            <button class="m-1 btn btn-danger" data-toggle="modal" data-target="#jkanban-info-modal">
              거부
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 신청 조회 모달창 (양식 X) -->
  <p id="modalNoFile"  data-bs-toggle="modal" data-bs-target="#jkanban-info-modal-nofile"></p>
  <div class="modal fade" id="jkanban-info-modal-nofile" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청 조회</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group text-center">신청 승인하시겠습니까?</div>
          <input type="hidden" id="app" value="a"/>
          <div class="text-end">
            <button id="appBtn" class="m-1 btn btn-primary" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
              승인
            </button>
            <button id="rejBtn" class="m-1 btn btn-danger" data-toggle="modal" data-target="#jkanban-info-modal">
              거부
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 승인 완료 알림 모달창 (양식 X) -->
  <div class="modal fade" id="jkanban-info-modal-accept" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청 조회</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group text-center">승인되었습니다.</div>
          <div class="text-end">
            <button class="btn btn-primary btn-block" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
              확인
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 거부 완료 알림 모달창 (양식 X) -->
  <div class="modal fade" id="jkanban-info-modal-reject" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청 조회</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group text-center">거부되었습니다.</div>
          <div class="text-end">
            <button class="btn btn-primary btn-block" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
              확인
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script> <!-- file box -->
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="${path}/assets/js/plugins/datatables.js"></script>
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