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
	<h1>우리 동네 검색 결과</h1>
	<div style="float: left;">
		<div style="width: 100%; display: flex; justify-content: center;">
			<div>
				<ul class="post-list">
					<c:forEach var="i" items="${ddd}">
						<li class="post-item">
							<div class="post-header">${i.title}</div>
							<div class="post-info">
								<span><strong>작성자 : </strong> ${i.user_id}</span>
								<br>
								<span><strong>주소 : </strong> ${i.address}</span>
								<br>
								<span><strong>작성일 : </strong> ${i.date}</span>
							</div>
							<div>							
								<span><strong>내용 : </strong> ${i.content}</span>
							</div>
							<div class="post-actions">
								<button>신청</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>