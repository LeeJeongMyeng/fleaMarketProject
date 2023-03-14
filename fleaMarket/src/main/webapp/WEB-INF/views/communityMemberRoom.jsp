<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<title>팔로우 회원room</title>
<meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  <script src="${path}/resource/js/Req4002/room.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 정보 노출/미노출 -- 유지하는 기능넣기(Myroom일경우만 노출)
		$("#flexSwitchCheckDefault00").on("click",function(){
			if($(this).is(":checked")){
				$("#roomemail").show()
				$("#roomphonenumber").show()
				$("#roombusinessnumber").show()
				$("#bulbicon").attr("src","${path}/resource/community/light-bulb.png")
				$("#bulbicon").css({"width":"auto","height":"70px"})
			}else{
				$("#roomemail").hide()
				$("#roomphonenumber").hide()
				$("#roombusinessnumber").hide()
				$("#bulbicon").attr("src","${path}/assets/img/small-logos/icon-bulb.svg")
			}
		})
		// 아래 차트 js에 갯수 계산 기능 있음 arrFun(obj)
		
		// 팔로우수 넣기
		var followMembers="${follower}"
		$("#folloewcnt").text(arrFun(followMembers))
		
		// 팔로잉수 넣기
		var followingMembers="${following}"
		$("#following span").text(arrFun(followingMembers))
		
		// 팔로우 회원 클릭 시, 해당 회원 룸으로 이동 -- 안됨
		function memberRoom(email){
			location.href="communityMemberRoom.do?email"+this
		}
			
		// 내게시글 댓글 정보
		var boardrepInfos = "${boardreplyInfo}"
		$("#meBoardRepCnt").text(arrFun(boardrepInfos))
		
		// 카테고리별 게시글 갯수정보
		$("#boardCategoryCntTab td").eq(0).text(arrFun("${adv}")) //
		$("#boardCategoryCntTab td").eq(1).text(arrFun("${idea}"))
		$("#boardCategoryCntTab td").eq(2).text(arrFun("${life}"))
		$("#boardCategoryCntTab td").eq(3).text(arrFun("${tip}"))
		
		// 월별 게시글 갯수정보
		
		// 내가쓴 댓글 정보
		var replyInfos = "${replyInfo}"
		$("#meRepCnt").text(arrFun(replyInfos))
		console.log("내 댓글 정보",replyInfos)
	});
</script>
</head>

<body class="g-sidenav-show   bg-gray-100">
  <main class="main-content position-relative border-radius-lg">
  	<jsp:include page="header.jsp"></jsp:include>
    <!-- End Navbar -->
     <div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto">
            <div class="avatar avatar-xl position-relative">
              <img src="${path}/resource/img/Member/profileimg/${roommember.profileimg}" alt="profile_image" class="border-radius-lg shadow-sm" style="width:90px; height:90px;">
            </div>
          </div>
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
               	${roommember.nickname}
              </h5>
              <p class="mb-0 font-weight-bold text-sm">
                님의 Room  <i class="ni ni-shop"></i>
              </p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3">
            <div class="nav-wrapper position-relative end-0">
              <ul class="nav nav-pills nav-fill p-1" role="tablist">
                 <li class="nav-item">
                  <a class="nav-link mb-0 px-0 py-1 active d-flex align-items-center justify-content-center " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="true">
                    <i class="ni ni-fat-add"></i>
                    <!--<i class="ni ni-fat-delete"></i>  -->
                    <span class="ms-2">팔로우</span>
                  </a>
                </li>
                <li class="nav-item" data-bs-toggle="modal" data-bs-target="#chatModal">
                  <a class="nav-link mb-0 px-0 py-1 d-flex align-items-center justify-content-center  active " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="false">
                    <i class="ni ni-chat-round"></i>
                    <span class="ms-2">채팅하기</span>
                  </a>
                </li>
