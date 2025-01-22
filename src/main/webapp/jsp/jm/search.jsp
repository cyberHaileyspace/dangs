<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jm/search.css">
</head>
<body>
	<form action="SearchC">
		<h1>우리 동네 검색</h1>
		<div color="gray">예) 테헤란로</div>
		<input id="searchInput" name="locationInput"
			placeholder="동네 이름을 입력하세요">
		<button id="searchButton">검색</button>
	</form>
	<jsp:include page="${result }"></jsp:include>
	<button id="searchButton" onclick="location.href = 'Middle02C'">작성하기</button>

</body>

</html>