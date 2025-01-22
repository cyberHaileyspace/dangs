<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/sw/myPage.css">
</head>
<body>
	<div class="myPageBody">


		<jsp:include page="${petCheck }"></jsp:include>

		<div>
			<img alt="" src="img/jirol.png" style="width: 100%;">
		</div>
		<!-- 임시 주문내역 버튼 -->
		<div class="myPage-product">
			<div>내 포인트 : 0원</div>
			<div class="productButtonWrapper">
				<div onclick="location.href='MOCfMP?page-check=mypage'">주문내역</div>
				<div onclick="location.href='StatusOfCRC?page-check=mypage'">주문취소/환불
					현황</div>
				<div onclick="location.href='InsertProductC'">상품등록</div>
				<div onclick="location.href='MyProductC'">내 등록상품</div>
			</div>
		</div>
		<!-- myPageBody 끝 -->
	</div>
</body>
</html>