<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet" href="css/jh/product.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jh/product.js" defer="defer"></script>
<script type="text/javascript" src="js/jh/cld.js" defer="defer"></script>
<style type="text/css">
.hidden {
	display: none;
}
</style>
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
			<div class="product-name"
				style="font-size: 24px; font-weight: bold; margin-bottom: 10px;">${product_name}</div>
			<!-- product culumn - name-->
			<div class="p-s-wrapper">
				<div class="p-s">
					<div class="product-price" id="product_price"
						style="font-size: 20px; color: #e74c3c; margin-bottom: 20px;">${product_price}</div>
					<!-- product culumn - price -->
				</div>
				<!-- 공유 버튼 -->
				<div class="share-img-jh" onclick="openModalJh()">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px"
						viewBox="0 -960 960 960" width="24px" fill="#000000"
						style="width: 25px;">
        <path
							d="M680-80q-50 0-85-35t-35-85q0-6 3-28L282-392q-16 15-37 23.5t-45 8.5q-50 0-85-35t-35-85q0-50 35-85t85-35q24 0 45 8.5t37 23.5l281-164q-2-7-2.5-13.5T560-760q0-50 35-85t85-35q50 0 85 35t35 85q0 50-35 85t-85 35q-24 0-45-8.5T598-672L317-508q2 7 2.5 13.5t.5 14.5q0 8-.5 14.5T317-452l281 164q16-15 37-23.5t45-8.5q50 0 85 35t35 85q0 50-35 85t-85 35Zm0-80q17 0 28.5-11.5T720-200q0-17-11.5-28.5T680-240q-17 0-28.5 11.5T640-200q0 17 11.5 28.5T680-160ZM200-440q17 0 28.5-11.5T240-480q0-17-11.5-28.5T200-520q-17 0-28.5 11.5T160-480q0 17 11.5 28.5T200-440Zm480-280q17 0 28.5-11.5T720-760q0-17-11.5-28.5T680-800q-17 0-28.5 11.5T640-760q0 17 11.5 28.5T680-720Zm0 520ZM200-480Zm480-280Z" />
    </svg>
				</div>

				<!-- 모달 배경 -->
				<div class="share-modal-background-jh" id="shareModalBackground"
					style="display: none;">
					<div class="share-modal-jh">
						<span class="close-btn-jh" onclick="closeModalJh()">&times;</span>
						<div class="modal-content-jh">
							<h2>공유하기</h2>
							<div class="share-boxes-jh">
								<div class="share-box1-jh">
									<div>
										<img alt="kakao"
											src="https://cdn-icons-png.flaticon.com/512/2111/2111496.png">
										<img alt="x"
											src="https://i.namu.wiki/i/wt5DaQyoEYzve1fU6oj-ZfKOpTAfLAyk6xgLMYDAvNVAsMmwy1Us0MqtoppBea7lBAbusx-dZiXtD7fRkzTgKA.svg">
										<img alt="instagram"
											src="https://artfeel.co.kr/web/product/big/201805/10523_shop1_15266062157845.jpg">
									</div>
								</div>
								<div class="share-box2-jh">
									<div class="url-info">URL :</div>
									<input class="url-jh" type="text"
										value="localhost/dangs/ProductC?product_id=${product_id}"
										readonly class="disabled-input-jh" />
								</div>
							</div>
						</div>
					</div>
				</div>

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
				<div class="stock">
					<div class="st-quentity">수량</div>
					<div class="st-price">가격</div>
				</div>
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
				<div class="item-category" id="purchase">주문/결제</div>
				<div class="item-category">장바구니</div>
				<div class="heart">♡</div>
			</div>

		</div>
	</div>

	<!-- 카테고리 -->
	<div class="product">
		<!-- product_id 숨겨놓음 -->
		<div class="product-id" id="product-id">${product_id}</div>
		<!--  -->
		<div class="categories">
			<div class="category" id="detail">details</div>
			<div class="category" id="comment">comment</div>
		</div>
	</div>

	<!-- 길게 상품 설명 -->
	<div class="long-description">
		<c:forEach var="detail" items="${details}">
			<c:if
				test="${not empty detail.pd_detail1 or not empty detail.pd_detail2 or not empty detail.pd_detail3}">
				<div class="detail">
					<c:if test="${not empty detail.pd_detail1}">
						<div class="detail1">
							<img alt="detail1" src="${detail.pd_detail1}">
						</div>
					</c:if>
					<c:if test="${not empty detail.pd_detail2}">
						<div class="detail2">
							<img alt="detail2" src="${detail.pd_detail2}">
						</div>
					</c:if>
					<c:if test="${not empty detail.pd_detail3}">
						<div class="detail3">
							<img alt="detail3" src="${detail.pd_detail3}">
						</div>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<div class="comment-section">
		<!-- <div class="upper">
			<div class="upp1">comment</div>
			<div class="upp-div">
			<div class="upp2">user</div>
			<div class="upp3">date</div>
		</div>
		</div> -->
		<c:forEach var="comment" items="${comments}">
			<div class="comment">
				<div class="comment1">${comment.pc_comment}</div>
				<div class="userDate">
					<div class="comment2">${comment.pc_user}</div>
					<div class="comment3">${comment.pc_date}</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- <div class="add-comment">
 		<textarea rows="" cols="" class="write-comment"></textarea>
		<button>add</button>
	</div> -->
	<div class="last-section">
		<div class="section-title">같은 카테고리의 다른 상품들</div>
		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<c:forEach var="products" items="${same_products}">
					<div class="swiper-slide">
						<div class="product"
							onclick="location.href='ProductC?product_id=${products.product_id}'">
							<div class="product-img">
								<img src="${products.product_img}" alt="product-img">
							</div>
							<div class="pro-info">
								<div class="product-name">${products.product_name}</div>
								<div class="product-price">
									<fmt:formatNumber value="${products.product_price}"
										pattern="#,###" />
									원
								</div>
								<div class="product-date">개시일 : ${products.product_date}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 4,
			spaceBetween : 15,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
		});
	</script>
</body>


</html>