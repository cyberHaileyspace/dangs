<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" href="css/sw/main.css">

</head>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<body>
	<div class="littleBody">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="img/112233.jpg" alt="Dog 1">
				</div>
				<div class="swiper-slide">
					<img src="img/112234.jpg" alt="Dog 2">
				</div>
				<div class="swiper-slide">
					<img src="img/112235.jpg" alt="Dog 3">
				</div>
				<div class="swiper-slide">
					<img src="img/112236.jpg" alt="Dog 4">
				</div>
				<div class="swiper-slide">
					<img src="img/112237.jpg" alt="Dog 5">
				</div>
				<div class="swiper-slide">
					<img src="img/112238.jpg" alt="Dog 6">
				</div>
				<div class="swiper-slide">
					<img src="img/112239.jpg" alt="Dog 7">
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>

		<div class="sw-post-wrapper">
			<div class="sw-post-header">
				<div style="cursor: default;">새 글</div>
				<div style="cursor: pointer" onclick="location.href='CmMainC'">더보기</div>
			</div>
			<br>
			<c:forEach var="i" items="${posts }">
				<div class="sw-post-title"
					onclick="location.href='CmPostC?no=${i.cm_no }'">
					<div>● ${i.cm_title }</div>
				</div>
			</c:forEach>
		</div>
		<div style="position: relative; top: -360px">
			<img alt="" src="img/jirol.png" style="width: 100%;">
		</div>

		<!-- 	<button id="wishlist-button" data-product-id="123"
		class="wishlist-button">
		<i class="heart-icon">♡</i>
	</button> -->

		<h1>오늘의 미친 핫딜</h1>

	</div>
	<script type="text/javascript">
		$(function() {
			const swiper = new Swiper('.swiper-container', {
				loop : true,
				autoplay : {
					delay : 3000,
				},
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
			});

			// document.getElementById('wishlist-button').addEventListener('click', function() {
			// 	  const productId = this.getAttribute('data-product-id');

			// 	  fetch('CheckSessionServlet', {
			// 	    method: 'GET',
			// 	    headers: {
			// 	      'Content-Type': 'application/json'
			// 	    }
			// 	  })
			// 	  .then(response => response.json())
			// 	  .then(data => {
			// 	    if (data.isLoggedIn) {
			// 	      fetch('ToggleWishlistServlet', {
			// 	        method: 'POST',
			// 	        headers: {
			// 	          'Content-Type': 'application/json'
			// 	        },
			// 	        body: JSON.stringify({ productId: productId })
			// 	      })
			// 	      .then(response => response.json())
			// 	      .then(result => {
			// 	        if (result.success) {
			// 	          const heartIcon = document.querySelector('.heart-icon');
			// 	          heartIcon.classList.toggle('active', result.isWishlisted);
			// 	        } else {
			// 	          alert('찜 상태 변경에 실패했습니다.');
			// 	        }
			// 	      });
			// 	    } else {
			// 	      window.location.href = 'loginC';
			// 	    }
			// 	  })
			// 	  .catch(error => {
			// 	    console.error('에러 발생:', error);
			// 	  });
			// 	});
		});
	</script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>
