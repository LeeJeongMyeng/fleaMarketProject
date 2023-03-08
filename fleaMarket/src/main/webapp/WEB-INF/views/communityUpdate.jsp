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
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="${path}/resource/js/Req4002/room.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".ql-editor").append("${boardInfo.content}") // 내용값 넣기(value)
		console.log($('#edit-deschiption-edit .ql-editor').text())
		
		$("#update").click(function(){
		  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
		  var expeditor=$('#edit-deschiption-edit .ql-editor').html()
		  console.log(expeditor)
		  $('input[name=content]').val(expeditor);
		 $("form").submit()
  		})
  		
  		var imgCnt = "${boardImgArr}"
  		//alert(arrFun(imgCnt))
  		
  		
  		/* $("input[type='file']").click(function(){
  			
  			
  		}) */
  		
  		
	});
	function updateImpossible(what){
		if(what==="작성자"){
			alert("[안내메시지]작성자는 변경이 불가합니다.")
		}else{
			alert("[안내메시지]카테고리는 변경이 불가합니다.")
		}
	}
	
	function clickImgHidden(){
		$(this).hide()
	}
	
</script>
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
  <link href="${path}/resource/css/Community/CommunityBoard.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show bg-gray-100">
	<jsp:include page="header.jsp"></jsp:include>
	<form method="get" enctype="multipart/form-data" ><!-- action="${path}/communityUpdate.do" -->
	  <input type="hidden" name="communitynumber" value="${boardInfo.communitynumber}">
      <div class="row mt-4" >
         <div class="card h-100" style="margin-top:8%;">
           <div class="card-body">
             <h5 class="font-weight-bolder" style="text-align:center; font-size:20pt;"><span>커뮤니티(조건걸어서 무슨커뮤니티인지 넣기)</span> 게시글 변경</h5>
             <div class="row">
               <div class="col-12">
                 <div class="card-body">
		             <div class="row" style="margin-left:30%;">
			              	<label for="fileClick1" style="border:1px solid black" >
			                  <img id="bigphoto" class="border-radius-lg shadow-lg ms-5" src="${path}/resource/community/${boardImg1}" 
			                  			onclick="clickImgHidden(this)" alt="이미지없음." style="width:auto; height:400px;">
			                </label>
		                 	<input type="file" name="updateFile" id="fileClick1" value="${boardImg1}" hidden multiple>
		                  
		                  <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery">
		                    
			                    <figure class="ms-2 me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
			                        <c:forEach var="boardImgs" items="${boardImgArr}">
				                       	<label for="fileClick2" style="border:1px solid black" >
				                        	<img id="smallphoto" class="w-100 min-height-100 max-height-100 border-radius-lg shadow ms-2" 
				                        		 src="${path}/resource/community/${boardImgs}" onclick="clickImgHidden()" alt="이미지 없음"/>
											<!-- 이미지 클릭 시, img 히든처리, 사진 변경 기능넣기 -->
											<input type="file" name="updateFile" value="${boardImgs}" hidden multiple>
				                   		</label>
				                   		
			                   		</c:forEach>
			                    </figure>
		                    
		                  </div>
		             </div>
           		</div>
        	</div>
        <div class="row mt-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder"></h5>
              <div class="row" style="--bs-gutter-x:0;">
                <div class="col-12 col-sm-6">
                   <label class="postUpdateTitle" style="width:90%;">카테고리</label>
	               <input class="form-control" onclick="updateImpossible('카테고리')" value="${boardInfo.category}" type="text" readonly style="width:90%;"/>
                </div>
                <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                  <label class="postUpdateTitle">작성자</label>
                  <input class="form-control" onclick="updateImpossible('작성자')" value="yujin@gmail.com" type="text" readonly style="width:90%;"/><!-- ${Login.email} -->
                </div>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">제목</label>
                <input name="title" class="form-control" type="text" value="${boardInfo.title}"/>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">내용</label>
                <div id="edit-deschiption-edit" style="height:500px;">
                	<div class=".ql-editor"></div>
                </div>
                <input type="hidden" id="contentInput" name="content"/>
              </div>
            <div class="row" style="--bs-gutter-x:0;">
               <label class="mt-4 postUpdateTitle">태그(#)</label><!-- 선택된값을 select되어있게 설정해야함..  -->
                <select class="form-control" name="hashtag" id="choices-tags-edit" multiple>
                  <option selected>In Stock</option><!-- 태그 테이블에서 콤보박스 생성  -->
                </select>
            </div>
          </div>
             <button class="btn btn-primary" type="button" id="update" style="margin-top:2%; margin-left:28%; width:50%; font-size:18pt;">수정</button>
        </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  </form>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
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
  <script src="${path}/resource/js/Req4002/InsertContent.js"></script>
</body>
</html>