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
					<img alt="promotion4"
						src="https://www.tooli.co.kr/files/attach/images/571585/680/575/%EC%8A%A4%EB%A7%88%EC%9D%BC%20%EA%B0%95%EC%95%84%EC%A7%80.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion1"
						src="https://mblogthumb-phinf.pstatic.net/MjAxNzExMDZfMjQx/MDAxNTA5OTQyNTM0NTQ3.LqsKFuUrwBbNZlNtSfmqG7T9bevPZvA_tPUODeqHiQIg.qat-OVwY8jRgX-oeN7B_jitX-dFmWFbS0SNThkI1N_Qg.JPEG.heeyoung9302/Golden-Retriever-puppy-cute-paws-2560x1600.jpg?type=w800">
				</div>
				<div class="swiper-slide">
					<img alt="promotion2"
						src="https://p4.wallpaperbetter.com/wallpaper/480/886/364/puppies-backgrounds-desktop-wallpaper-preview.jpg">
				</div>
				<div class="swiper-slide">
					<img alt="promotion3"
						src="https://lh6.googleusercontent.com/proxy/Lj5knjyjCyulaWqsUfPCSvq_45lpyP_s9Q2-6QwDf3_G55QjBH0v3whbhs2oVrziKnoItL1rSlRT7rlLoLgpBmazgfslnUYaZlvumoghE9_whWZXfG5i">
				</div>
				<div class="swiper-slide">
					<img alt="promotion5"
						src="https://png.pngtree.com/thumb_back/fh260/background/20230421/pngtree-little-poodle-dog-smiling-image_2484721.jpg">
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
					<c:forEach var="product" items="${products}">
						<div class="product"
							onclick="location.href='ProductC?product_id=${product.product_id}'">
							<div class="img-wrapper">
								<img src="${product.product_img}" alt="product-img">
							</div>
							<div class="product-name">${product.product_name}</div>
							<div class="product-price">
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
					<div class="product-name">${product.product_name}</div>
					<div class="product-price">
						<fmt:formatNumber value="${product.product_price}" pattern="#,###" />
						원
					</div>
					<div class="product-date">개시일 : ${product.product_date}</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- paging 관련 -->
		<c:choose>
			<c:when test="${curPageNum != 1}">
				<button class="shop-btn pn"
					onclick="location.href='ShopPageC?p=${curPageNum - 1}'">prev</button>
			</c:when>

			<c:otherwise>
				<button class="shop-btn pn">prev</button>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${curPageNum != pageCount}">
				<button class="shop-btn pn"
					onclick="location.href='ShopPageC?p=${curPageNum + 1}'">next</button>
			</c:when>

			<c:otherwise>
				<button class="shop-btn pn">next</button>
			</c:otherwise>
		</c:choose>

	</div>

	<div>
		<a href="ShopPageC?p=1">[begin]</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="ShopPageC?p=${i}">[${i}]</a>
		</c:forEach>
		<a href="ShopPageC?p=${pageCount}">[last]</a>
	</div>

</body>
</html>