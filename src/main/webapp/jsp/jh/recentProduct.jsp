<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/recentProduct.css">
</head>
<body>
	<div class="r-title">최근 본 상품</div>
	<div class="rp-list-container">
		<c:forEach var="rp" items="${recentProducts}">
			<div class="rp-item">
				<div class="re-img-wrapper">
					<img class="rp-img" alt="rp-img" src="${rp.product_img}">
				</div>
				<div class="rp-name">${rp.product_name}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>