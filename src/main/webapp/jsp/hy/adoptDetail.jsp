<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/hy/adoptDetail.css">
<script type="text/javascript" src="js/hy/adoptDetail.js" defer></script>
</head>
<body>

	<!-- 네비게이션 바 -->
	<nav class="navigation-bar">
		<ul class="nav-links">
			<li><a href="AdoptionController?action=shelter">보호소 입양 공고</a></li>
			<li><a href="#" id=favoritesTab>관심있는 공고</a></li>
		</ul>
	</nav>

	<div class="main-container">
		<!-- 페이지 헤더 -->
		<header class="page-header">
			<h1>보호소 입양 공고</h1>
			<p>구조 공고 기간이 종료되어 입양이 가능한 아이들입니다.</p>
		</header>

		<!-- JSON 데이터를 숨겨진 필드로 전달 -->
		<input type="hidden" id="animalDetail"
			value='<c:out value="${animalDetail}"/>' />

		<div id="adoptLikes" hidden>${adoptLikes }</div>

		<div id="detail-container">
			<!-- JavaScript가 데이터를 동적으로 삽입 -->
		</div>

		<a href="javascript:history.back();" class="back-button"> 뒤로가기 </a>
	</div>

	<script>
		function checklog(div) {
			let adoptLikesVal = document.getElementById('adoptLikes').innerText;
			let icon = div.firstElementChild;

			if (icon.classList.contains("fa-regular")) {
				icon.classList.remove("fa-regular");
				icon.classList.add("fa-solid", "red");
			} else {
				icon.classList.remove("fa-solid", "red");
				icon.classList.add("fa-regular");
			}

			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'checkLogin', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (xhr.responseText === 'loggedIn') {
						console.log(icon.dataset.val);
						likeSet(icon.dataset.val);
					} else if (xhr.responseText === 'notLoggedIn') {
						window.location.href = 'loginC';
					}
				}
			};
			xhr.send();
		}

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
