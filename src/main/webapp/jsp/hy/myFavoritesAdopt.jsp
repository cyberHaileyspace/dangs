<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adoptMain.css">
</head>
<body>

	<div>
		<div id="header1">
			<ul class="tap">
				<a class="adopt"> 입양 홈 </a>
				<a class="shelter"
					href="AdoptionController?action=shelterAdoption.jsp"> 보호소 입양 </a>
				<a class="foster" href="FosterController?action=fosterAdoptions.jsp">
					임시 보호 </a>
			</ul>
		</div>
	</div>

	<div>
		<div id="header2">
			<div>
				<a href="AdoptionController?action=shelterAdoption.jsp"> 보호소 입양
				</a> <a href="AdoptionController?action=myFavorites"> 나의 관심 공고 </a>
			</div>
		</div>
	</div>

	<h2>내 관심 공고</h2>
	<p>내가 관심 표시한 공고 목록입니다.</p>
	<!-- 관심 공고 데이터를 동적으로 출력 -->
	<ul>
		<!-- 예시: 동적 데이터 -->
		<li>관심 등록된 강아지 공고 1</li>
		<li>관심 등록된 강아지 공고 2</li>
	</ul>

</body>
</html>