<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/product.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jh/product.js" defer="defer"></script>
</head>
<body>
<body>

	<!-- 경로 표시 -->
	<div class="breadcrumb">Home > Second Hand > Product</div>
	<!-- 제품 상세 영역 -->
	<div class="product-detail-container">
		<!-- 왼쪽에 큰 상품 사진 -->
		<div class="product-image">
			<img src="${product_img}" alt="Product Image">
		</div>
		<!-- product culumn - img -->

		<!-- 오른쪽에 상품 정보 -->
		<div class="product-info">
			<div class="product-name">${product_name}</div>
			<!-- product culumn - name-->
			<div class="p-s-wrapper">
				<div class="p-s">
					<div class="product-price" id="product_price">${product_price}</div>
					<!-- product culumn - price -->
				</div>
				<img class="share-img" style="width: 25px; height: 25px"
					src="https://png.pngtree.com/png-vector/20230316/ourmid/pngtree-share-line-icon-vector-png-image_6651445.png"
					alt="Share image">
			</div>
			<hr>
			<p>
				<b>판매자 : </b>${product_seller}</p>
			<p>
				<b>구매혜택 : </b>${product_point} 포인트 적립
			</p>
			<p>
				<b>배송 방법 : </b> 택배
			</p>
			<!-- 택배 고정 -->
			<p>
				<b>배송비 : </b> 3,000원 (100,000,원 이상 구매 무료배송)
			</p>
			<!-- 2~3가지 경우수만 고려 culumn은 안만듬 -->

			<div class="stock-chk">
				<div class="stock">수량</div>
				<div class="stock2">
					<div class="bet">
						<div class="counter-container">
							<button id="decrease">-</button>
							<div class="number-display" id="number">1</div>
							<button id="increase">+</button>
						</div>
						<div class="total-price" id="totalPrice"></div>
					</div>
				</div>
			</div>
			<div class="total">
				<div>총 금액(상품가격 + 배송비) :</div>
				<div class="total-price" id="totalPrice2"></div>
			</div>

			<div class="item-categories">
				<div class="item-category">구매하기</div>
				<div class="item-category">장바구니</div>
				<div class="heart">♡</div>
			</div>

		</div>
	</div>

	<!-- 카테고리 -->
	<div class="product">
		<div class="product-id" id="product-id">${product_id}</div>
		<div class="categories">
			<div class="category" id="detail">details</div>
			<div class="category" id="comment">comment</div>
		</div>
	</div>

	<!-- 길게 상품 설명 -->
	<div class="long-description">
		<c:forEach var="detail" items="${details}">
			<div class="detail">
				<div class="detail1">
					<img alt="detail1" src="${detail.pd_detail1}">
				</div>
				<div class="detail2">
					<img alt="detail2" src="${detail.pd_detail2}">
				</div>
				<div class="detail3">
					<img alt="detail3" src="${detail.pD_detail3}">
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="comment-section">
		<c:forEach var="comment" items="${comments}">
		<div class="upper">
			<div class="upp1">comment</div>
			<div class="upp-div">
			<div class="upp2">user</div>
			<div class="upp3">date</div>
		</div>
		</div>
			<div class="comment">
				<div class="comment1">${comment.pc_comment}</div>
				<div class="userDate">
					<div class="comment2">${comment.pc_user}</div>
					<div class="comment3">${comment.pc_date}</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="last-section">
		<div class="section-title">같은 카테고리의 다른 상품들</div>
		<div class="slider-placeholder">슬라이더 자리</div>
	</div>
</body>
</html>