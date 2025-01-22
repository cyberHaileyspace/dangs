<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hy/favorites.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/hy/favoriteAdopt.js"></script>
</head>
<body>
	<div class="main-container">
		<!-- 네비게이션 바 -->
		<nav class="navigation-bar">
			<ul class="nav-links">
				<li><a href="AdoptionController?action=shelter">보호소 입양 공고</a></li>
				<li><a href="AdoptionController?action=favorites">관심있는 공고</a></li>

			</ul>
		</nav>
	</div>


	<div id="favoritesList">
		<!-- 관심 등록 데이터가 여기에 표시됩니다 -->
	</div>
</body>
</html>