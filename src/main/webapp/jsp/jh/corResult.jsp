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
	<form action="">
		<div class="title-wrapper">
			<div class="title">주문취소 요청 완료</div>
			<div class="process">
				<span> 마이페이지 </span> <span class="next-stage">&gt;</span> <span>
					주문내역 </span> <span class="next-stage">&gt;</span> <span> 취소/환불 </span> <span
					class="next-stage">&gt;</span> <span class="title-now">취소/환불
					요청 완료</span>
			</div>
		</div>
		<div class="result-title">
			<div class="success-order">
				<div class="success-icon">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#000000"><path d="m760-183-85 84-56-56 84-85-84-85 56-56 85 84 85-84 56 56-84 85 84 85-56 56-85-84ZM240-80q-50 0-85-35t-35-85v-120h120v-560h600v415q-19-7-39-10.5t-41-3.5v-321H320v480h214q-7 19-10.5 39t-3.5 41H200v40q0 17 11.5 28.5T240-160h294q8 23 20 43t28 37H240Zm120-520v-80h360v80H360Zm0 120v-80h360v80H360Zm174 320H200h334Z"/></svg></div>
					<div class="order-number">주문번호 ${order_id}의</div>
				<div class="result-info">
					<div class="cong">
					</div>
					<div class="order-result">주문취소 요청이 완료되었습니다.</div>
					<div class="cong">
					</div>
				</div>
				<div class="goto">
					<div class="button-container">
						<button class="simple-button" onclick="location.href='HC'">홈으로</button>
						<button class="simple-button">주문취소/환불 내역 확인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>