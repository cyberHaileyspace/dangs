<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adopt.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/hy/adopt.js"></script>
</head>
<body>
	<div class="main-container">
		<!-- 네비게이션 바 -->
		<nav class="navigation-bar">
			<ul class="nav-links">
				<li><a href="AdoptionController?action=shelter">보호소 입양 공고</a></li>
				<li><a id="favorites">관심있는 공고</a></li>
			</ul>
		</nav>

		<!-- 페이지 헤더 -->
		<header class="page-header">
			<h1>보호소 입양 공고</h1>
			<p>구조 공고 기간이 종료되어 입양이 가능한 동물들입니다.</p>
		</header>

		<!-- 관리자 버튼 -->
		<div class="admin-actions">
			<button onclick="location.href='AdoptAPI'" class="admin-button">데이터셋
				저장</button>
		</div>

		<!-- 필터링 섹션 -->
		<div class="filter-section">
			<p>필터링 기능 준비 중...</p>
		</div>

		<!-- 게시글 섹션 -->
		<div class="posts-section">
			<div id="adoptPosts" class="posts-grid">
				<!-- API 데이터 표시 -->
			</div>
		</div>

		<!-- 페이지네이션 -->
		<div class="pagination">
			<button id="prevPage" class="pagination-button">이전</button>
			<button id="nextPage" class="pagination-button">다음</button>
		</div>
	</div>
</body>
</html>