<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adoptMain.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/hy/adopt.js"></script>
</head>
<body>
	<div>
		<div id="header1">
			<ul class="tap">
				<a href="AdoptionController?action=shelter">보호소 입양</a>
				<a id="favorites">내가 관심있는 공고</a>
			</ul>
		</div>
	</div>

	<h1>보호소 공고</h1>

	<div>관리자 로그인시 보일 버튼 <button onclick="location.href='AdoptAPI'">데이터셋 저장</button> </div>
	<div id="adoptPosts">
		<!-- API 데이터 표시 -->
	</div>
	
	<div>
    <!-- 페이지 이동 버튼 -->
    <button id="prevPage">이전</button>
    <button id="nextPage">다음</button>
</div>

</body>
</html>