<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/index.js"></script>

</head>
<body>
	<div class="main-wrapper">
		<div class="logo-div">
			<img class="logo" alt="" src="img/dog-nose.png">
		</div>
		<div style="display: flex; width: 80%; justify-content: space-around;">
			<div>입양</div>
			<div>중고거래</div>
			<div>
				<a href="locationC" style="text-decoration: none; color: black;">산책로</a>
			</div>
			<div>커뮤니티</div>
			<div class="myPage">마이페이지</div>
		</div>
	</div>
	<div style="display: flex;">
		<div class="index-content">
			<jsp:include page="${content }"></jsp:include>
		</div>
		<div class="login">
			<jsp:include page="${loginCheck }"></jsp:include>
		</div>
	</div>
</body>
</html>
