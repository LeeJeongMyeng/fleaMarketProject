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
<meta charset="UTF-8">
<title>커뮤니티 게시글 수정</title>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    Argon Dashboard 2 PRO by Creative Tim
  </title>
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
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard-pro/pages/dashboards/default.html " target="_blank">
        <img src="${path}/assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">Argon Dashboard 2 PRO</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto h-auto" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#dashboardsExamples" class="nav-link " aria-controls="dashboardsExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-shop text-primary text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Dashboards</span>
          </a>
          <div class="collapse " id="dashboardsExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/dashboards/landing.html">
                  <span class="sidenav-mini-icon"> L </span>
                  <span class="sidenav-normal"> Landing </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/dashboards/default.html">
                  <span class="sidenav-mini-icon"> D </span>
                  <span class="sidenav-normal"> Default </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/dashboards/automotive.html">
                  <span class="sidenav-mini-icon"> A </span>
                  <span class="sidenav-normal"> Automotive </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/dashboards/smart-home.html">
                  <span class="sidenav-mini-icon"> S </span>
                  <span class="sidenav-normal"> Smart Home </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#vrExamples">
                  <span class="sidenav-mini-icon"> V </span>
                  <span class="sidenav-normal"> Virtual Reality <b class="caret"></b></span>
                </a>
                <div class="collapse " id="vrExamples">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/dashboards/vr/vr-default.html">
                        <span class="sidenav-mini-icon text-xs"> V </span>
                        <span class="sidenav-normal"> VR Default </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/dashboards/vr/vr-info.html">
                        <span class="sidenav-mini-icon text-xs"> V </span>
                        <span class="sidenav-normal"> VR Info </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/dashboards/crm.html">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> CRM </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item mt-3">
          <h6 class="ps-4  ms-2 text-uppercase text-xs font-weight-bolder opacity-6">PAGES</h6>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#pagesExamples" class="nav-link " aria-controls="pagesExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-ungroup text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Pages</span>
          </a>
          <div class="collapse " id="pagesExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#profileExample">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Profile <b class="caret"></b></span>
                </a>
                <div class="collapse " id="profileExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/profile/overview.html">
                        <span class="sidenav-mini-icon text-xs"> P </span>
                        <span class="sidenav-normal"> Profile Overview </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/profile/teams.html">
                        <span class="sidenav-mini-icon text-xs"> T </span>
                        <span class="sidenav-normal"> Teams </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/profile/projects.html">
                        <span class="sidenav-mini-icon text-xs"> A </span>
                        <span class="sidenav-normal"> All Projects </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#usersExample">
                  <span class="sidenav-mini-icon"> U </span>
                  <span class="sidenav-normal"> Users <b class="caret"></b></span>
                </a>
                <div class="collapse " id="usersExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/users/reports.html">
                        <span class="sidenav-mini-icon text-xs"> R </span>
                        <span class="sidenav-normal"> Reports </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}pages/pages/users/new-user.html">
                        <span class="sidenav-mini-icon text-xs"> N </span>
                        <span class="sidenav-normal"> New User </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#accountExample">
                  <span class="sidenav-mini-icon"> A </span>
                  <span class="sidenav-normal"> Account <b class="caret"></b></span>
                </a>
                <div class="collapse " id="accountExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/account/settings.html">
                        <span class="sidenav-mini-icon text-xs"> S </span>
                        <span class="sidenav-normal"> Settings </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/account/billing.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Billing </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/account/invoice.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Invoice </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/account/security.html">
                        <span class="sidenav-mini-icon text-xs"> S </span>
                        <span class="sidenav-normal"> Security </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#projectsExample">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Projects <b class="caret"></b></span>
                </a>
                <div class="collapse " id="projectsExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/projects/general.html">
                        <span class="sidenav-mini-icon text-xs"> G </span>
                        <span class="sidenav-normal"> General </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/projects/timeline.html">
                        <span class="sidenav-mini-icon text-xs"> T </span>
                        <span class="sidenav-normal"> Timeline </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/pages/projects/new-project.html">
                        <span class="sidenav-mini-icon text-xs"> N </span>
                        <span class="sidenav-normal"> New Project </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/pricing-page.html">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Pricing Page </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/rtl-page.html">
                  <span class="sidenav-mini-icon"> R </span>
                  <span class="sidenav-normal"> RTL </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/widgets.html">
                  <span class="sidenav-mini-icon"> W </span>
                  <span class="sidenav-normal"> Widgets </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/charts.html">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Charts </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/sweet-alerts.html">
                  <span class="sidenav-mini-icon"> S </span>
                  <span class="sidenav-normal"> Sweet Alerts </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/notifications.html">
                  <span class="sidenav-mini-icon"> N </span>
                  <span class="sidenav-normal"> Notifications </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/pages/chat.html">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Chat </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#applicationsExamples" class="nav-link " aria-controls="applicationsExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-ui-04 text-info text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Applications</span>
          </a>
          <div class="collapse " id="applicationsExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/applications/kanban.html">
                  <span class="sidenav-mini-icon"> K </span>
                  <span class="sidenav-normal"> Kanban </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/applications/wizard.html">
                  <span class="sidenav-mini-icon"> W </span>
                  <span class="sidenav-normal"> Wizard </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/applications/datatables.html">
                  <span class="sidenav-mini-icon"> D </span>
                  <span class="sidenav-normal"> DataTables </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/applications/calendar.html">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Calendar </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/applications/analytics.html">
                  <span class="sidenav-mini-icon"> A </span>
                  <span class="sidenav-normal"> Analytics </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#ecommerceExamples" class="nav-link active" aria-controls="ecommerceExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-archive-2 text-success text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Ecommerce</span>
          </a>
          <div class="collapse  show " id="ecommerceExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/ecommerce/overview.html">
                  <span class="sidenav-mini-icon"> O </span>
                  <span class="sidenav-normal"> Overview </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link  active " data-bs-toggle="collapse" aria-expanded="false" href="#productsExample">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Products <b class="caret"></b></span>
                </a>
                <div class="collapse show" id="productsExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/ecommerce/products/new-product.html">
                        <span class="sidenav-mini-icon text-xs"> N </span>
                        <span class="sidenav-normal"> New Product </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="${path}/pages/ecommerce/products/edit-product.html">
                        <span class="sidenav-mini-icon text-xs"> E </span>
                        <span class="sidenav-normal"> Edit Product </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/ecommerce/products/product-page.html">
                        <span class="sidenav-mini-icon text-xs"> P </span>
                        <span class="sidenav-normal"> Product Page </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/ecommerce/products/products-list.html">
                        <span class="sidenav-mini-icon text-xs"> P </span>
                        <span class="sidenav-normal"> Products List </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#ordersExample">
                  <span class="sidenav-mini-icon"> O </span>
                  <span class="sidenav-normal"> Orders <b class="caret"></b></span>
                </a>
                <div class="collapse " id="ordersExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/ecommerce/orders/list.html">
                        <span class="sidenav-mini-icon text-xs"> O </span>
                        <span class="sidenav-normal"> Order List </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/ecommerce/orders/details.html">
                        <span class="sidenav-mini-icon text-xs"> O </span>
                        <span class="sidenav-normal"> Order Details </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="${path}/pages/ecommerce/referral.html">
                  <span class="sidenav-mini-icon"> R </span>
                  <span class="sidenav-normal"> Referral </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#authExamples" class="nav-link " aria-controls="authExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-single-copy-04 text-danger text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Authentication</span>
          </a>
          <div class="collapse " id="authExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#signinExample">
                  <span class="sidenav-mini-icon"> S </span>
                  <span class="sidenav-normal"> Sign In <b class="caret"></b></span>
                </a>
                <div class="collapse " id="signinExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signin/basic.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Basic </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signin/cover.html">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Cover </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signin/illustration.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Illustration </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#signupExample">
                  <span class="sidenav-mini-icon"> S </span>
                  <span class="sidenav-normal"> Sign Up <b class="caret"></b></span>
                </a>
                <div class="collapse " id="signupExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signup/basic.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Basic </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signup/cover.html">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Cover </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/signup/illustration.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Illustration </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#resetExample">
                  <span class="sidenav-mini-icon"> R </span>
                  <span class="sidenav-normal"> Reset Password <b class="caret"></b></span>
                </a>
                <div class="collapse " id="resetExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/reset/basic.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Basic </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/reset/cover.html">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Cover </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/reset/illustration.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Illustration </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#lockExample">
                  <span class="sidenav-mini-icon"> L </span>
                  <span class="sidenav-normal"> Lock <b class="caret"></b></span>
                </a>
                <div class="collapse " id="lockExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/lock/basic.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Basic </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/lock/cover.html">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Cover </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/lock/illustration.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Illustration </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#StepExample">
                  <span class="sidenav-mini-icon"> 2 </span>
                  <span class="sidenav-normal"> 2-Step Verification <b class="caret"></b></span>
                </a>
                <div class="collapse " id="StepExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/verification/basic.html">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Basic </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/verification/cover.html">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Cover </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/verification/illustration.html">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Illustration </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#errorExample">
                  <span class="sidenav-mini-icon"> E </span>
                  <span class="sidenav-normal"> Error <b class="caret"></b></span>
                </a>
                <div class="collapse " id="errorExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/error/404.html">
                        <span class="sidenav-mini-icon text-xs"> E </span>
                        <span class="sidenav-normal"> Error 404 </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${path}/pages/authentication/error/500.html">
                        <span class="sidenav-mini-icon text-xs"> E </span>
                        <span class="sidenav-normal"> Error 500 </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <hr class="horizontal dark" />
          <h6 class="ps-4  ms-2 text-uppercase text-xs font-weight-bolder opacity-6">DOCS</h6>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#basicExamples" class="nav-link " aria-controls="basicExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-spaceship text-dark text-sm"></i>
            </div>
            <span class="nav-link-text ms-1">Basic</span>
          </a>
          <div class="collapse " id="basicExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#gettingStartedExample">
                  <span class="sidenav-mini-icon"> G </span>
                  <span class="sidenav-normal"> Getting Started <b class="caret"></b></span>
                </a>
                <div class="collapse " id="gettingStartedExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/quick-start/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> Q </span>
                        <span class="sidenav-normal"> Quick Start </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> L </span>
                        <span class="sidenav-normal"> License </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/overview/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Contents </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/build-tools/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> B </span>
                        <span class="sidenav-normal"> Build Tools </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item ">
                <a class="nav-link " data-bs-toggle="collapse" aria-expanded="false" href="#foundationExample">
                  <span class="sidenav-mini-icon"> F </span>
                  <span class="sidenav-normal"> Foundation <b class="caret"></b></span>
                </a>
                <div class="collapse " id="foundationExample">
                  <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/colors/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> C </span>
                        <span class="sidenav-normal"> Colors </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/grid/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> G </span>
                        <span class="sidenav-normal"> Grid </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/typography/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> T </span>
                        <span class="sidenav-normal"> Typography </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/icons/argon-dashboard" target="_blank">
                        <span class="sidenav-mini-icon text-xs"> I </span>
                        <span class="sidenav-normal"> Icons </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#componentsExamples" class="nav-link " aria-controls="componentsExamples" role="button" aria-expanded="false">
            <div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
              <i class="ni ni-app text-dark text-sm"></i>
            </div>
            <span class="nav-link-text ms-1">Components</span>
          </a>
          <div class="collapse " id="componentsExamples">
            <ul class="nav ms-4">
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/alerts/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> A </span>
                  <span class="sidenav-normal"> Alerts </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/badge/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> B </span>
                  <span class="sidenav-normal"> Badge </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/buttons/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> B </span>
                  <span class="sidenav-normal"> Buttons </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/cards/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Card </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/carousel/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Carousel </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/collapse/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> C </span>
                  <span class="sidenav-normal"> Collapse </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/dropdowns/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> D </span>
                  <span class="sidenav-normal"> Dropdowns </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/forms/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> F </span>
                  <span class="sidenav-normal"> Forms </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/modal/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> M </span>
                  <span class="sidenav-normal"> Modal </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/navs/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> N </span>
                  <span class="sidenav-normal"> Navs </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/navbar/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> N </span>
                  <span class="sidenav-normal"> Navbar </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/pagination/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Pagination </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/popovers/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Popovers </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/progress/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> P </span>
                  <span class="sidenav-normal"> Progress </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/spinners/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> S </span>
                  <span class="sidenav-normal"> Spinners </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/tables/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> T </span>
                  <span class="sidenav-normal"> Tables </span>
                </a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="https://www.creative-tim.com/learning-lab/bootstrap/tooltips/argon-dashboard" target="_blank">
                  <span class="sidenav-mini-icon"> T </span>
                  <span class="sidenav-normal"> Tooltips </span>
                </a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="https://github.com/creativetimofficial/ct-argon-dashboard-pro/blob/main/CHANGELOG.md" target="_blank">
            <div class="icon icon-shape icon-sm text-center  me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-align-left-2 text-dark text-sm"></i>
            </div>
            <span class="nav-link-text ms-1">Changelog</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="sidenav-footer mx-3 my-3">
      <div class="card card-plain shadow-none" id="sidenavCard">
        <img class="w-60 mx-auto" src="${path}/assets/img/illustrations/icon-documentation.svg" alt="sidebar_illustration">
        <div class="card-body text-center p-3 w-100 pt-0">
          <div class="docs-info">
            <h6 class="mb-0">Need help?</h6>
            <p class="text-xs font-weight-bold mb-0">Please check our docs</p>
          </div>
        </div>
      </div>
      <a href="https://www.creative-tim.com/learning-lab/bootstrap/overview/argon-dashboard" target="_blank" class="btn btn-dark btn-sm w-100 mb-3">Documentation</a>
    </div>
  </aside>
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg  px-0 mx-4 shadow-none border-radius-xl z-index-sticky " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm">
              <a class="text-white" href="javascript:;">
                <i class="ni ni-box-2"></i>
              </a>
            </li>
            <li class="breadcrumb-item text-sm text-white"><a class="opacity-5 text-white" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Edit Product</li>
          </ol>
          <h6 class="font-weight-bolder mb-0 text-white">Edit Product</h6>
        </nav>
        <div class="sidenav-toggler sidenav-toggler-inner d-xl-block d-none ">
          <a href="javascript:;" class="nav-link p-0">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line bg-white"></i>
              <i class="sidenav-toggler-line bg-white"></i>
              <i class="sidenav-toggler-line bg-white"></i>
            </div>
          </a>
        </div>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="${path}/pages/authentication/signin/illustration.html" class="nav-link text-white font-weight-bold px-0" target="_blank">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Sign In</span>
              </a>
            </li>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${path}/assets/img/team-2.jpg" class="avatar avatar-sm  me-3 " alt="user image">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${path}/assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 " alt="logo spotify">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g transform="translate(1716.000000, 291.000000)">
                                <g transform="translate(453.000000, 454.000000)">
                                  <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                  <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          Payment successfully completed
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          2 days
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-lg-6">
          <h4 class="text-white">Make the changes below</h4>
          <p class="text-white opacity-8">We’re constantly trying to express ourselves and actualize our dreams. If you have the opportunity to play.</p>
        </div>
        <div class="col-lg-6 text-right d-flex flex-column justify-content-center">
          <button type="button" class="btn btn-outline-white mb-0 ms-lg-auto me-lg-0 me-auto mt-lg-0 mt-2">Save</button>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-4">
          <div class="card h-100">
            <div class="card-body">
              <h5 class="font-weight-bolder">Product Image</h5>
              <div class="row">
                <div class="col-12">
                  <img class="w-100 border-radius-lg shadow-lg mt-3" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-page.jpg" alt="product_image">
                </div>
                <div class="col-12 mt-5">
                  <div class="d-flex">
                    <button class="btn btn-primary btn-sm mb-0 me-2" type="button" name="button">Edit</button>
                    <button class="btn btn-outline-dark btn-sm mb-0" type="button" name="button">Remove</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-8 mt-lg-0 mt-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder">Product Information</h5>
              <div class="row">
                <div class="col-12 col-sm-6">
                  <label>Name</label>
                  <input class="form-control" type="text" value="Minimal Bar Stool" />
                </div>
                <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                  <label>Weight</label>
                  <input class="form-control" type="number" value="2" />
                </div>
              </div>
              <div class="row">
                <div class="col-3">
                  <label class="mt-4">Collection</label>
                  <input class="form-control" type="text" value="Summer" />
                </div>
                <div class="col-3">
                  <label class="mt-4">Price</label>
                  <input class="form-control" type="text" value="$90" />
                </div>
                <div class="col-3">
                  <label class="mt-4">Quantity</label>
                  <input class="form-control" type="number" value="50" />
                </div>
              </div>
              <div class="row">
                <div class="col-sm-6">
                  <label class="mt-4">Description</label>
                  <p class="form-text text-muted text-xs ms-1 d-inline">
                    (optional)
                  </p>
                  <div id="edit-deschiption-edit" class="h-50">
                    Long sleeves black denim jacket with a twisted design. Contrast stitching. Button up closure. White arrow prints on the back.
                  </div>
                </div>
                <div class="col-sm-6">
                  <label class="mt-4">Category</label>
                  <select class="form-control" name="choices-category" id="choices-category-edit">
                    <option value="Choice 1" selected="">Furniture</option>
                    <option value="Choice 2">Real Estate</option>
                    <option value="Choice 3">Electronics</option>
                    <option value="Choice 4">Clothing</option>
                    <option value="Choice 5">Others</option>
                  </select>
                  <label>Color</label>
                  <select class="form-control" name="choices-color" id="choices-color-edit">
                    <option value="Choice 1" selected="">Black</option>
                    <option value="Choice 2">White</option>
                    <option value="Choice 3">Blue</option>
                    <option value="Choice 4">Orange</option>
                    <option value="Choice 5">Green</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-sm-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder">Socials</h5>
              <label>Shoppify Handle</label>
              <input class="form-control" type="text" value="@argon" />
              <label class="mt-4">Facebook Account</label>
              <input class="form-control" type="text" value="https://" />
              <label class="mt-4">Instagram Account</label>
              <input class="form-control" type="text" value="https://" />
            </div>
          </div>
        </div>
        <div class="col-sm-8 mt-sm-0 mt-4">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <h5 class="font-weight-bolder">Pricing</h5>
                <div class="col-3">
                  <label>Price</label>
                  <input class="form-control" type="number" value="99.00" />
                </div>
                <div class="col-4">
                  <label>Currency</label>
                  <select class="form-control" name="choices-sizes" id="choices-currency-edit">
                    <option value="Choice 1" selected="">USD</option>
                    <option value="Choice 2">EUR</option>
                    <option value="Choice 3">GBP</option>
                    <option value="Choice 4">CNY</option>
                    <option value="Choice 5">INR</option>
                    <option value="Choice 6">BTC</option>
                  </select>
                </div>
                <div class="col-5">
                  <label>SKU</label>
                  <input class="form-control" type="text" value="71283476591" />
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <label class="mt-4">Tags</label>
                  <select class="form-control" name="choices-tags" id="choices-tags-edit" multiple>
                    <option value="Choice 1" selected>In Stock</option>
                    <option value="Choice 2">Out of Stock</option>
                    <option value="Choice 3">Sale</option>
                    <option value="Choice 4">Black Friday</option>
                  </select>
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
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/quill.min.js"></script>
  <script>
    if (document.getElementById('edit-deschiption-edit')) {
      var quill = new Quill('#edit-deschiption-edit', {
        theme: 'snow' // Specify theme in configuration
      });
    };

    if (document.getElementById('choices-category-edit')) {
      var element = document.getElementById('choices-category-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-color-edit')) {
      var element = document.getElementById('choices-color-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-currency-edit')) {
      var element = document.getElementById('choices-currency-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-tags-edit')) {
      var tags = document.getElementById('choices-tags-edit');
      const examples = new Choices(tags, {
        removeItemButton: true
      });

      examples.setChoices(
        [{
            value: 'One',
            label: 'Expired',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Out of Stock',
            selected: true
          }
        ],
        'value',
        'label',
        false,
      );
    }
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