<div class="moving-tab position-absolute nav-link" style="padding: 0px; transition: all 0.5s ease 0s; transform: translate3d(0px, 0px, 0px); width: 50%;">
<a class="nav-link mb-0 px-0 py-1 d-flex align-items-center justify-content-center active" data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="true">-</a>
</div>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="container-fluid py-4">
      <div class="d-flex m-3">
	      <div class="col-lg-4">
		      <div class="card" style="width:600px;">
		        <div class="card-body" style="margin-left:2%;">
		          <div class="d-flex">
		            <p class="mb-0">정보 미노출/노출</p>
		            <div class="form-check form-switch ms-auto">
		              <input class="form-check-input ms-0" type="checkbox" checked id="flexSwitchCheckDefault00">
		            </div>
		          </div>
		          <img id="bulbicon" class="img-fluid pt-3 pb-2" src="${path}/resource/community/light-bulb.png" alt="bulb_icon" style="width:auto; height:70px;">
		          <p class="mb-0">e-mail  :  <span id="roomemail"> ${roommember.email}</span></p>
		          <p class="mb-0">휴대폰번호  :  <span id="roomphonenumber"> ${roommember.phonenumber}</span></p>
		          <p class="mb-0">사업자정보  :  <span id="roombusinessnumber"> ${roommember.businessnumber}
		          												<c:if test="${empty roommember.businessnumber}"> 등록된 사업자번호가 없습니다.
		          														</c:if></span></p>
		        </div>
		      </div>
		  </div>
		  <div class="col-lg-2">
          	<div class="card" style="width:300px;">
	            <div class="card-body">
	              <div class="icon icon-shape bg-gradient-primary shadow text-center">
	                <i class="ni ni-favourite-28" aria-hidden="true"></i>
	              </div>
	              <h5 class="mt-3 mb-0">${likeCnt}<span class="text-secondary text-sm">개</span></h5>
	              <p class="mb-0">${roommember.nickname}님 게시글의 좋아요 갯수</p>
	              <h5 class="mt-3 mb-0"><span id="meBoardRepCnt"></span><span class="text-secondary text-sm">개</span></h5>
	              <p class="mb-0">${roommember.nickname}님 게시글의 댓글 갯수</p>
	            </div>
	          </div>
	        </div>
		  <div class="col-lg-2">
          	<div class="card" style="width:300px;">
	            <div class="card-body">
	              <div class="icon icon-shape bg-gradient-primary shadow text-center">
	                <i class="ni ni-active-40" aria-hidden="true"></i>
	              </div>
	              <h5 class="mt-3 mb-0"><span id="meRepCnt"></span><span class="text-secondary text-sm">개</span></h5>
	              <p class="mb-0">${roommember.nickname}님이 쓰신 댓글 갯수</p>
	              <button type="button" class="btn btn-outline-primary mt-2" data-bs-toggle="modal" data-bs-target="#repModal">
	              		댓글보기</button>
	            </div>
	          </div>
	        </div>
	  	<div class="col-lg-2">
	        <div class="card" style="width:300px;">
	           <div class="card-body">
	             <p>팔로잉 수</p>
	             <h3 id="following"><span></span>명</h3>
	             <span class="badge badge-success">팔로우수 : <span id="folloewcnt" style="color:green"></span>명</span>
	           </div>
	        </div>
        </div>
        <div class="ms-auto d-flex">
          <div class="pe-4 mt-1 position-relative" >
            <p class="text-black text-s font-weight-bold mb-2">${roommember.nickname}님이 팔로우한 회원들:</p> <!-- 시간남으면 팔로잉한 회원들 추가하기 -->
            <div class="d-flex align-items-center justify-content-center">
              <div class="avatar-group">
              	<c:forEach var="followers" items="${follower}">
	                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${folloewers.nickname}" >
	                  <img alt="프로필 없음" src="${path}/resource/img/Member/profileimg/${followers.profileimg}" style="width:55px;height:45px;" onclick="memberRoom(${folloewers.email})">
	                </a>
                </c:forEach>
              </div>
            </div>
            <p class="text-black text-s font-weight-bold mb-2">${roommember.nickname}님이 팔로잉된 회원들:</p> <!-- 시간남으면 팔로잉한 회원들 추가하기 -->
            <div class="d-flex align-items-center justify-content-center">
              <div class="avatar-group">
              	<c:forEach var="followings" items="${following}">
	                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${followings.nickname}" >
	                  <img alt="프로필 없음" src="${path}/resource/img/Member/profileimg/${followings.profileimg}" style="width:55px;height:45px;" onclick="memberRoom(${followings.email})">
	                </a>
                </c:forEach>
              </div>
            </div>
            
            <hr class="vertical light mt-0">
          </div>
          <div class="ps-4">
            <button class="btn bg-gradient-info btn-icon-only mb-0 mt-3" data-bs-toggle="modal" data-bs-target="#unfollModal">
              <i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
      </div>
      <!-- 통계 -->
     <div class="row">
        <div class="col-lg-4 col-sm-6" style="height:300px;">
          <div class="card h-100">
            <div class="card-header pb-0 p-3">
              <div class="d-flex justify-content-between">
                <h6 class="mb-0">카테고리별 ${roommember.nickname}님의 게시글 갯수</h6>
                <button type="button" class="btn btn-icon-only btn-rounded btn-outline-secondary mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center" 
                		data-bs-toggle="modal" data-bs-target="#boardCategoryCntModal">
                  <i class="fas fa-info" aria-hidden="true"></i>
                </button>
              </div>
            </div>
            <div class="card-body pb-0 p-3 mt-4">
              <div class="row">
                <div class="col-7 text-start">
                  <div class="chart" id="chartposition">
                    <canvas id="chart-pie" class="chart-canvas" height="200"></canvas>
                  </div>
                </div>
                <div class="col-5 my-auto">
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-info"></i>
                    <span class="text-dark text-xs">홍보글</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-primary"></i>
                    <span class="text-dark text-xs">사업아이디어</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-dark"></i>
                    <span class="text-dark text-xs">사는이야기</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-secondary"></i>
                    <span class="text-dark text-xs">꿀팁</span>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-8 col-sm-6 mt-sm-0 mt-4" style="height:300px;">
          <div class="card">
            <div class="card-header pb-0 p-3">
              <div class="d-flex justify-content-between">
                <h6 class="mb-0">월별 게시글 등록 갯수</h6>
                <button type="button" class="btn btn-icon-only btn-rounded btn-outline-secondary mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center" 
                		data-bs-toggle="modal" data-bs-target="#boardMonthCntModal">
                  <i class="fas fa-info" aria-hidden="true"></i>
                </button>
              </div>
              <div class="d-flex align-items-center">
                <span class="badge badge-md badge-dot me-4">
                  <i class="bg-dark"></i>
                  <span class="text-dark text-xs">${roommember.nickname}님이 게시한 게시글 </span>
                </span>
              </div>
            </div>
            <div class="card-body p-3">
              <div class="chart">
                <canvas id="chart-line" class="chart-canvas" height="200"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 게시글내역  -->
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-1">홍보</h6>
            </div>
     		<c:if test="${not empty adv[0].title}">
            <div class="card-body p-3">
              <div class="row">
	              <c:forEach var="advlist" items="${adv}" end="2">
	                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
	                  <div class="card card-blog card-plain">
	                    <div class="position-relative">
	                      <a class="d-block shadow-xl border-radius-xl">
	                        <img src="${path}/resource/community/${advlist.imgname}" alt="이미지 없음" class="img-fluid shadow border-radius-xl">
	                      </a>
	                    </div>
	                    <div class="card-body px-1 pb-0">
	                      <a href="javascript:;">
	                        <h5>
	                          ${advlist.title}
	                        </h5>
	                      </a>
	                      <div class="d-flex align-items-center justify-content-between">
	                        <a href="${path}/CommunityDetail.do?communityNumber=${advlist.communitynumber}&keyword=&type=&shift=registDate&category=${advlist.category}" type="button" class="btn btn-outline-primary btn-sm mb-0">보러가기</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	               </c:forEach>
                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
                  <div class="card h-100 card-plain border">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                      <a href="javascript:;">
                        <i class="fa fa-plus text-secondary mb-3"></i>
                        <h5 class=" text-secondary"> 더 보기 </h5>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:if>
            <c:if test="${empty adv[0].title}">
            	<h6 style="color:grey; text-align:center;">게시글이 없습니다.</h6>
            </c:if>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-1">사업아이디어</h6>
            </div>
            <c:if test="${not empty idea[0].title}">
            <div class="card-body p-3">
              <div class="row">
	              <c:forEach var="idealist" items="${idea}" end="2">
	                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
	                  <div class="card card-blog card-plain">
	                    <div class="position-relative">
	                      <a class="d-block shadow-xl border-radius-xl">
	                        <img src="${path}/resource/community/${idealist.imgname}" alt="이미지 없음" class="img-fluid shadow border-radius-xl">
	                      </a>
	                    </div>
	                    <div class="card-body px-1 pb-0">
	                      <a href="javascript:;">
	                        <h5>
	                          ${idealist.title}
	                        </h5>
	                      </a>
	                      <div class="d-flex align-items-center justify-content-between">
	                        <a href="${path}/CommunityDetail.do?communityNumber=${idealist.communitynumber}&keyword=&type=&shift=registDate&category=${idealist.category}" type="button" class="btn btn-outline-primary btn-sm mb-0">보러가기</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                </c:forEach>
                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
                  <div class="card h-100 card-plain border">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                      <a href="javascript:;">
                        <i class="fa fa-plus text-secondary mb-3"></i>
                        <h5 class=" text-secondary"> 더 보기 </h5>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:if>
            <c:if test="${empty idea[0].title}">
            	<h6 style="color:grey; text-align:center;">게시글이 없습니다.</h6>
            </c:if>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-1">사는 이야기</h6>
            </div>
            <div class="card-body p-3">
            <c:if test="${not empty life[0].title}">
              <div class="row">
	              <c:forEach var="lifelist" items="${life}" end="2">
	                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
	                  <div class="card card-blog card-plain">
	                    <div class="position-relative">
	                      <a class="d-block shadow-xl border-radius-xl">
	                        <img src="${path}/resource/community/${lifelist.imgname}" alt="이미지 없음" class="img-fluid shadow border-radius-xl">
	                      </a>
	                    </div>
	                    <div class="card-body px-1 pb-0">
	                      <a href="javascript:;">
	                        <h5>
	                          	${lifelist.title}
	                        </h5>
	                      </a>
	                      <div class="d-flex align-items-center justify-content-between">
	                        <a href="${path}/CommunityDetail.do?communityNumber=${lifelist.communitynumber}&keyword=&type=&shift=registDate&category=${lifelist.category}" type="button" class="btn btn-outline-primary btn-sm mb-0">보러가기</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                </c:forEach>
                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
                  <div class="card h-100 card-plain border">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                      <a href="javascript:;">
                        <i class="fa fa-plus text-secondary mb-3"></i>
                        <h5 class=" text-secondary"> 더보기 </h5>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:if>
            <c:if test="${empty life[0].title}">
            	<h6 style="color:grey; text-align:center;">게시글이 없습니다.</h6>
            </c:if>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-1">꿀팁</h6>
            </div>
            <c:if test="${not empty tip[0].title}">
            <div class="card-body p-3">
              <div class="row">
	              <c:forEach var="tiplist" items="${tip}" end="2">
	                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
	                  <div class="card card-blog card-plain">
	                    <div class="position-relative">
	                      <a class="d-block shadow-xl border-radius-xl">
	                        <img src="${path}/resource/community/${tiplist.imgname}" alt="이미지없음" class="img-fluid shadow border-radius-xl">
	                      </a>
	                    </div>
	                    <div class="card-body px-1 pb-0">
	                      <a href="javascript:;">
	                        <h5>
	                          	${tiplist.title}
	                        </h5>
	                      </a>
	                      <div class="d-flex align-items-center justify-content-between">
	                        <a href="${path}/CommunityDetail.do?communityNumber=${tiplist.communitynumber}&keyword=&type=&shift=registDate&category=${tiplist.category}" type="button" class="btn btn-outline-primary btn-sm mb-0">보러가기</a>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                </c:forEach>
                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
                  <div class="card h-100 card-plain border">
                    <div class="card-body d-flex flex-column justify-content-center text-center">
                      <a href="javascript:;">
                        <i class="fa fa-plus text-secondary mb-3"></i>
                        <h5 class=" text-secondary"> 더 보기 </h5>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:if>
            <c:if test="${empty tip[0].title}">
            	<h6 style="color:grey; text-align:center;">게시글이 없습니다.</h6>
            </c:if>
          </div>
        </div>
      </div>
  </main>
  <!-- 팔로우 추가 회원(언팔중인 회원) 보러가기 모달창 -->
  <div class="modal fade w-500" id="unfollModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document" style="width:800px;">
		  <div class="modal-content" style="width:750px;">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">팔로우 하고싶은 회원정보<br></h5>
		      
		      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<table class="table align-items-center mb-0">
		      		<tr><th>프로필</th><th>이메일</th><th>닉네임</th><th>room구경가기</th><th>팔로우</th></tr>
		      		<c:forEach var="unfollowmem" items="${unfollowMember}">
		      			<tr>
		      			<td><img src="${path}/resource/img/Member/profileimg/${unfollowmem.profileimg}" style="width:40px;height:40px;"></td>
		      			<td>${unfollowmem.email}</td>
		      			<td>${unfollowmem.nickname}</td>
		      			<td class="align-middle text-center"><a href="communityMemberRoom.do?email=${unfollowmem.email}" id="roomGo" class="btn btn-outline-primary mt-2"><i class="ni ni-shop"></i></a></td>
		      			<td class="align-middle text-center"><button id="followinsert" class="btn btn-outline-primary mt-2"><i class="ni ni-fat-add"></i></button></td>
		      			</tr>
		      		</c:forEach>
		      	</table>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">닫기</button>
		    </div>
		  </div>
		</div>
	</div>
  <!-- 카테고리별 게시글 갯수정보 모달창  -->
	<div class="modal fade" id="boardCategoryCntModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">${roommember.nickname}님이 쓴 카테고리별 게시글 수</h5>
		      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<table id="boardCategoryCntTab" class="table align-items-center mb-0">
		      		<tr><th>홍보글</th><td></td></tr>
		      		<tr><th>사업아이디어</th><td></td></tr>
		      		<tr><th>사는이야기</th><td></td></tr>
		      		<tr><th>꿀팁</th><td></td></tr>
		      	</table>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">닫기</button>
		    </div>
		  </div>
		</div>
	</div>
  <!-- 월별 게시글 갯수정보 모달창  -->
	<div class="modal fade" id="boardMonthCntModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">${roommember.nickname}님이 쓴 월별 게시글 수</h5>
		      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<table id="boardMonthCntTab" class="table align-items-center mb-0">
		      		<%-- <c:forEach var="i" begin="1" end="12" > --%>
		      			<%-- <c:set var="monthval" value="month${i}"> --%>
		      			<%-- <tr><th>${i}월</th><td>${month1}</td></tr><!-- <c:out value="${monthval}"></c:out> --> --%>
		      			<tr><th>1월</th><td>${month1} 개</td></tr>
		      			<tr><th>2월</th><td>${month2} 개</td></tr>
		      			<tr><th>3월</th><td>${month3} 개</td></tr>
		      			<tr><th>4월</th><td>${month4} 개</td></tr>
		      			<tr><th>5월</th><td>${month5} 개</td></tr>
		      			<tr><th>6월</th><td>${month6} 개</td></tr>
		      			<tr><th>7월</th><td>${month7} 개</td></tr>
		      			<tr><th>8월</th><td>${month8} 개</td></tr>
		      			<tr><th>9월</th><td>${month9} 개</td></tr>
		      			<tr><th>10월</th><td>${month10} 개</td></tr>
		      			<tr><th>11월</th><td>${month11} 개</td></tr>
		      			<tr><th>12월</th><td>${month12} 개</td></tr>
		      			<%-- </c:set> --%>
		      		<%-- </c:forEach> --%>
		      	</table>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">닫기</button>
		    </div>
		  </div>
		</div>
	</div>
  <!-- 댓글보러가기 모달창 -->
  <div class="modal fade" id="repModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content" style="width:1200px; margin-left:-50%;">
		    <div class="modal-header">
		      <h5 class="modal-title" id="exampleModalLabel">${roommember.nickname}님이 쓴 댓글 정보<br>
		      <span style="color:grey; font-size:11pt;">＊ 게시글 클릭 시, 게시글 상세조회 페이지로 이동</span></h5>
		      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span>
		      </button>
		    </div>
		    <div class="modal-body">
		      	<table id="boardCntTab" class="table align-items-center mb-0">
		      		<tr><th>카테고리</th><th>게시글명</th><th>댓글내용</th></tr>
		      		<c:if test="${not empty replyInfo}">
			      		<c:forEach var="repInfo" items="${replyInfo}">
			      			<tr onclick="location.href='${path}/CommunityDetail.do?communityNumber=${repInfo.communitynumber}&keyword=&type=&shift=registDate&category=${repInfo.category}'">
			      				<td>${repInfo.category}</td>
			      				<td>${repInfo.title}</td>
			      				<td>${repInfo.repcontent}</td>
			      			</tr>
			      			
			      		</c:forEach>
		      		</c:if>
		      		<c:if test="${empty replyInfo}">
			      		<tr><td colspan="2" style="color:grey; text-align:center;"> 등록한 댓글이 없습니다.</td></tr>
		      		</c:if>
		      		
		      	</table>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">닫기</button>
		    </div>
		  </div>
		</div>
	</div>
  <!--채팅 모달창  -->
  <div class="modal fade" id="chatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content"  style="width:900px;">
	      <div class="modal-header">
              <div class="row">
                 <div class="d-flex align-items-center">
                   <img alt="Image" src="${path}/assets/img/team-2.jpg" class="avatar">
                   <div class="ms-3">
                     <h6 class="mb-0 d-block">Charlie Watson</h6>
                     <span class="text-sm text-dark opacity-8">last seen today at 1:53am</span>
                   </div>
                    <button class="btn btn-icon-only shadow-none text-dark mb-0 me-3 me-sm-0" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Video call">
                   <i class="ni ni-camera-compact"></i>
                 </button>
	               <div class="col-lg-1 col-2 my-auto ps-0">
	                 <div class="dropdown">
	                   <button class="btn btn-icon-only shadow-none text-dark mb-0" type="button" data-bs-toggle="dropdown">
	                     <i class="ni ni-settings"></i>
	                   </button>
	                   <ul class="dropdown-menu dropdown-menu-end me-sm-n2 p-2" aria-labelledby="chatmsg">
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Profile
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Mute conversation
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Block
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Clear chat
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md text-danger" href="javascript:;">
	                         Delete chat
	                       </a>
	                     </li>
	                   </ul>
	                 </div>
	               </div>
                 </div>
             </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color:black; font-size:20pt; font-weigth:bold;">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
          <div class="card blur shadow-blur max-height-vh-70">
            <div class="card-body overflow-auto overflow-x-hidden">
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        It contains a lot of good lessons about effective practices
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>3:14am</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Can it generate daily design links that include essays and data visualizations ?<br>
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mt-4">
                <div class="col-md-12 text-center">
                  <span class="badge text-dark">Wed, 3:27pm</span>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Yeah! Responsive Design is geared towards those trying to build web apps
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:31pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Excellent, I want it now !
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        You can easily get it; The content here is all free
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Awesome, blog is important source material for anyone who creates apps? <br>
                        Beacuse these blogs offer a lot of information about website development.
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-5">
                  <div class="card ">
                    <div class="card-body p-2">
                      <div class="col-12 p-0">
                        <img src="https://images.unsplash.com/photo-1602142946018-34606aa83259?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1762&q=80" alt="Rounded image" class="img-fluid mb-2 border-radius-lg">
                      </div>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:47pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        At the end of the day … the native dev apps is where users are
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        Charlie is Typing...
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer d-block">
              <form class="align-items-center">
                <div class="d-flex">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type here" aria-label="Message example input">
                  </div>
                  <button class="btn bg-gradient-primary mb-0 ms-2">
                    <i class="ni ni-send"></i>
                  </button>
                </div>
                
              </form>
            </div>
        </div>
	      </div>
	    </div>
	  </div>
	</div>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="${path}/assets/js/plugins/chartjs.min.js"></script>
  <!-- 차트 기능 -->
  <script>
    var ctx1 = document.getElementById("chart-line").getContext("2d");
    var ctx2 = document.getElementById("chart-pie").getContext("2d");

    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228,0)'); //purple colors

    var gradientStroke2 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)'); //purple colors
	
    // Line chart
    new Chart(ctx1, {
      type: "line",
      data: {
        labels: ["Jan","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "커뮤니티 게시글 갯수",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 2,
            pointBackgroundColor: "#3A416F",
            borderColor: "#3A416F",
            borderWidth: 3,
            backgroundColor: gradientStroke2,
            fill: true,
            data: [${month1}, ${month2}, ${month3}, ${month4}, ${month5}, ${month6}, ${month7}, ${month8}, ${month9}, ${month10}, ${month11}, ${month12}],
            maxBarThickness: 6
          }
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#9ca2b7'
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: true,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#9ca2b7',
              padding: 10
            }
          },
        },
      },
    });

	var adv="${adv}"
	console.log("홍보글",adv)
	
	var idea="${idea}"
	console.log("사업아이디어",idea)
	
	var life="${life}"
	console.log("사는이야기",life)
	
	var tip="${tip}"
	console.log("꿀팁",tip)
	
	if(arrFun(adv)==0 && arrFun(idea)==0 && arrFun(life)==0 && arrFun(tip)==0){
		$("#chartposition").text("등록된 게시글이 없습니다.")
	}
    // Pie chart
    new Chart(ctx2, {
      type: "pie",
      data: {
        labels: ['홍보글', '사업아이디어', '사는이야기', '꿀팁'],
        datasets: [{
          label: "Projects",
          weight: 9,
          cutout: 0,
          tension: 0.9,
          pointRadius: 2,
          borderWidth: 2,
          backgroundColor: ['#17c1e8', '#5e72e4', '#3A416F', '#a8b8d8'],
          data: [arrFun(adv), arrFun(idea), arrFun(life), arrFun(tip)],
          fill: false
        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              display: false
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              display: false,
            }
          },
        },
      },
    });
  </script>
  
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>
</html>