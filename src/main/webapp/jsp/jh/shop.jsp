<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Page</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet" href="css/jh/shop.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jh/shop.js" defer="defer"></script>
</head>
<body>
	<div class="breadcrumb">Home > Second Hand</div>
	<div class="container">
		<div class="section-title">this month's promotion🎉</div>
		<!-- 슬라이더 자리 -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<!-- 시간 되면 promotion db하나 만들어서 foreach로 교체 -->
				<div class="swiper-slide">
					<img alt="promotion3"
						src="https://png.pngtree.com/background/20230612/original/pngtree-two-black-pomeranian-dogs-close-up-with-a-black-background-picture-image_3181748.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion4"
						src="https://png.pngtree.com/thumb_back/fw800/background/20230523/pngtree-black-and-white-cat-s-profile-against-a-black-background-image_2694158.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion1"
						src="https://cdn.pixabay.com/photo/2017/11/19/15/36/cat-2963057_960_720.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion2"
						src="https://png.pngtree.com/background/20230523/original/pngtree-zebra-face-against-a-black-background-picture-image_2699799.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion5"
						src="https://images.pexels.com/photos/6162265/pexels-photo-6162265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1">
				</div>
			</div>
			<!-- <div class="swiper-button-next" style="color: black"></div>
			<div class="swiper-button-prev" style="color: black"></div> -->
			<div class="swiper-pagination" style="color: black"></div>
		</div>

		<!-- Swiper JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper(".mySwiper", {
				spaceBetween : 30,
				centeredSlides : true,
				autoplay : {
					delay : 2500,
					disableOnInteraction : false,
				},
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});
		</script>

		<!-- 첫 번째 항목 -->
		<div class="section-title">Hot Deal🔥</div>
		<div class="rank">
			<div class="rank-wrapper">
				<div class="rank-slide">
					<c:forEach var="product" items="${fixed_products}">
						<div class="product"
							onclick="location.href='ProductC?product_id=${product.product_id}'">
							<div class="img-wrapper">
								<img src="${product.product_img}" alt="product-img">
							</div>
							<div class="product-name">${product.product_name}</div>
							<div class="product-price" style="color: #e74c3c">
								<fmt:formatNumber value="${product.product_price}"
									pattern="#,###" />
								원
							</div>
							<div class="product-date">개시일 : ${product.product_date}</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>


		<!-- 두 번째 항목 -->
		<div class="section-title">View by Category✔︎</div>

		<!-- 카테고리 -->
		<div class="categories">

			<div class="category" id="b1">food</div>
			<div class="category" id="b2">cloth</div>
			<div class="category" id="b3">etc</div>
		</div>
		<!-- 하위 카테고리 -->
		<table id="menu1">
			<tr>
				<td class="sub-category">feed</td>
				<td class="sub-category">snack</td>
				<td class="sub-category">nutritional supplements</td>
			</tr>
		</table>
		<table id="menu2">
			<tr>
				<td class="sub-category">indoor</td>
				<td class="sub-category">outdoor</td>
				<td class="sub-category">walking supplies</td>
			</tr>
		</table>
		<table id="menu3">
			<tr>
				<td class="sub-category">home/living</td>
				<td class="sub-category">toilet</td>
				<td class="sub-category">bath</td>
				<td class="sub-category">toy</td>
			</tr>
		</table>

		<!-- 카테고리 선택시 아래 항목 비동기 처리 -->
		<div class="product-grid">
			<c:forEach var="product" items="${products}">
				<div class="product"
					onclick="location.href='ProductC?product_id=${product.product_id}'">
					<div class="product-img">
						<img src="${product.product_img}" alt="product-img">
					</div>
					<div class="pro-info">
					<div class="product-name">${product.product_name}</div>
					<div class="product-price" style="color: #e74c3c">
						<fmt:formatNumber value="${product.product_price}" pattern="#,###" />
						원
					</div>
					<div class="product-date">개시일 : ${product.product_date}</div>
				</div>
				</div>
				<input type="hidden" name="product_id" value="${product.product_id}">
			</c:forEach>
		</div>
		<!-- paging -->
		<div class="paging-container">
			<a class="prev-btn" href="ShopPageC?p=1"
				style="text-decoration: none;">‹</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a class="page-num" href="ShopPageC?p=${i}"
					style="text-decoration: none;">${i}</a>
			</c:forEach>
			<a class="next-btn" href="ShopPageC?p=${pageCount}"
				style="text-decoration: none;">›</a>
		</div>
	</div>
</body>
<div class="fake-back"></div>
</html>