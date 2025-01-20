<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<link rel="stylesheet" href="css/hy/adoptDetail.css">
<script type="text/javascript" src="js/hy/adoptDetail.js" defer></script>
</head>
<body>

	<h1>상세 공고 페이지</h1>

	<!-- JSON 데이터를 숨겨진 필드로 전달 -->
    <input type="hidden" id="animalDetail" value='<c:out value="${animalDetail}"/>' />

    <div id="detail-container">
        <!-- JavaScript가 데이터를 동적으로 삽입 -->
    </div>
	
	<a href="javascript:history.back();"> 뒤로가기 </a>




</body>
</html>
