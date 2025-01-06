<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="container">
		<div class="title">
			<a href="HC"> Sweet potato box </a>
		</div>
		<div class="menu">
			<div>
				<a href="MainC">메인</a>
			</div>
			<div>
				<a href="MovieC">영화</a>
			</div>
			<div>
				<a href="ReviewC">리뷰</a>
			</div>
		</div>
		<div class="content">
			<jsp:include page="${content }"></jsp:include>
		</div>
	</div>
</body>
</html>