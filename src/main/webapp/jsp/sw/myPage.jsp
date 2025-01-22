<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 임시 주문내역 버튼 -->
	<div onclick="location.href='MOCfMP?page-check=mypage'">주문내역</div>
	<div onclick="location.href='StatusOfCRC?page-check=mypage'">주문취소/환불 현황</div>
	<div onclick="location.href='InsertProductC'">상품등록</div>
	<div onclick="location.href='MyProductC'">내 등록상품</div>

<jsp:include page="${petCheck }"></jsp:include>

</body>
</html>