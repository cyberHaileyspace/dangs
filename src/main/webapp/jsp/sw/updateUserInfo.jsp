<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/sw/updateUserInfo.css" />
</head>
<body>
	<div id="signupForm">
		<div class="swInputDiv">
			<input type="text" id="updatename" name="updateName" required placeholder="${sessionScope.user.name}" />
			<span id="nameError" class="error-message"></span>
		</div>
		<div class="swInputDiv">
			<input type="number" id="age" name="age" required placeholder="${sessionScope.user.age}" />
			<span id="ageError" class="error-message"></span>
		</div>
		<div class="swInputDiv">
			<input type="email" id="email" name="email" required
				placeholder="${sessionScope.user.email}" /> <span id="emailError"
				class="error-message"></span>
		</div>
		<div class="swInputDiv">
			<input type="number" id="tel" name="tel" required placeholder="${sessionScope.user.tel}" />
			<span id="telError" class="error-message"></span>
		</div>
		<div class="swInputDiv">
			<input type="text" id="address" name="address" required
				placeholder="${sessionScope.user.address}" /> <span id="addressError"
				class="error-message"></span>
		</div>

		<div style="display: flex;">
			<button type="button" id="updateUserInfoSubmit">수정</button>
			<button type="button" id="cancelBtn">취소</button>
		</div>
	</div>
</body>
</html>