<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div class="main-wrapper">
	<div class="logo-div" onclick="location.href='HC'"><img class="logo" alt="" src="img/dog-nose.png" > </div>
	<div style="display: flex; width: 80%; justify-content: space-around;">
	<div>입양</div>
	<div>중고거래</div>
	<div>산책로</div>
	<div><a href="CmMainC">커뮤니티</a></div>
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

<!-- 모달 -->
<div id="signupModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <form id="signupForm">
      <input type="text" id="username" name="username" required placeholder="아이디">
      <input type="password" id="password" name="password" required placeholder="비밀번호">
      <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="비밀번호 확인">
      <input type="text" id="nickname" name="nickname" required placeholder="닉네임">
      <input type="email" id="email" name="email" required placeholder="이메일">
      <button type="submit">회원가입</button>
      <button type="button" id="cancelBtn">취소</button>
    </form>
  </div>
</div>
<!-- 모달 끝 -->
	<script type="text/javascript" src="js/sw_reg_modal.js"></script>
</body>
</html>