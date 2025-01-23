<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hy/adopt.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/hy/adopt.js"></script>
</head>
<body>

	<nav class="navigation-bar">
		<ul class="nav-links">
			<li><a href="AdoptionController?action=shelter">보호소 입양 공고</a></li>
			<li><a href="#" id="favoritesTab">관심있는 공고</a></li>
		</ul>
	</nav>

	<div class="main-container">
		<!-- 페이지 헤더 -->
		<header class="page-header">
			<h1>보호소 입양 공고</h1>
			<p>구조 공고 기간이 종료되어 입양이 가능한 아이들입니다.</p>
		</header>

		<!--<div class="admin-actions">
			<button onclick="location.href='AdoptAPI'" class="admin-button">데이터셋
				저장</button>
		</div> -->

		<!-- 게시글 섹션 -->
		<div class="posts-section">
			<div id="adoptPosts" class="posts-grid">
				<!-- API 데이터 표시 -->
			</div>
		</div>

		<div class="pagination">
			<button id="prevPage" class="pagination-button">이전</button>
			<div id="pagination" class="pagination-numbers"></div>
			<!-- 페이지 번호 컨테이너 -->
			<button id="nextPage" class="pagination-button">다음</button>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('#favoritesTab')
					.click(
							function() {
								var xhr = new XMLHttpRequest();
								xhr.open('GET', 'checkLogin', true);
								xhr.onreadystatechange = function() {
									if (xhr.readyState === 4
											&& xhr.status === 200) {
										if (xhr.responseText === 'loggedIn') {
											window.location.href = 'AdoptionController?action=favorites';
										} else if (xhr.responseText === 'notLoggedIn') {
											window.location.href = 'loginC';
										}
									}
								};
								xhr.send();
							});

		})
	</script>
</body>
</html>