<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/foster.css">
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
				<a href="FosterController?action=shelterAdoption.jsp"> 임시보호 </a> <a
					href="FosterController?action=myFosterPosts"> 내가 작성한 공고 </a> <a
					href="FosterController?action=myFavoritesFoster"> 나의 관심 공고 </a>
			</div>
		</div>
	</div>

	<h1>내가 작성한 공고</h1>

</body>
</html>