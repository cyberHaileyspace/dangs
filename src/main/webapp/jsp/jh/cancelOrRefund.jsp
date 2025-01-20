<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/cancelOrRefund.css">
</head>
<body>
	<form action="CancelOrRefundC" method="post">
		<div class="title-wrapper">
			<div class="title">취소/환불</div>
			<div class="process">
				<span class="prevPage"> ${prev_prev_page} </span> <span
					class="next-stage">&gt;</span> <span class="prevPage">
					${prev_page} </span> <span class="next-stage">&gt;</span> <span
					class="title-now">취소/환불</span>
			</div>
		</div>

		<div class="container">
			<h1>취소/환불 요청</h1>

			<!-- 취소/환불 정책 안내 -->
			<section class="policy">
				<h2>취소/환불 정책 안내</h2>
				<p>구매일로부터 7일 이내에 미사용 상품에 한해 취소 및 환불이 가능합니다. 자세한 내용은 고객 지원 센터로
					문의해주세요.</p>
			</section>

			<!-- 주문 상세 정보 -->
			<section class="order-details">
				<h2>주문 상세 정보</h2>
				<div class="order-category">
					<div class="order-date">
						<b>주문일</b>
					</div>
					<div class="order-id">주문번호</div>
					<div class="product-img">이미지</div>
					<div class="product-name">상품명</div>
					<div class="order-quantity">주문수량</div>
					<div class="order-price">결제금액</div>
					<div class="order-status">주문상태</div>
				</div>
				<div class="cr-container">
					<c:forEach var="orders" items="${orders}">
						<div class="per-order" data-title="${orders.product_name}">
							<div>${orders.order_date}</div>
							<div>${orders.order_id}</div>
							<div class="img-wrapper">
								<img class="product_img2" alt="product_img"
									src="${orders.product_img}"></img>
							</div>
							<div class="name-wrapper">
								<div class="product_name2">${orders.product_name}</div>
							</div>
							<div>${orders.order_stock}</div>
							<div>
								<fmt:formatNumber value="${orders.order_price}" type="number"
									groupingUsed="true" />
							</div>
							<div>${orders.order_status}</div>
						</div>
						<!-- 주문상세 -->
						<div class="more-info">
							<div class="more-info-category">
								<div class="del-destination1">배송지</div>
								<div class="phone-num1">전화번호</div>
								<div class="inquiry1">배송문의</div>
								<div class="bank1">결제은행</div>
								<div class="installments1">할부</div>
							</div>
						</div>
						<div class="more-info-info">
							<div class="del-destination2">${orders.order_address}</div>
							<div class="phone-num2">${orders.order_tel}</div>
							<div class="inquiry2">${orders.order_request}</div>
							<div class="bank2">${orders.order_bank}</div>
							<div class="installments2">${orders.order_installments}</div>
						</div>
						<input type="hidden" name="order_id" value="${orders.order_id}">
					</c:forEach>
				</div>
			</section>

			<!-- 취소/환불 이유 입력 -->
			<section class="refund-reason">
				<h2>취소 사유</h2>
				<textarea name="reason" rows="4" placeholder="주문취소 사유를 입력해주세요."></textarea>
			</section>

			<!-- 환불 방법 선택 -->
			<section class="refund-method">
				<h2>환불 계좌</h2>
				<div class="ref-acc">
					<label for="refund-account">은행명:</label>
				</div>
				<select class="select-bank" name="select-bank">
					<option>농협</option>
					<option>국민은행</option>
					<option>하나은행</option>
					<option>우리은행</option>
					<option>롯데</option>
					<option>삼성</option>
					<option>현대</option>
					<option>BC</option>
					<option>토스뱅크</option>
					<option>카카오뱅크</option>
				</select>
				<div class="ref-acc">
					<label for="refund-account">계좌번호:</label>
				</div>
				<input type="text" id="refund-account" name="refund-account"
					placeholder="계좌번호">
				<div class="ref-acc">
					<label for="refund-account">예금주:</label>
				</div>
				<input type="text" id="refund-account" name="account-name"
					placeholder="예금주">
			</section>

			<!-- 제출 버튼 -->
			<div class="submit-button">
				<button type="submit">요청 제출</button>
			</div>
			<!-- 고객 지원 안내 -->
			<section class="customer-support">
				<h2>고객 지원</h2>
				<p>추가 문의 사항이 있으시면 고객 지원 센터로 연락주시기 바랍니다.</p>
				<p>
					<strong>전화:</strong> 010-8639-0899
				</p>
				<p>
					<strong>이메일:</strong> leejinhyun99@naver.com
				</p>
			</section>
		</div>
	</form>
</body>
</html>