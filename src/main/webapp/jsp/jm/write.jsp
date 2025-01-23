<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jm/search.css">
</head>
<body>
	<form action="WriteC">
	<div style="display: flex; justify-content: center;">
		<div class="search-reg">
			<div>
				<div>작성자 : 
				</div>
					<div><input name="user_id" value="${sessionScope.user.id }" readonly></div>				
			</div>
			<div>
				<div>제목 : 
				</div>
					<div><input name="title"></div>
			</div>
			<div>
				<div>주소 : 
				</div>
					<div><input name="address"></div>				
			</div>
			<div>
				<div>내용 : 
				</div>
					<div><textarea rows="5" cols="40" name="content"></textarea></div>			
			</div>
			<div>
				<div>
					<button class="btn-16">등록</button>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>