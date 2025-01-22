<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<link rel="stylesheet" href="css/hy/adoptDetail.css">
<script type="text/javascript" src="js/hy/adoptDetail.js" defer></script>
</head>
<body>

	<h1>상세 공고 페이지</h1>

	<!-- JSON 데이터를 숨겨진 필드로 전달 -->
	<input type="hidden" id="animalDetail"
		value='<c:out value="${animalDetail}"/>' />

	<div id="detail-container">
		<!-- JavaScript가 데이터를 동적으로 삽입 -->
	</div>
	<div id="jonbeo" hidden>${jonbeo }</div>
	<a href="javascript:history.back();"> 뒤로가기 </a>



	<script>
		function checklog() {
			let jonbeoVal = document.getElementById('jonbeo').innerText;
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'checkLogin', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (xhr.responseText === 'loggedIn') {
						window.location.href = 'jonbeoC?asd='+jonbeoVal;
					} else if (xhr.responseText === 'notLoggedIn') {
						window.location.href = 'loginC';
					}
				}
			};
			xhr.send();
		}
	</script>
</body>
</html>
