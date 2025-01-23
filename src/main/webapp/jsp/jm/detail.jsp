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
	<form action="UpdateWritingC">
		<div style="display: flex; justify-content: center;">
			<div class="update">
				<div>
					<div class="update01">번호</div>
					<div class="update02">
						<input value="${ddd.id }" disabled="disabled">
					</div>
				</div>
				<div>
					<div class="update01">작성자</div>
					<div class="update02">
						<input value="${ddd.user_id }" disabled="disabled">
					</div>
				</div>
				<div>
					<div class="update01">제목</div>
					<div class="update02">
						<input name="title" value="${ddd.title }">
					</div>
				</div>
				<div>
					<div class="update01">내용</div>
					<div class="update02">
						<textarea name="content" rows="" cols="">${ddd.content }</textarea>
					</div>
				</div>

				<div>
					<button name="id" value="${ddd.id }">업데이트</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>