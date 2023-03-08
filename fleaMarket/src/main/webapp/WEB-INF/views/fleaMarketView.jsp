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
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    CONTIGO 플리마켓
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
  <!-- 카카오맵 api -->
  <script type="text/javascript"
	   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91e22fb67ec6ac7eabb75fa26b7d3d4d&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
	   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91e22fb67ec6ac7eabb75fa26b7d3d4d"></script>
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"
   integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
   crossorigin="anonymous"></script>
  <script type="text/javascript">
   var sessEmail = "${Login.email}"
   var writerEmail = "${fleamarket.email}"
   
   $(document).ready(function(){   
	   	var msg = "${msg}"
	   	// msg 확인 필요
		if(msg!=""){
			alert(msg+"\n 조회 화면으로 이동합니다")
		}
		$("[name=regBtn]").click(function(){
			console.log(sessEmail)
			/*
			if(sessEmail==""){
				alert("로그인을 하여야 합니다\n로그인 화면이동");
				location.href="${path}/SignIn.do"
			}
			*/
			$("#frmNofile").submit()
		})
	});
	/*
   function goDetail(postingNumber){
	   $("#frmNofile").submit(postingNumber)
	}
  	$("#regBtn").click(function(){
		$("#frmNofile").submit()
	})
	*/
	function uptBtn(postingNumber){
		location.href="${path}/FleaMarketUptPage.do?postingNumber="+postingNumber
	}	
	function delBtn(postingNumber){
		location.href="${path}/FleaMarketDel.do?postingNumber="+postingNumber
	}
  </script>
