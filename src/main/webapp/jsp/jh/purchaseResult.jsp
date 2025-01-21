<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/purchaseResult.css">
</head>
<body>
	<form action="MyOrderC">
		<div class="title-wrapper">
			<div class="title">주문완료</div>
			<div class="process">
				<span> 주문/결제 </span> <span class="next-stage">&gt;</span> <span
					class="title-now">주문완료</span>
			</div>
		</div>
		<div class="result-title">
			<div class="success-order">
			<div class="success-icon-wrwapper">
				<div class="success-icon">
					<img alt="success-icon"
						src="https://cdn.icon-icons.com/icons2/3478/PNG/512/ordercomplete_icon_220012.png">
				</div>
			</div>
				<div class="result-info">
					<div class="cong">
						<img class="congg" alt="cong"
							src="https://cdn-icons-png.flaticon.com/512/2424/2424926.png">
					</div>
					<div class="order-result">주문이 완료되었습니다</div>
					<div class="cong">
						<img class="congg" alt="cong"
							src="https://cdn-icons-png.flaticon.com/512/2424/2424926.png">
					</div>
				</div>
				<div class="order-number">주문번호 : ${order_id}</div>
				<div class="goto">
					<div class="button-container">
						<button class="simple-button" onclick="location.href='ShopC'">계속
							쇼핑하기</button>
						<button class="simple-button">주문 확인하기</button>
						<input type="hidden" name="prev-page-name" value="주문/결제">

						<!-- 값 받기 위해 hidden -->
						<input type="hidden" name="order_id" value="${order_id}">
						<input type="hidden" name="product_id" value="${pi}">
						<input type="hidden" name="order_stock" value="${order_stock}">
						<input type="hidden" name="select_bank" value="${select_bank}">
						<input type="hidden" name="installments" value="${installments}">
						<input type="hidden" name="page-check" value="purchaseResult">
						<!-- ---------------- -->

					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>