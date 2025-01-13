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
	<div class="container-add">
		
		<div class="add-menu">
			<div>반려 크기</div>
		<div class="add-size">
			<div>소형견</div>
			<div>중형견</div>
			<div>대형견</div>
 		</div>
		</div>
		
		
		<div class="add-title">
			<div>제목</div>
		 	<div><input type="text"></div>
		 </div>
		
		<div class="add-menu2">
		<div>카테고리</div>
			<div class="add-category">
				<div>전체</div>
				<div>반려 꿀팁</div>
				<div>우리 멍멍</div>
				<div>집사 일기</div>
				<div>Q&A</div>
			</div>
		</div>
		
		<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다. 냥냥</textarea>	
		
		<div class="add-check">
			<button class="add-cancel">취소</button>
			<button class="add-post">등록</button>
		</div>
		
	</div>
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
 		$("#add-post").on("click",function(e) {
 			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FILED", []);
 			console.log(oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FILED", []));
 			console.log("눌리긴하니?");
 		});
</script>
</html>