</head>
<%@include file="header.jsp" %>
<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>

  <main class="main-content position-relative border-radius-lg ">

    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body" style="margin-top:80px">
              <h5 class="mb-4">플리마켓</h5>
              <div class="row">
                <div class="col-xl-5 col-lg-6 text-center">
                <!-- 첫번째 이미지 -->
                  <c:forEach var="img" items="${imgfiles}" varStatus="status">
                    <c:choose>
	                  	<c:when test="${status.first == true}">
			                  <img class="w-100 border-radius-lg shadow-lg mx-auto" src="${path}/resource/img/fleaMarket/${img}" alt="market">
			                  <div class="my-gallery d-flex justify-content-center mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery">
						</c:when>
	                    <c:otherwise>
		                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		                      <a href="${path}/resource/img/fleaMarket/${img}" itemprop="contentUrl" data-size="500x600">
		                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="${path}/resource/img/fleaMarket/${img}" itemprop="thumbnail" alt="Image description" />
		                      </a>
		                    </figure>
	                   </c:otherwise>
                    </c:choose>
                  </c:forEach>
                  </div>
                  <!-- Root element of PhotoSwipe. Must have class pswp. -->
                  <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                    <!-- Background of PhotoSwipe.
						It's a separate element, as animating opacity is faster than rgba(). -->
                    <div class="pswp__bg"></div>
                    <!-- Slides wrapper with overflow:hidden. -->
                    <div class="pswp__scroll-wrap">
                      <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
                      <!-- don't modify these 3 pswp__item elements, data is added later on. -->
                      <div class="pswp__container">
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                      </div>
                      <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                      <div class="pswp__ui pswp__ui--hidden">
                        <div class="pswp__top-bar">
                          <!--  Controls are self-explanatory. Order can be changed. -->
                          <div class="pswp__counter"></div>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--close">Close (Esc)</button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--fs">Fullscreen</button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--arrow--left">Prev
                          </button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--arrow--right">Next
                          </button>
                          <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                          <!-- element will get class pswp__preloader--active when preloader is running -->
                          <div class="pswp__preloader">
                            <div class="pswp__preloader__icn">
                              <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                          <div class="pswp__share-tooltip"></div>
                        </div>
                        <div class="pswp__caption">
                          <div class="pswp__caption__center"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-5 mx-auto">
                  <input type="hidden" name="writer" value="${fleamarket.email}">
                  <h3 class="mt-lg-0 mt-4">${fleamarket.title}</h3>
                  <div class="rating">
                    <i class="fas" aria-hidden="true">${fleamarket.openDate} - ${fleamarket.closeDate}</i>
                  </div>
                  <br>
                  <h6 class="mb-0 mt-3">모집기간</h6>
                  <h5>${fleamarket.recruitmentStartDate} - ${fleamarket.recruitmentEndDate}</h5>
                  <span class="badge badge-success">모집중</span>
                  <p  style="margin-top:15px;">
                  ${fleamarket.content}
                  </p>
                  <div class="row mt-4">
                  	<!-- gps -->
                     <div class="map_wrap">
                        <div id="map"
                           style="width: 580px; height: 300px; position: relative; overflow: hidden;"></div>
                        <div class="hAddr">
                           <span>${fleamarket.address}</span>
                           <!-- 지도에서 선택한 주소 표시
                           <span id="centerAddr2"></span>
                           <span id="centerAddr3"></span>
                            -->
                        </div>
                     </div>
                  </div>
                    <div class="col-12"> <!-- 첨부파일 -->
                      <label>파일 다운로드</label>
                      <c:forEach var="noimg" items="${noimgfiles}">
                      
						<form action="downloadFFile.do" method="get">
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
									 	<input type="hidden" name="filename"  value="${noimg}">
										<input value="${noimg}" type="submit" class="form-control">
									 </div>
								</div>
							</div>
						</form>
					  </c:forEach>
                    </div>
                    <c:choose>
	                    <c:when test="${Login.email != fleamarket.email}">	
							<div class="row mt-4">
			                    <div class="col-lg-5 ms-auto">
			                      <button class="btn btn-primary mb-0 mt-lg-auto w-100" type="button" name="appBtn" data-bs-toggle="modal" data-bs-target="#jkanban-info-modal-nofile">신청하기</button>
			                    </div>
			                </div>
			            </c:when>
		            	<c:otherwise>
			            	<div class="row mt-4">
			                    <div class="row ms-auto text-end">
				                    <div class="col-6"></div>
			                    	<div class="col-3">  
			                    	   <button onclick="uptBtn(${fleamarket.postingNumber})" class="btn btn-link text-dark px-3 mb-0">
			                    	  <i class="fas fa-pencil-alt text-dark me-2" aria-hidden="true"></i>수정</button>
									</div>
									<div class="col-3">
				                      <button onclick="delBtn(${fleamarket.postingNumber})" class="btn btn-link text-danger text-gradient px-3 mb-0">
				                      <i class="far fa-trash-alt me-2"></i>삭제</button>
			                    	</div>
								</div>	                    
		                    </div>
						</c:otherwise>
					</c:choose>
                  </div>
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
    </div>
  </div>
  
  <!-- 신청하기 모달창 (양식 O) 
  <div class="modal fade" id="jkanban-info-modal" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청하기</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          
          <div class="form-group">
          	<label>파일 첨부</label> 
          	<form id="frmNofile" method="post" action="${path}/insApp.do" enctype="multipart/form-data">  
          		<div class="row mt-3">
	              <div class="col-2" style="height:120px;">
	                <input type="file" name="appFile" class="form-control" style="width:230px"
	                      id="appFile" multiple>
	                 <div id="image_container"></div>
	              </div>
	            </div>
          	<div class="text-end">
	           	<input type="hidden" name="postingNumber" value="${fleamarket.postingNumber}"/>
	           	<input type="hidden" name="email" value="${Login.email}"/>
	            <button name="regBtn" class="m-1 btn btn-primary" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
	              확인
	            </button>
	            <button class="m-1 btn btn-secondary" data-target="#jkanban-info-modal" data-bs-dismiss="modal">
	              취소
	            </button>
	          </form>
	          </div>
		   </div>
        </div>
      </div>
    </div>
   </div>
  -->
  <!-- 신청하기 모달창 (양식 X) -->  
  <div class="modal fade" id="jkanban-info-modal-nofile" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청하기</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group text-center">신청하시겠습니까?</div>
          <form id="frmNofile" method="post" action="${path}/insApp.do" enctype="multipart/form-data">
          	<label>파일 첨부</label>
         	<div class="row mt-3">
              <div class="col-2" style="height:120px;">
                <input type="file" name="appFile" class="form-control" style="width:230px" id="appFile" multiple>
                 <div id="image_container"></div>
              </div>
            </div>
            <input type="hidden" name="postingNumber" value="${fleamarket.postingNumber}"/>
	        <input type="hidden" name="email" value="${Login.email}"/>
          	<div class="text-end">
	            <button name="regBtn" class="m-1 btn btn-primary" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
	              확인
	            </button>
	            <button type="button" class="m-1 btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">
	              취소
	            </button>
		   	 </div>
		   </form>
         </div>
      </div>
    </div>
  </div>

  
  <!-- 신청 완료 알림 모달창 (양식 X) -->
  <div class="modal fade" id="jkanban-info-modal-done" style="display: none" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청하기</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          <div class="form-group text-center">신청되었습니다.</div>
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
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script> <!-- file box -->
  <script src="${path}/assets/js/plugins/photoswipe.min.js"></script>
  <script src="${path}/assets/js/plugins/photoswipe-ui-default.min.js"></script>
  <script>

    // Gallery Carousel
    if (document.getElementById('products-carousel')) {
      var myCarousel = document.querySelector('#products-carousel')
      var carousel = new bootstrap.Carousel(myCarousel)
    }


    // Products gallery

    var initPhotoSwipeFromDOM = function(gallerySelector) {

      // parse slide data (url, title, size ...) from DOM elements
      // (children of gallerySelector)
      var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
          numNodes = thumbElements.length,
          items = [],
          figureEl,
          linkEl,
          size,
          item;

        for (var i = 0; i < numNodes; i++) {

          figureEl = thumbElements[i]; // <figure> element
          // include only element nodes
          if (figureEl.nodeType !== 1) {
            continue;
          }

          linkEl = figureEl.children[0]; // <a> element

          size = linkEl.getAttribute('data-size').split('x');

          // create slide object
          item = {
            src: linkEl.getAttribute('href'),
            w: parseInt(size[0], 10),
            h: parseInt(size[1], 10)
          };

          if (figureEl.children.length > 1) {
            // <figcaption> content
            item.title = figureEl.children[1].innerHTML;
          }

          if (linkEl.children.length > 0) {
            // <img> thumbnail element, retrieving thumbnail url
            item.msrc = linkEl.children[0].getAttribute('src');
          }

          item.el = figureEl; // save link to element for getThumbBoundsFn
          items.push(item);
        }

        return items;
      };

      // find nearest parent element
      var closest = function closest(el, fn) {
        return el && (fn(el) ? el : closest(el.parentNode, fn));
      };

      // triggers when user clicks on thumbnail
      var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
          return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if (!clickedListItem) {
          return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
          childNodes = clickedListItem.parentNode.childNodes,
          numChildNodes = childNodes.length,
          nodeIndex = 0,
          index;

        for (var i = 0; i < numChildNodes; i++) {
          if (childNodes[i].nodeType !== 1) {
            continue;
          }

          if (childNodes[i] === clickedListItem) {
            index = nodeIndex;
            break;
          }
          nodeIndex++;
        }



        if (index >= 0) {
          // open PhotoSwipe if valid index found
          openPhotoSwipe(index, clickedGallery);
        }
        return false;
      };

      // parse picture index and gallery index from URL (#&pid=1&gid=2)
      var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
          params = {};

        if (hash.length < 5) {
          return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
          if (!vars[i]) {
            continue;
          }
          var pair = vars[i].split('=');
          if (pair.length < 2) {
            continue;
          }
          params[pair[0]] = pair[1];
        }

        if (params.gid) {
          params.gid = parseInt(params.gid, 10);
        }

        return params;
      };

      var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
          gallery,
          options,
          items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)
        options = {

          // define gallery index (for URL)
          galleryUID: galleryElement.getAttribute('data-pswp-uid'),

          getThumbBoundsFn: function(index) {
            // See Options -> getThumbBoundsFn section of documentation for more info
            var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
              pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
              rect = thumbnail.getBoundingClientRect();

            return {
              x: rect.left,
              y: rect.top + pageYScroll,
              w: rect.width
            };
          }

        };

        // PhotoSwipe opened from URL
        if (fromURL) {
          if (options.galleryPIDs) {
            // parse real index when custom PIDs are used
            // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
            for (var j = 0; j < items.length; j++) {
              if (items[j].pid == index) {
                options.index = j;
                break;
              }
            }
          } else {
            // in URL indexes start from 1
            options.index = parseInt(index, 10) - 1;
          }
        } else {
          options.index = parseInt(index, 10);
        }

        // exit if index not found
        if (isNaN(options.index)) {
          return;
        }

        if (disableAnimation) {
          options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
      };

      // loop through all gallery elements and bind events
      var galleryElements = document.querySelectorAll(gallerySelector);

      for (var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i + 1);
        galleryElements[i].onclick = onThumbnailsClick;
      }

      // Parse URL and open gallery if it contains #&pid=3&gid=1
      var hashData = photoswipeParseHash();
      if (hashData.pid && hashData.gid) {
        openPhotoSwipe(hashData.pid, galleryElements[hashData.gid - 1], true, true);
      }
    };

    // execute above function
    initPhotoSwipeFromDOM('.my-gallery');
    
    // 모달창 확인 버튼 클릭 - 수정 필요...
    var updateTask = document.getElementById("jkanban-update-task");
    updateTask.addEventListener("click", function() {
      let jkanbanInfoModalTaskId = document.querySelector(
        "#jkanban-info-modal #productImg"
      );
      KanbanTest.replaceElement(jkanbanInfoModalTaskId.value);
      jkanbanInfoModalTaskId.value = jkanbanInfoModalTaskId.value;
      document.querySelector('#jkanban-info-modal').classList.remove('show');
      document.querySelector('body').classList.remove('modal-open');
      document.querySelector('.modal-backdrop').remove();


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
<script>
	//gps 
	var container = document.getElementById('map');// 지도를 표시할 div 
	var options = {
	   center: new kakao.maps.LatLng(33.450701, 126.570667),// 지도의 중심좌표
	   level: 3 // 지도의 확대 레벨
	};
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(container, options);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); 
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	function searchAddrFromCoords(coords, callback) {// 좌표로 주소 정보를 요청합니다
	   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {// 좌표로 상세 주소 정보를 요청합니다
	   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	   
	}
	
	
	//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	   if (status === kakao.maps.services.Status.OK) {
	     var infoDiv = document.getElementById('centerAddr');
	
	       for(var i = 0; i < result.length; i++) {
	           // 행정동의 region_type 값은 'H' 이므로
	           if (result[i].region_type === 'H') {
	               infoDiv.innerHTML = result[i].address_name;
	               break;
	           }
	       }
	   }    
	} 
	
	/* function serar */
	//동에 대한 default 
	geocoder.addressSearch('${fleamarket.address}', function(result, status) {
		/*
		지도에서 선택한 주소 표시
	   var infoDiv2 = document.getElementById('centerAddr2'); 
	   var infoDiv3 = document.getElementById('centerAddr3'); 
	   */
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	           content: '<div style="width:150px;text-align:center;padding:6px 0;">요기!</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        
	        var infoDiv = document.getElementById('centerAddr'); 
	 
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {         
	                infoDiv.innerHTML = result[i].address_name;       
	                break;
	            }
	        }
	    }
	     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	           searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	               if (status === kakao.maps.services.Status.OK) {
	                   var detailAddr2 = !!result[0].road_address ? result[0].road_address.address_name : '';
	                   detailAddr3 = result[0].address.address_name;
	                        
	                         
	                      /* console.log("도로명주소:"+result[0].road_address.address_name)
	                      console.log("지번주소:"+result[0].address.address_name) */
	                   
	                   var content = '<div class="bAddr">' +
	                                   '<span class="title">주소정보</span>' + 
	                                   detailAddr2 + 
	                               '</div>';
	
	                   // 마커를 클릭한 위치에 표시합니다 
	                   marker.setPosition(mouseEvent.latLng);
	                   marker.setMap(map);
	
	                   // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	                   infowindow.setContent(content);
	                   infowindow.open(map, marker);
	                   infoDiv=detailAddr2;
	                   infoDiv2.innerHTML=detailAddr2;
	                   infoDiv3.innerHTML=detailAddr3;
	                   
	                   // 지도 선택한 부분 input 들어감 
	                   var aform = document.querySelector("#aform")
	                   aform.address.value = document.getElementById("centerAddr3").innerText;
	              /*      var address =$("#centerAddr3").val()
	                   $("input[name=addressval]").val()=address; */
	                   //aform.addressval2.value = document.getElementById("centerAddr3").innerText;
	                   
	               }   
	           });
	       });
	});  
</script>
</html>