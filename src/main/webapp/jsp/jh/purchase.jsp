<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/purchase.css">
<script type="text/javascript" src="js/jh/purchase.js" defer="defer">
</script>
</head>
<body>
	<form action="PurchaseC" method="post">
	<div class="title-wrapper">
		<div class="title">주문/결제</div>
		<div class="process">
			<span class="title-now"> 주문/결제 </span> <span class="next-stage">></span>  <span>주문완료</span>
		</div>
	</div>

	<!-- 주문상품 및 수량 확인 테이블 -->
	<div class="ordered-info">
		<h2 class="ordered-product">결제 상품</h2>
		<table class="ordered-info">
			<tbody>
				<tr>
					<td class="ordered-col1" id="product-name1">제품명</td>
					<td class="ordered-col2" id="product-name2">${product_name}</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="product-price1">제품가격</td>
					<td class="ordered-col2" id="product-price2">${product_price}원</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="stock-quentity1">수량</td>
					<td class="ordered-col2" id="stock-quentity2">${ordered_stock}개</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="delivery-price1">배송비</td>
					<td class="ordered-col2" id="delivery-price2">${del_price}원</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="total-price1">총 금액</td>
					<td class="ordered-col2" id="total-price2"
						data-total-price="${total_price}">${total_price}원</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="useage-point1">포인트 사용</td>
					<td class="ordered-col2" id="useage-point2"><input type="text"
						class="point" id="usage-point-input" value="0">원 / 보유: ${sessionScope.user.point}원</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="final-price1">최종 결제 금액</td>
					<td name="final-price2" class="ordered-col2" id="final-price2">원</td>
				</tr>

			</tbody>
		</table>
		<div class="confirm0" id="confirm0">
			<input type="radio" name="confirm1" value="agree" /> 상기 정보에 틀림이 없음을
			확인하였습니다.
		</div>
	</div>

	<!-- 주문자 정보 및 배송지 확인 테이블 -->
	<div class="customer-info">
		<h2 class="ordered-product">주문자 정보</h2>
		<table class="ordered-info">
			<tbody>
				<tr>
					<td class="ordered-col1" id="customer-name1">주문자명</td>
					<td class="ordered-col2" id="customer-name2">${sessionScope.user.name}</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="customer-quentity1">전화번호</td>
					<td class="ordered-col2" id="customer-quentity2">
						<input type="tel" name="userTel" class="input-phone" value="${sessionScope.user.tel}">
							<div class="submit-info">배송 정보를 받으실 전화번호가 다르실 경우, 해당 전화번호를 입력해주세요.</div></td>
				</tr>

				<tr>
					<td class="ordered-col1" id="customer-email1">e-mail</td>
					<td class="ordered-col2" id="customer-email2">${sessionScope.user.email}</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="customer-addr1">배송주소</td>
					<td class="ordered-col2" id="customer-addr2">
						<div class="customer-address">
							<div>
								<input type="text" name="input-addr" class="input-addr" value="${sessionScope.user.address}">
								<div class="submit-info">배송받으실 주소가 기본 배송지와 다르실 경우, 해당 주소를 입력해주세요.</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td class="ordered-col1" id="del-request1">배송 요청사항</td>
					<td class="ordered-col2" id="del-request2"><input type="text"
						name="input-request" class="input-request" value="요청사항을 작성해주세요."></td>
				</tr>
			</tbody>
		</table>
		<div class="confirm3" id="confirm3">
			<input type="radio" name="confirm2" value="agree" /> 상기 정보에 틀림이 없음을
			확인하였습니다.
		</div>
	</div>

	<!-- 결제 섹션 -->
	<h2 class="payment">결제 수단</h2>
	<div class="payment-method">
		<div class="payment-method-body">
			<div class="this-or-others">
				<section class="payment-method-default">
					<div class="payment-method-section">
						<!-- padding 20px 먹일 div -->
						<div class="card-or-point">
							<span class="payment-method-radio"> <input
								class="type-selector-radio" type="radio" name="payment-method"
								id="credit-card" checked> <label class="next-radio"
								for="credit-card">신용/체크카드</label>
							</span>
						</div>

						<div class="payment-method-option">
							<!-- margin-top: 20px; margin-left: 28px -->
							<div class="bank-list">
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
								<!-- nice-select -->
							</div>
							<div class="purchase-option">
								<select class="select-purchase" name="installments">
									<option>일시불</option>
									<option>1개월 할부</option>
									<option>3개월 할부</option>
									<option>6개월 할부</option>
									<option>12개월 할부</option>
								</select>
							</div>
							<div class="default">
								<input class="check-box" type="checkbox" checked> <label
									class="default-check">기본 결제 수단으로 사용</label>
							</div>
						</div>

					</div>
				</section>
				<div class="description-section">
					<div class="description">• 할부는 5만원 이상부터 가능합니다</div>
					<div class="description">• 해외발급 카드는 모바일 웹에서만 사용 가능합니다</div>
				</div>
				<div class="detail-description">카드할인 및 무이자할부 안내</div>

				<div class="card-or-point">
					<span class="payment-method-radio"> <input
						class="type-selector-radio" type="radio" name="payment-method"
						id="point-only"> <label class="next-radio"
						for="point-only">포인트로만 결제</label>
					</span>
				</div>
			</div>
			<!-- 수정 필요 -->
			<div class="additional-div">
				<section class="other-svg">
					<section class="other-method">다른 결제 수단</section>
					<svg class="toggle-svg" xmlns="http://www.w3.org/2000/svg"
						height="24px" viewBox="0 -960 960 960" width="24px" fill="#000000">
					<path d="M480-564 296-380l-20-20 204-204 204 204-20 20-184-184Z" /></svg>
				</section>

				<div class="radio-table hidden">
					<table>
						<tr>
							<td><span class="payment-method-radio label"> <input
									type="radio" name="payment-method" value="option1"><label
									class="next-pm"> 계좌이체 </label>
							</span></td>
						</tr>
						<tr>
							<td><span class="payment-method-radio label"> <input
									type="radio" name="payment-method" value="option2"><label
									class="next-pm"> 법인카드 </label>
							</span></td>
						</tr>
						<tr>
							<td><span class="payment-method-radio label"> <input
									type="radio" name="payment-method" value="option3"><label
									class="next-pm"> 휴대폰 </label>
							</span></td>
						</tr>
						<tr>
							<td><span class="payment-method-radio label"> <input
									type="radio" name="payment-method" value="option4"><label
									class="next-pm"> 무통장 입금(가상계좌) </label>
							</span></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>
	<div class="last-description">
		<div class="agreement">
			<div class="agree">구매조건 확인 및 결제대행 서비스 약관 동의보기 개인정보 제3자 제공 동의</div>
			<div class="agree">보기</div>
		</div>

		<div class="detail-table-hidden hidden">
			<div class="detail-in-detail">
				<div>서비스 이용약관 동의</div>
				<div>보기</div>
			</div>
			<div class="detail-in-detail">
				<div>개인정보 수집 및 이용 동의</div>
				<div>보기</div>
			</div>
			<div class="detail-in-detail">
				<div>개인정보 제공 및 위탁 동의</div>
				<div>보기</div>
			</div>
		</div>
	</div>

	<div class="agreement">
		<div class="agree">개인정보 제3자 제공 동의</div>
		<div class="agree">보기</div>
	</div>

	<div class="agreement">
		<div class="agree">본 사이트의 개인정보 제3자 제공 동의</div>
		<div class="agree">보기</div>
	</div>
	<div class="last-description2">* 개별 판매자가 등록한 마켓플레이스(오픈마켓) 상품에 대한
		광고, 상품주문, 배송 및 환불의 의무와 책임은 각 판매자가 부담하고, 이에 대하여 본 사이트는 통신판매중개자로서 통신판매의
		당사자가 아니므로 일체 책임을 지지 않습니다.</div>

	<div class="last-check">위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및
		제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.</div>


		<button type="submit" id="paymentBtn" onclick="confirm_purchase(event)">
			<div class="payment-Btn">결제하기</div>
		</button>
		
	<!-- 데이터 숨김자리 -->
	<input type="hidden" name="product_id" value="${product_id}">
	<input type="hidden" name="input-addr" value="${sessionScope.user.address}">
	<input type="hidden" name="customer-quentity2" value="${sessionScope.user.tel}">
	<input type="hidden" name="total-price34" id="hidden-total-price34">
	<input type="hidden" name="orderedStocks" value="${ordered_stock}">
	<!-- ----------- -->
	</form>
</body>
</html>