

$(document).ready(function() {
	
//사용 이유 맞는곳에다가 자신 태그 추가하셈	
 $("#qnafiles").on("change", handleImgsFilesSelect); //이미지만 올릴친구
 $("#expfile").on("change", handleImgsFilesSelect2); //이미지랑 서류확장자 올릴친구
});





//확장자 검사1(이미지만)
function Checkfiles1(fileName) {
    var extension1 = ['gif', 'jpg', 'jpeg', 'png', 'bmp' ,'ico', 'apng','jfif'];
    return checkfile(extension1,fileName);
}
//확장자검사2(이미지+파일)
function Checkfiles2(fileName) {
    var extension2 = ['gif', 'jpg', 'jpeg', 'png', 'bmp' ,'ico', 'apng','jfif','.doc','docx','ppt','pptx','xls','pdf','hwp','txt'];
   //들어온 파일이름의 끝자리(확장자부분)를 소문자로 변환
    return checkfile(extension2,fileName);
}
//체크해주는 친구!
function checkfile(extension,fileName){
	 var result = false;
	 var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	    if(!ext){ return result; }
	    ext = ext.toLocaleLowerCase();
	    extension.forEach(function(element) {
	        if(ext == element){
	            result = true;
	        }
	    });
	 return result;
}



//----------이미지 확장자만 검사하고 올리는애-----------------------------------------------------------
function handleImgsFilesSelect(e) {
	const dataTransfer = new DataTransfer();// dataTransfer (Array -> FileList) 배열을 다시 파일화 시키는 친구!
	$("#imgs_wrap").empty()
	var filetag = $(this)
	var filetagid = "#"+$(this).attr('id')
    //var files = e.target.files; //이벤트로 넘어온 file친구들을 담아줌
    console.log($(this).attr('id'))
    var fileArr = Array.from(e.target.files);// 이벤트로 넘어온 파일들을 배열형식으로 담음(FileList -> Array)
    console.log(fileArr.length)
    for(var i=fileArr.length-1; i>0; i--){
    	console.log(fileArr.length)
    	if(!Checkfiles1(fileArr[i].name)){fileArr.splice(i, 1);}
    }
    
     fileArr.forEach(function(f,index) { //배열형식의 파일들의 확장자 검사 돌림
    	if(!Checkfiles1(f.name)){fileArr.splice(index, 1);}
    }) 
    
    //위에서 걸러준 후 배열파일친구들을 다시 찐 파일로변환시킴
    fileArr.forEach(file => { dataTransfer.items.add(file); });
    //그리고 input file태그에 담음
    filetag[0].files = dataTransfer.files;
    
    //var filesArr = Array.prototype.slice.call(files); //파일명을 배열화
   	fileArr.forEach(function(f,index){
     //  sel_files.push(f.name); // 이미지만 걸러서 다시 배열화
     
     //여기는 미리보기div태그에 이미지미리보기 심어주기!
        var reader = new FileReader();
        reader.onload = function(e) {
        	var str = e.target.result
        	console.log(str.indexOf('image'))
        	console.log(f.name)
        	if(str.indexOf('image')==-1){
                var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"https://cdn-icons-png.flaticon.com/512/8473/8473155.png\" ondblclick='deletefile("+index+")' style='width:150px;'></div>";
        	}else{
                var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"" + e.target.result + "\" ondblclick='deletefile("+index+",\""+filetagid+"\")' style='width:150px;'></div>";
              //  var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"" + e.target.result + "\" ondblclick='deletefile("+index+",'"+filetagid+"')' style='width:150px;'></div>";
        	}
            $("#imgs_wrap").append(img_html);
        }
        reader.readAsDataURL(f);
    });
    
}

//--------이미지+파일(ppt,워드,pdf 등)---검사 메서드------------------------------------------------
function handleImgsFilesSelect2(e) {
	const dataTransfer = new DataTransfer();// dataTransfer (Array -> FileList) 배열을 다시 파일화 시키는 친구!
	$("#imgs_wrap").empty()
	sel_files=[];
	var filetag = $(this) //해당 태그 안의파일들 사용해야하니까 변수로 사용하게끔 처리
	var filetagid = "#"+$(this).attr('id') //이거는.. 밑에서 삭제처리 가능하도록, 생성되는 img파일에다가 해당 id변수명 넣어줌
    var fileArr = Array.from(e.target.files);// 이벤트로 넘어온 파일들을 배열형식으로 담음(FileList -> Array)
    console.log(fileArr.length)
    for(var i=fileArr.length-1; i>0; i--){
    	console.log(fileArr.length)
    	if(!Checkfiles1(fileArr[i].name)){fileArr.splice(i, 1);}
    }
    
     fileArr.forEach(function(f,index) { //배열형식의 파일들의 확장자 검사 돌림
    	if(!Checkfiles2(f.name)){fileArr.splice(index, 1);}
    }) 
    
    //위에서 걸러준 후 배열파일친구들을 다시 찐 파일로변환시킴
    fileArr.forEach(file => { dataTransfer.items.add(file); });
    //그리고 input file태그에 담음
    filetag[0].files = dataTransfer.files;
    
    //var filesArr = Array.prototype.slice.call(files); //파일명을 배열화
   	fileArr.forEach(function(f,index){
     //  sel_files.push(f.name); // 이미지만 걸러서 다시 배열화
     
     //여기는 미리보기div태그에 이미지미리보기 심어주기!
        var reader = new FileReader();
        reader.onload = function(e) {
        	var str = e.target.result
        	console.log(str.indexOf('image'))
        	console.log(f.name)
        	if(str.indexOf('image')==-1){
                var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"https://cdn-icons-png.flaticon.com/512/8473/8473155.png\" ondblclick='deletefile("+index+")' style='width:150px;'></div>";
        	}else{
                var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"" + e.target.result + "\" ondblclick='deletefile("+index+",\""+filetagid+"\")' style='width:150px;'></div>";
              //  var img_html = "<div style='text-align:center;'><label class='postInsertTitle' style='font-size:20px'>"+f.name+"</label><br><img src=\"" + e.target.result + "\" ondblclick='deletefile("+index+",'"+filetagid+"')' style='width:150px;'></div>";
        	}
            $("#imgs_wrap").append(img_html);
        }
        reader.readAsDataURL(f);
    });
    
}


//삭제처리
const deletefile = (fileNum,filetag) => {	//fileNum은 li 의 index 값
    const dataTransfer = new DataTransfer();
    var filetag = $(filetag)
    var files1 = filetag[0].files;	//사용자가 입력한 파일을 변수에 할당
    
    var fileArray = Array.from(files1);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
    console.log(fileArray[0].name) //파일이름
    fileArray.splice(fileNum, 1);	//해당하는 index의 파일을 배열에서 제거
    
    fileArray.forEach(file => { dataTransfer.items.add(file); });
    //남은 배열을 dataTransfer로 처리(Array -> FileList)
    
    filetag[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
    
    filetag.trigger("change")
}