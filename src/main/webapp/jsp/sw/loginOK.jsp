<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${sessionScope.user.id } (${sessionScope.user.name }) 님 환영합니다
	<button class="logout">로그아웃</button>
	${result }
</body>
</html>