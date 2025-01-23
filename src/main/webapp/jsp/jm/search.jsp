<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div style="color: gray;">예) 테헤란로</div>
		<input id="searchInput" name="locationInput"
			placeholder="동네 이름을 입력하세요">
		<button id="searchButton">검색</button>
	</form>
	<jsp:include page="${result }"></jsp:include>
	<button id="regButton" onclick="location.href='Middle02C'">작성하기</button>
	<button id="searchWriteButton" onclick="location.href='Middle03C?id=${sessionScope.user.id}'">내
		글 찾기</button>
</body>
</html>
	<%-- <%
	String user_id = (String) session.getAttribute("user_id"); // 세션에서 사용자 ID 가져오기
	if (user_id == null) {
		user_id = ""; // userId가 null인 경우 빈 값으로 설정
	}
	%> --%>
<%-- <script>
    const user_id = "<%=user_id%>
	"; // 서버에서 전달받은 사용자 ID
	if (!user_id) {
		alert("로그인이 필요합니다."); // 사용자 ID가 없을 때 처리
	} else {
		document
				.getElementById("searchWriteButton")
				.addEventListener(
						"click",
						function() {
							const url = `Middle03C?locationInput=${encodeURIComponent(user_id)}`;
							window.location.href = url;
						});
	}
</script> --%>