<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Login Page</title>
<link rel="stylesheet" href="css/login.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

	<script type="text/javascript" src="js/login.js" defer="defer"></script>

</head>
<body>

	<div class="login-container">
		<form action="loginC" method="post">
			<input id="id" class="login-input" name="id" placeholder="ID를 입력하세요">
			<input id="pw" class="login-input" name="pw"
				placeholder="비밀번호를 입력하세요" type="password">
			<div class="sw-result" style="display: ${hidden}">${result }</div>
			<button class="login-button">로그인</button>
		</form>
		<button id="openModalBtn">회원가입</button>
	</div>
	<script type="text/javascript">
		
	</script>

</body>
</html>
