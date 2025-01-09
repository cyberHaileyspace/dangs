<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Welcome Page</title>
<style>
.logout {
	padding: 10px 20px;
	background-color: #66bb6a;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.logout:hover {
	background-color: #4caf50;
}
</style>
</head>
<body>
	<p>${sessionScope.user.name}님환영합니다.</p>
	<button class="logout" onclick="location.href='logoutC'">logout</button>
</body>
</html>
