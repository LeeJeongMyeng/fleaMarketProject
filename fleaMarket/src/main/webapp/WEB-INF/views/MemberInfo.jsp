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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>내 정보 조회 및 수정</title>
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
	var uptmsg = '${uptmsg}'
	if(uptmsg!=''){
		alert(uptmsg)
	}
	
})
var SessAddress = '${Login.address}' //세션주소값
var SessCategory = '${Login.category}'
var SessPassword = '${Login.password}'
</script>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	
		
	
<main class="main-content position-relative border-radius-lg ">
		<div class="container-fluid py-4">
			<div class="row ms-10">
				<div class="col-10">
					<div class="card">
						<!-- Card header -->
						<div class="card-header pb-0">
							<div class="d-lg-flex">
								<div>
								  <div class="col-sm-auto col-8 my-auto">
                <div class="h-100">
                </div>
              </div>
              <div class="col-sm-auto ms-sm-auto mt-sm-0 mt-3 d-flex">
                <label class="form-check-label mb-0">
                  </small>
                </label>
                <div class="form-check form-switch ms-2">
                </div>
              </div>
            </div>
          </div>
          <!-- Card Basic Info -->
            <h5>내 정보 조회 및 수정</h5>
          <div class="card mt-4" id="basic-info">
            <form id="MemberInfoForm" action="UpdateMemberInfo.do" method="post" enctype="multipart/form-data" onsubmit="return UpdateInfo()">
            <div class="card-body pt-0">
            
            <div class="row mt-2 mb-6">
                <div class="col-2 ms-3">
                <label for="profileimg" class="form-label">프로필</label><br>
					<img id="MemberInfo_Profileimg" src="${path}/resource/img/Member/profileimg/${Login.profileimgname}" style="border:1px solid #e3dee4;border-radius:50%; position: absolute; left: 52px;" class="img-circle" width="70px" height="70px">
					<input type="hidden" name="profileimgname" value="${Login.profileimgname }"/>
				</div>
				<div class="col-4">
					<label class="form-label">프로필사진 변경</label>
					<input class="form-control form-control-sm mb-0 w-100" type="file" id="profileimg" name="profileimg" onchange="RenderImg(this);">
				</div>
			</div>
              <div class="row mb-5">
                <div class="col-6">
                  <label class="form-label">이름</label>
                  
                    <input id="firstName" name="name" class="form-control" type="text" value="${Login.name }" readonly>
                  
                </div>
                <div class="col-6">
                  <label class="form-label">이메일</label>
                  
                    <input id="email" name="email" class="form-control" type="email" value="${Login.email }" readonly>
                  
                </div>
              </div>          
              <div class="row mb-4">
              	<div class="col-6">
              		<div class="row">
			          		
				          <div class="col-6">
				          <label>가입유형(권한)</label>
					      	<input type="text" name="authority" class="form-control form-control mb-3" value="${Login.authority }" readonly>
				          </div>
				         <c:choose>			         
				         <c:when test="${Login.authority=='일반셀러'}">
					      <div class="col-4">
					      <label>사업자로 변환</label>
					      	<input type="button" class="btn btn-primary w-100" style="font-size: x-small;background: #8451ce;" id="" value="사업자 신청"><br>
				          </div>  
				          </c:when>	          
				         <c:when test="${Login.authority=='사업자'}">				        
					      <div class="col-4">
					       <label>사업자번호</label>	 
							<input type="text" name="businessnumber" class="form-control form-control mb-3" value="${Login.businessnumber }" readonly>				          </div>  
				          </c:when>
				          </c:choose>                   
	         		 </div>
              	</div>
              </div>   
	          
              <div class="row mb-5">
                <div class="col-6">
                  <label class="form-label">닉네임</label>
                 
                    <input id="confirmation" name="nickname" class="form-control" type="text" value="${Login.nickname }">
                 	 <div class="invalid-feedback">닉네임은 2자이상 부탁드립니다.</div>	
                 	
                </div>
                <div class="col-6">
                  <label class="form-label">핸드폰번호</label>
                  
                    <input name="phonenumber" class="form-control" type="text" value="${Login.phonenumber }">
                  	 <div class="invalid-feedback">13자리가 아닙니다.</div>	
                  
                </div>
                </div>
                <div class="row">
                  <div class="col-6">
	                <label>주소</label>
		             <div class="">
			              <div class="row">
			              <div class="col-4">
			              <input type="text" class="form-control form-control-sm" id="sample6_postcode" value="" readonly>
			              </div>
			              <div class="col-8">
			              <input type="button" class="btn btn-primary w-50" style="font-size: x-small;background: #8451ce;"  onclick="AddressApi()" value="주소 수정"><br>
			              </div>
			              </div>
						  <input type="text" class="form-control form-control-sm mt-n1" id="sample6_address" placeholder="주소" readonly><br>
						  <input type="text" class="form-control form-control-sm  mt-n3" id="sample6_extraAddress" placeholder="참고항목" readonly><br>
						  <input type="text" class="form-control form-control-sm  mt-n3 mb-5" id="sample6_detailAddress" placeholder="상세주소" readonly>
			              <div class="invalid-feedback">주소를 입력해주세요.</div>
			              <input type="hidden" name="address"/> <%--실제 주소로 입력될 input --%>
		              </div>  
                  </div>
                  <div class="col-6">
                  		<label class="form-label">카테고리</label>
		                  <select class="form-control" name="category" id="MemberInfo_category">		                    
		                      <option>여성의류</option>
							  <option>남성의류</option>
							  <option>공통의류</option>
		                  </select>
                  </div>
                  <div class="" style="display:flex;">

	                <button type="submit" style="margin-left:auto;" class="btn btn-primary btn-md mb-0">회원정보수정</button>

                  	<button type="button" style="margin:0 13px;" data-bs-toggle="modal" data-bs-target="#LeaveMemberModal" id="LeaveMemberModalbtn" class="btn btn-outline-danger btn-md mb-0">회원탈퇴</button>                  
                  </div>
                </div>          
          </div>
          </form>
          <!-- Card Change Password -->
          <div class="card mt-4" id="password">
            <div class="card-header">
              <h5>비밀번호 변경</h5>
            </div>
            <form id="UpdatePasswordForm" action="UpdatePassword.do" method="post" onsubmit="return UpdatePassword()">
           	<input type="hidden" name="email" value="${Login.email }"/>
            <div class="card-body pt-0">
              <label class="form-label">현재 비밀번호</label>
              <div class="form-group">
                <input class="form-control w-50" id="CurrentPassword" type="password" placeholder="Current password">
                <div class="invalid-feedback">기존 비밀번호와 일치하지 않습니다.</div>	
              </div>
              <label class="form-label">새로운 비밀번호(8~16자 영/숫/특수 중 2가지이상)</label>	
              <div class="form-group">
                <input class="form-control w-50" name="password" type="password" placeholder="New password">
                <div class="invalid-feedback">형식이 올바르지 않습니다.</div>	
              </div>
              <label class="form-label">비밀번호 확인</label>
              <div class="form-group">
                <input class="form-control w-50" id="password2" type="password" placeholder="Confirm password">
                <div class="invalid-feedback">비밀번호와 일치하지않습니다.</div>	
              </div>
              <button class="btn btn-primary mt-3 mb-0">비밀번호변경</button>
            </div>
            </form>
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
		</div>
	</main>

	
	<div data-bs-toggle="modal" data-bs-target="#LeaveMemberModal" id="LeaveMemberModalbtn"></div>
	<div class="modal fade" id="LeaveMemberModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="top:119px;">
	      <div class="modal-header" style="background-color: #df4343;">
	        <h3 class="modal-title fs-6 text-center" id="MemberFindTitle" style="color: white;">회원탈퇴</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	     
	      <div class="modal-body">
			<div class="card multisteps-form__panel p-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <form id="LeaveMemberForm" action="LeaveMember.do" method="post" onsubmit="return LeaveMember()">
                    <div class="multisteps-form__content">
                      <div class="row mt-3 mb-3">
                        <div class="col-12">
                          <label>탈퇴를 위해 회원님의 비밀번호를 입력해주세요.</label>
                          <input type="hidden" name="email" value="${Login.email }"/>
                          <input type="hidden" name="profileimgname" value="${Login.profileimgname }"/>
                          <input class="multisteps-form__input form-control" name="password" type="password" placeholder="떠나지 마세요.." />
                          <div class="invalid-feedback">기존 비밀번호와 일치하지 않습니다.</div>
                        </div>
                      </div>
                      <div id="MemberFindResult"></div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn ms-auto me-3" type="submit" style="background-color:#df4343; color:white;">탈퇴</button>
                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      </div>
                    </div>
                 </form>   
           </div>
                  <!--single form panel-->
	      </div>
	      
	      <div class="modal-footer">
	        회사소개 | 이용약관 | <strong>개인정보처리방침</strong>
	      </div>
	     
	    </div>
	  </div>
	</div> <!-- sns확인모달 모달끝 -->
	
	<script src="${path}/resource/js/Req1001/MemberInfo.js"></script>
	
</body>

</html>