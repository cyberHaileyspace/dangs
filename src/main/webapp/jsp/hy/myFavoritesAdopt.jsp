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

		<nav class="navigation-bar">
			<ul class="nav-links">
				<li><a href="AdoptionController?action=shelter">보호소 입양 공고</a></li>
				<li><a href="#" id="favoritesTab">관심있는 공고</a></li>
			</ul>
		</nav>

	<div class="main-container">
		<div class="posts-section">
			<div id="favoritesList" class="posts-grid">
				<!-- API 데이터 표시 -->
			</div>
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