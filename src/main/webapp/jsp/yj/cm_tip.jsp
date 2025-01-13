<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yj/cm.css">
</head>
<body>
	<div class="container-cm">
	
		<div class="menu-cm">
			<div><a href="CmMainC">전체</a></div>
			<div><a href="CmTipC">반려 꿀팁</a></div>
			<div><a href="CmProudC">우리 멍멍</a></div>
			<div><a href="CmDiaryC">집사 일기</a></div>
			<div><a href="CmQnAC">Q&A</a></div>
		</div>
		
		<div class="search-cm">
		<input id="search-cm-input" placeholder="찾으시는 질문이 있으신가요?">
		<button> <img class="search-cm-btn" alt="" src="https://cdn-icons-png.flaticon.com/512/2989/2989907.png"> </button>
		<hr>
		<span id="cm-result"></span>
	</div>
		
		<div>
		<div class="list-cm">
		<input type="radio" name="cm-option" value="cm-new" checked="checked"> 최신순
		<input type="radio" name="cm-option" value="cm-like"> 좋아요순
		<input type="radio" name="cm-option" value="cm-view"> 조회순
		</div>
		<div class="write-cm" onclick="location.href='cmAddC'"> <button> <img class="write-cm-img" alt="" src="https://cdn-icons-png.flaticon.com/512/117/117476.png"> <span>작성</span></button> </div>
		</div>
		
		<div class="size-cm">
			<div class="dog-size">소형견</div>
			<div class="dog-size">중형견</div>
			<div class="dog-size">대형견</div>
		</div>

		<div> <a href="jsp/yj/cm_all.jsp">꿀팁 포스트</a> </div>
		
	</div>
</body>
</html>