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
			<div class="title">상품등록</div>
			<div class="process">
				<span class="prevPage">
					마이페이지</span> <span class="next-stage">&gt;</span> <span
					class="title-now">상품등록</span>
			</div>
		</div>

		<div class="container">
			<h1>상품 정보 입력</h1>

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