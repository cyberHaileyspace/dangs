<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>우리 동네 검색</h1>
	<input type="search" id="searchInput" placeholder="동네 이름을 입력하세요">
	<button id="searchButton">찾기</button>
	<div id="result"></div>
</body>
<script>
	$('.searchButton').click(function() {
		location.href = 'SearchC';
	})
</script>
</html>