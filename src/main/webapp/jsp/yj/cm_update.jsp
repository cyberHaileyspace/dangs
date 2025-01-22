<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<link rel="stylesheet" href="css/yj/cmAdd.css">
<script type="text/javascript" src="jsp/yj/smartaditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script></head>
<body>
<form id="cm-form" action="CmUpdateC" method="post" enctype="multipart/form-data">
	<div class="container-add">
		
		<div class="add-menu2">
		<div>카테고리</div>
			<div class="add-category">
				<input type="radio" id="cm-tip" name="cm-category" value="반려꿀팁"><label for="cm-tip">반려 꿀팁</label>
				<input type="radio" id="cm-proud" name="cm-category"value="우리멍멍"><label for="cm-proud">우리 멍멍</label>
				<input type="radio" id="cm-diary" name="cm-category"value="집사일기"><label for="cm-diary">집사 일기</label>
				<input type="radio" id="cm-qna" name="cm-category"value="질의응답"><label for="cm-qna">Q&A</label>
			</div>
		</div>
		
		<div class="add-menu">
			<div>반려 크기</div>
		<div class="add-size">
		 <input type="radio" id="s" name="cm-dog" value="소형견"><label for="s">소형견</label>
     	 <input type="radio" id="m" name="cm-dog" value="중형견"><label for="m">중형견</label>
     	 <input type="radio" id="l" name="cm-dog" value="대형견"><label for="l">대형견</label>
 		</div>
		</div>
		
		
		<div class="add-title">
			<div>제목</div>
		 	<div class="add-ta"><textarea name="title" rows="" cols="" placeholder="제목을 입력하세요.">${getPost.cm_title }</textarea></div>
		 </div>
		
		
		<div class="add-write">
			<div>내용</div>
			<div>
			<textarea name="ir1" id="ir1" rows="10" cols="100" placeholder="텍스트를 꾸며보세요 ㅎ 3ㅎ/">${getPost.cm_text }</textarea>	
			</div>
		</div>
		<div class="add-file">
		
		 <div id='image_preview'>
    <input type='file' id='btnAtt' name="file" value="img/post/${getPost.cm_img }"/>
    <div id='att_zone'
      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
  </div>
		
<!-- 			<div> <span>사진 업로드</span> <input type="file"> </div> -->
		</div>
		<div class="add-check">
			<button class="add-post" type="button">등록</button>
		</div>
		<input class="updateCmNo" name="updateCmNo" value="${getPost.cm_no }">
	</div>
	
	</form>
			<button class="add-cancel" type="button">취소</button>
</body>
 <script type="text/javascript" id="smartEditor">
	var oEditors = [];
 		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
 		oAppRef : oEditors,
 		elPlaceHolder : "ir1", //<textarea> ID 값 입력.
 		sSkinURI : "jsp/yj/smartaditor/SmartEditor2Skin.html",
 		fCreator : "creatorSEditor2",
 		htParams : {
 				//toolbar 사용여부
 				bUseToolbar : true,
 				//입력창 크기 조절
 				bUseVericalResizer : true,
 				//모드탭 (Editor|HTML|TEXT)
 				bUseModeChanger : true,
 				//변경사항이 저장 되지 않을 수 있습니다 경고창 제거
 				fOnBeforeUnload : function(){}
 				}
 			});
 		
		//스마트에디터의 값을 텍스트 컨텐츠로 변환 
 		$(".add-post").on("click",function(e) {
 			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
 			console.log(oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FILED", []));
 			$("#cm-form").submit();
 		});
 					
</script>
 <script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
  
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')

</script>
</html>