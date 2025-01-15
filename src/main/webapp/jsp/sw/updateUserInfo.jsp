<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sw/updateUserInfo.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="update-form-wrapper">
		<div class="update-logo-div">
			<img class="logo" alt="" src="img/pokemon.gif"
				style="width: 90px; height: 90px" />
		</div>
		<form action="updateUserInfoC" method="post"
			enctype="multipart/form-data">
			<div id="signupForm">
				<div class="swInputDiv">
					<input type="text" id="updateName" name="updateName" required
						placeholder="이름" /> <span id="nameError" class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<input type="text" id="updateNickname" name="updateNickname"
						required placeholder="닉네임" /> <span id="nicknameError"
						class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<input type="number" id="updateAge" name="updateAge" required
						placeholder="나이" /> <span id="ageError" class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<input type="email" id="updateEmail" name="updateEmail" required
						placeholder="이메일" /> <span id="emailError" class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<input type="number" id="updateTel" name="updateTel" required
						placeholder="연락처" /> <span id="telError" class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<input type="text" id="updateAddress" name="updateAddress" required
						placeholder="주소" /> <span id="addressError" class="error-message"></span>
				</div>
				<div class="swInputDiv">
					<!-- 기존 프로필 사진 로드 -->

					<!-- 기존 프로필 사진 로드 -->
					<img alt="User Profile" src="img/userProfile/${sessionScope.user.photo}"
						id="updatePhoto" name="updatePhoto"
						style="width: 100px; height: 100px; object-fit: contain;">

					<!-- 사용자 정의 버튼 (파일 입력을 숨김) -->
					<label for="photoInput" class="file-label">프사 바꾸실?</label> <input
						type="file" id="photoInput" name="newPhoto" style="display: none;">
				</div>

				<div style="display: flex;">
					<button type="submit" id="updateUserInfoSubmit">수정</button>
					<button type="button" id="cancelBtn">취소</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 히든 데이터 삽입 -->
	<div id="data-container" data-username="${sessionScope.user.name}"
		data-age="${sessionScope.user.age}"
		data-tel="${sessionScope.user.tel}"
		data-address="${sessionScope.user.address}"
		data-nickname="${sessionScope.user.nickname}"
		data-photo="img/userProfile/${sessionScope.user.photo}"
		data-email="${sessionScope.user.email}"></div>
	<!-- 히든 데이터 끝 -->
	<script type="text/javascript" src="js/sw/updateUserInfo.js"></script>
</body>
</html>