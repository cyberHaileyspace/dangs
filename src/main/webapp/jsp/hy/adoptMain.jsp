<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adoptMain.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>

	<div>
		<ul class="tap">
			<a class="adopt"> 홈 </a>
			<a class="shelter"
				href="AdoptionController?action=shelterAdoption.jsp"> 보호소 입양 </a>
			<a class="foster" href="FosterController?action=fosterAdoptions.jsp">
				임시 보호 </a>
		</ul>
	</div>

	<div class="panel-container">
		<!-- 보호소 입양 패널 -->
		<div class="panel"
			onclick="location.href='AdoptionController?action=shelterAdoption.jsp'">
			<div class="panel-title">보호소 입양</div>
			<button class="panel-button">보러가기</button>
		</div>

		<!-- 임시보호 패널 -->
		<div class="panel"
			onclick="location.href='FosterController?action=fosterAdoptions.jsp'">
			<div class="panel-title">임시보호</div>
			<button class="panel-button">보러가기</button>
		</div>
	</div>
</body>
</html>