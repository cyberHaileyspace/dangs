<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/myOrder.css">
<script type="text/javascript" src="js/jh/myProduct.js" defer="defer"></script>
</head>
<body>
	<body>
	<div class="title-wrapper">
		<div class="title">상품 수정/삭제</div>
		<div class="process">
			<span class="prevPage"> 마이페이지 </span> <span class="next-stage">&gt;</span>
			<span class="title-now">상품 수정/삭제</span>
		</div>
	</div>
	<div class="mainBody">
		<div class="search-order">
			<div class="search-order-title">상품 검색</div>
			<div class="under-search-order">
				<input type="text" class="search-order-input" id="searchOrderInput"
					placeholder="검색어 입력">
			</div>
		</div>

		<div class="order-category">
			<div class="product-date">
				<b>등록일</b>
			</div>
			<div class="product-img">이미지</div>
			<div class="product-name">상품명</div>
			<div class="product-price">가격</div>
			<div class="product-stock">수량</div>
			<div class="product-category">메인 카테고리</div>
			<div class="sub-category">서브 카테고리</div>
		</div>
		<div id="orderContainer">
			<c:forEach var="product" items="${products}">
				<div class="per-order" data-title="${product.product_name}">
					<div>${product.product_date}</div>
					<div class="img-wrapper">
						<img class="product_img2" alt="product_img"
							src="${product.product_img}"></img>
					</div>
					<div class="name-wrapper">
						<div class="product_name2">${product.product_name}</div>
					</div>
					<div>
						<fmt:formatNumber value="${orders.order_price}" type="number"
							groupingUsed="true" />
					</div>
					<div>${product.product_stock}</div>
					<div>${product.product_category}</div>
					<div>${product.sub_category}</div>
					<div class="buttons">
						<button class="updateBtn" onclick="location.href='UpdateProductC?product_id=${product.product_id}'">수정</button>
						<button class="deleteBtn" onclick="confirm('해당 상품을 삭제하시겠습니까?') ? location.href='DeleteProductC?product_id=${product.product_id}' : void(0)">삭제</button>
					</div>
				</div>
				</c:forEach>
		</div>
	</div>
</body>
</html>