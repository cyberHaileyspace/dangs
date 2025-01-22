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
	<div>
    <c:forEach var="i" items="${users}">
        <h1>${i.user_name}, ${i.user_address}</h1>
    </c:forEach>
</div>
</body>
</html>