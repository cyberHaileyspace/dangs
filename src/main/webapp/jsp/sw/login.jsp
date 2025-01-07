<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="login-container">
    <form action="loginC">
        <input class="login-input" name="id" placeholder="ID를 입력하세요">
        <input class="login-input" name="pw" placeholder="비밀번호를 입력하세요" type="password">
        <button class="login-button">로그인</button>
        <a class="signup-link" href="#">회원가입</a>
    </form>
</div>
</body>
</html>