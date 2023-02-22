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
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="../../../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../../assets/img/favicon.png">
  <title>
    회원가입
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../../../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../../../assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>
<style>

#SignUp_secondSection{
 display:none;
 position: absolute;
 top: 108px;
}
</style>
<body class="">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
 	
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-left">
                  <h4 class="font-weight-bolder">Sign Up</h4>
                  <p class="mb-0">가입하실 회원님의 정보를 입력해주세요.</p>
                </div>
                <div class="card-body pb-3">
                  <form role="form">
                  <div class="container animate__animated" id="SignUp_firstSection">
	                  <label>이름</label>
	                    <div class="mb-3">
	                      <input type="text" class="form-control" placeholder="Name" aria-label="Name" name="name">
	                    </div>
	                    <label>이메일</label>
	                    <div class="mb-3">
	                      <input type="email" class="form-control" placeholder="Email" aria-label="Email">
	                    </div>
	                    <label>비밀번호</label>
	                    <div class="mb-3">
	                      <input type="password" class="form-control" placeholder="Password" aria-label="Password">
	                    </div>
	                    <label>비밀번호 확인</label>
	                    <div class="mb-3">
	                      <input type="password" class="form-control" placeholder="Password" aria-label="Password">
	                    </div>
	                    <div class="text-center">
	                      <button type="button" id="SignUp_nextBtn" onclick=" SignUpNext()" class="btn btn-primary w-100 mt-4 mb-0">다음 단계</button>
	                    </div>
                  </div>
                  
                  
                  <div class="container animate__animated" id="SignUp_secondSection">
	                  <label>이름</label>
	                    <div class="mb-3">
	                      <input type="text" class="form-control" placeholder="Name" aria-label="Name" name="rrn">
	                    </div>
	                    <label>이메일</label>
	                    <div class="mb-3">
	                      <input type="email" class="form-control" placeholder="Email" aria-label="Email">
	                    </div>
	                    <label>비밀번호</label>
	                    <div class="mb-3">
	                      <input type="password" class="form-control" placeholder="Password" aria-label="Password">
	                    </div>
	                    <label>비밀번호 확인</label>
	                    <div class="mb-3">
	                      <input type="password" class="form-control" placeholder="Password" aria-label="Password">
	                    </div>
	                    <div class="form-check form-check-info text-left">
	                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
	                      <label class="form-check-label" for="flexCheckDefault">
	                        <a href="../../../pages/privacy.html" class="text-dark font-weight-bolder">이용약관</a>에 동의합니다.
	                      </label>
	                    </div>
	                    <div class="text-center">
	                      <button type="button" onclick="SignUp_Ok()" class="btn btn-primary w-100 mt-4 mb-0">가입완료</button>
	                    </div>
                  </div>
                    
                  </form>
                </div>
                <div class="card-footer text-center pt-0 px-sm-4 px-1">
                  <p class="mb-4 mx-auto">
                    이미 계정이 있으신가요??
                    <a href="../../../pages/sign-in/sign-in-cover.html" class="text-primary font-weight-bold">로그인</a>
                  </p>
                </div>
              </div>
            </div>
            <%--오른쪽 사진에 있는 그림 --%>
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 end-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signup-ill.jpg');
          background-size: cover;">
                <span class="mask bg-primary opacity-4"></span>
                <h4 class="mt-5 text-white font-weight-bolder position-relative">당신의 플리마켓 여정의 시작을<br> 진심으로 응원합니다.</h4>
                <p class="text-white position-relative">ㅋㅋ!!! 좋은글귀넣기 ㅋㅋㅋㅋ!!!</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!--   Core JS Files   -->
  <script src="../../../assets/js/core/popper.min.js"></script>
  <script src="../../../assets/js/core/bootstrap.min.js"></script>
  <script src="../../../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../../../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="../../../assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="../../../assets/js/plugins/jkanban/jkanban.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    
    //회원가입 양식 애니메이션
    const firstSection = document.querySelector('#SignUp_firstSection');
	const secondSection = document.querySelector('#SignUp_secondSection');
	secondSection.style.display ='none';
    function SignUpNext(){
    firstSection.classList.add('animate__fadeOutUp'); // 엘리먼트에 애니메이션 클래스 부여
    }
    
    firstSection.addEventListener('animationend', () => {
    	secondSection.style.display ='block';
    	secondSection.classList.add('animate__fadeInUp');
    	
    });
    
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../../../assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

</html>