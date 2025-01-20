<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/iPResult.css">
</head>
<body>
<body>
	<form action="MyOrderC">
		<div class="title-wrapper">
			<div class="title">등록 완료</div>
			<div class="process">
				<span> 마이페이지 </span> <span class="next-stage">&gt;</span> <span>
					주문/결제 </span> <span class="next-stage">&gt;</span> <span class="title-now">등록
					완료</span>
			</div>
		</div>
		<div class="result-title">
			<div class="success-order">
				<div class="success-icon">
					<img class="congg" alt="cong"
							src="https://cdn-icons-png.flaticon.com/512/2424/2424926.png">
				</div>
				<div class="result-info">
					<div class="order-result">상품 등록이 완료되었습니다</div>
				</div>
				<div class="goto">
					<div class="button-container"> <!-- 경로 나중에 수정 -->
						<button class="simple-button" onclick="location.href='ShopC'">홈</button>
						<button class="simple-button">마이페이지</button>
						<input type="hidden" name="prev-page-name" value="주문/결제">

						<!-- 값 받기 위해 hidden -->
						<input type="hidden" name="order_id" value="${order_id}">
						<input type="hidden" name="product_id" value="${pi}"> <input
							type="hidden" name="order_stock" value="${order_stock}">
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
</body>
</html>