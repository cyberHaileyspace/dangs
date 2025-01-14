<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adoptMain.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/hy/adopt.js"></script>
</head>
<body>


	<div>
		<div id="header1">
			<ul class="tap">
				<a href="AdoptionController?action=shelter"> 보호소 입양 </a>
				<a href="AdoptionController?action=favorites"> 내가 관심있는 공고 </a>
			</ul>
		</div>
	</div>


<h1> 보호소 공고 </h1> 
<div id="resultAsdasd">
	<!-- API 데이터 표시 -->
</div>

<!-- 페이지 네비게이션 -->
<div id="pagination">
    <button id="prevPage">이전 페이지</button>
    <button id="nextPage">다음 페이지</button>
</div>


<!-- <div>
<button class="adopt-btn" onclick="AdoptPageController"> prev </button>
<button class="adopt-btn" onclick="AdoptPageController"> next </button>
</div>

<div>
<a href="AdoptPageController"> [begin] </a>
<a href="AdoptPageController"> [end] </a>
</div>
 -->

</body>
</html>