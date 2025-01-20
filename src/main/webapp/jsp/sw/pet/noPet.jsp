<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
</head>
<body>
<div class="idData" hidden>${sessionScope.user.id}</div>
<img alt="" src="img/cryingJiwoo.png">
<p>펫 정보가 없습니다.</p>
<button id="registerPetButton">펫 등록하기</button>
<script type="text/javascript">
$(function() {
	

$('#registerPetButton').click(function() {
	 window.location.href = "registerPetC";
});
});
</script>
</body>
</html>