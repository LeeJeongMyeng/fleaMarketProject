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
	$(document).ready(function(e){

		 // 내용값 넣기(value)
		$(".ql-editor").append("${boardInfo.content}")
		console.log($('#edit-deschiption-edit .ql-editor').text())
		// 글자수 갯수
		$("#edit-deschiption-edit").keyup(function(){
			$("#textCnt").text(expeditor.text().length)
		})
		var expeditor=$('#edit-deschiption-edit .ql-editor')
		$("#update").click(function(){
			// 유효성체크
			  if($("input[name='title']").val()==""){
				  alert("[안내메시지] 제목을 입력하여야 게시글 등록이 가능합니다.")
				 contentfocus("title")
			  }else if($("input[name='title']").val().length>150){
				  alert("[안내메시지] 제목은 150자 이하로 입력하셔야 게시글 등록이 가능합니다.")
				  contentfocus("title")
			  }else if(expeditor.text().length<10){
				 alert("[안내메시지] 내용을 10자 이상 작성해주셔야 게시글 등록이 가능합니다.")
				 contentfocus("content")
			  }else if(expeditor.text().length>600){
				 alert("[안내메시지] 내용을 600자 이하로 작성해주셔야 게시글 등록이 가능합니다.")
				 contentfocus("content")
			  }else{
				  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
				  $('input[name=content]').val(expeditor.html());
				  $("form").submit()
			  }
  		})
  		
  		// 큰사진 클릭 시, file값 클릭
  		$("#bigphoto").click(function(){
  			$("#fileClick6").click()
  			imgView("img6")
  			$("#fileClick6").change(function(){
  				// 큰사진 숨기기
  				$("#bigphoto").hide()
  			})
  		})
  		// 작은사진
  		$("#imgTab td").eq(0).click(function(){
  			$("#fileClick1").click()
  			imgView("img1")
  			$("#fileClick1").change(function(){
  				$(".regimg").eq(1).hide()
  			})
  		})
  		$("#imgTab td").eq(1).click(function(){
  			$("#fileClick2").click()
  			imgView("img2")
  			$("#fileClick2").change(function(){
  				$(".regimg").eq(2).hide()
  			})
  		})
  		$("#imgTab td").eq(2).click(function(){
  			$("#fileClick3").click()
  			imgView("img3")
  			$("#fileClick3").change(function(){
  				$(".regimg").eq(3).hide()
  			})
  		})
  		$("#imgTab td").eq(3).click(function(){
  			$("#fileClick4").click()
  			imgView("img4")
  			$("#fileClick4").change(function(){
  				$(".regimg").eq(4).hide()
  			})
  		})
  		$("#imgTab td").eq(4).click(function(){
  			$("#fileClick5").click()
  			imgView("img5")
  			$("#fileClick5").change(function(){
  				$(".regimg").eq(5).hide()
  			})
  		})
  		// 이미지 미리보기 기능
	  	function imgView(clickImg){
			$("input[type='file']").change(function(e){
			      var files = e.target.files;
			      var arr =Array.prototype.slice.call(files);
			      
			      //업로드 가능 파일인지 체크
			      for(var i=0;i<files.length;i++){
			        if(!checkExtension(files[i].name,files[i].size)){
			          return false;
			        }
			      }
			      preview(files,clickImg);
			});//file change
		}
  	
	  // 사진 용량에 따른 유효성체크
	  function checkExtension(fileName,fileSize){

	      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      var maxSize = 20971520;  //20MB
	      
	      if(fileSize >= maxSize){
	        alert('파일 사이즈 초과');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      
	      if(regex.test(fileName)){
	        alert('[안내메시지]업로드 불가능한 파일이 있습니다.');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      return true;
	    }
	  	//이미지 넣기
	  	function preview(arr, clickImg){
	  		//function(f){
	  		arr.forEach(function(f){
	        //파일명이 길면 파일명...으로 처리
	        var fileName = f.name;
	        if(fileName.length > 10){
	          fileName = fileName.substring(0,7)+"...";
	        }
	        //div에 이미지 추가
	        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
	        str += '<span>'+fileName+'</span><br>';
	        //이미지 파일 미리보기
	        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			
				if(f.type.match('image.*')){
	          		reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		            	str += '<img src="'+e.target.result+'" title="'+f.name+'" width=auto height=100 />';
		            	str += '</li></div>';
		            	$(str).appendTo('#preview1');
		            	if(clickImg=="img1"){
		           			$(str).appendTo('#preview1');
		            	}else if(clickImg=="img2"){
		            		$(str).appendTo('#preview2');
		    	  		}else if(clickImg=="img3"){
		    	  			$(str).appendTo('#preview3');
		    	  		}else if(clickImg=="img4"){
		    	  			$(str).appendTo('#preview4');
		    	  		}else if(clickImg=="img5"){
		    	  			$(str).appendTo('#preview5');
		    	  		}
			    	 }
		          reader.readAsDataURL(f);
		        }else{
		          	str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		          	
		          	if(clickImg=="img1"){
	           			 $(str).appendTo('#preview1');
	            	}else if(clickImg=="img2"){
	            		 $(str).appendTo('#preview2');
	    	  		}else if(clickImg=="img3"){
	    	  			 $(str).appendTo('#preview3');
	    	  		}else if(clickImg=="img4"){
	    	  			 $(str).appendTo('#preview4');
	    	  		}else if(clickImg=="img5"){
	    	  			 $(str).appendTo('#preview5');
	    	  		}
		        }
	      });//arr.forEach
	    }
	});
	function updateImpossible(what){
		if(what==="작성자"){
			alert("[안내메시지]작성자는 변경이 불가합니다.")
		}else{
			alert("[안내메시지]카테고리는 변경이 불가합니다.")
		}
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
  <script src="${path}/resource/js/Req4002/commonfunction.js"></script>
</head>

<body class="g-sidenav-show bg-gray-100">
	<jsp:include page="header.jsp"></jsp:include>
	<form method="post" enctype="multipart/form-data" action="${path}/communityUpdate.do"><!-- action="${path}/communityUpdate.do" -->
	  <input type="hidden" name="communitynumber" value="${boardInfo.getCommunitynumber()}">
      <div class="row mt-4" >
         <div class="card h-100" style="margin-top:8%;">
           <div class="card-body">
             <h5 class="font-weight-bolder" style="text-align:center; font-size:20pt;"><span>커뮤니티(조건걸어서 무슨커뮤니티인지 넣기)</span> 게시글 변경</h5>
             <div class="row">
               <div class="col-12">
                 <div class="card-body">
		             <div class="row" style="margin-left:30%;">
			              <!-- <label style="border:1px solid black" >  -->
				               <img id="bigphoto" class="border-radius-lg shadow-lg ms-5 regimg" src="${path}/resource/community/${boardImgArr[0]}" 
				                  			alt="이미지 없음" style="width:auto; height:400px;">
				                <span id="noImg" class="ms-5" style="color:red;"></span>
				                
			              <!--  </label> -->
		                  
		                 <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery">
			                    <table class="ms-4" id="imgTab">
			                    	<tbody>
				                    	<tr>
					                    	<td style="border:30px solid white;">
					                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
								                        		 src="${path}/resource/community/${boardImgArr[1]}" alt="이미지 없음" style="width:auto; height:150px;" />
								           		<div id="preview1"></div>
								           	</td>
					                    	<td style="border:30px solid white;">
					                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
								                        		 src="${path}/resource/community/${boardImgArr[2]}" alt="이미지 없음" style="width:auto; height:150px;" />
								           		<div id="preview2"></div>
								           	</td>
					                    	<td style="border:30px solid white;">
					                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
								                        		 src="${path}/resource/community/${boardImgArr[3]}" alt="이미지 없음" style="width:auto; height:150px;" />
								           		<div id="preview3"></div>
								           	</td>
					                    	<td style="border:30px solid white;">
					                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
								                        		 src="${path}/resource/community/${boardImgArr[4]}" alt="이미지 없음" style="width:auto; height:150px;" />
								           		<div id="preview4"></div>
								           	</td>
					                    	<td style="border:30px solid white;">
					                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
								                        		 src="${path}/resource/community/${boardImgArr[5]}" alt="이미지 없음" style="width:auto; height:150px;" />
								           		<div id="preview5"></div>
								           	</td>
					                    </tr>
					                    <tr>
					                    	<td colspan="5" style="color:red; text-align:center;">※ 사진을 클릭하시면 수정이 가능합니다.</td>
					                    </tr>
				                    </tbody>
			                    </table>
		                  </div>
		             </div>
           		</div>
        	</div>
        	  		<input type="file" name="updateFile" id="fileClick1" multiple>
                	<input type="file" name="updateFile" id="fileClick2" multiple>
                	<input type="file" name="updateFile" id="fileClick3" multiple>
                	<input type="file" name="updateFile" id="fileClick4" multiple>
                	<input type="file" name="updateFile" id="fileClick5" multiple>
                	<input type="file" name="updateFile" id="fileClick6" multiple>
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
                <label class="mt-4 postUpdateTitle">내용
                	<span style="font-color:grey; font-weight:normal; font-size:12pt;">(<span id="textCnt" style="color:red"></span> / 600자)</span></label>
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