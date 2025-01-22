<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/myCanceledOrder.css">
<script type="text/javascript" src="js/jh/myCanceledOrder.js"
	defer="defer"></script>
</head>
<body>
	<div class="title-wrapper">
		<div class="title">취소/환불내역</div>
		<div class="process">
			<span class="prevPage"> ${prev_page} </span> <span class="next-stage">&gt;</span>
			<span class="title-now">취소/환불내역</span>
		</div>
	</div>
	<div class="mainBody">
		<div class="search-order">
			<div class="search-order-title">취소내역 검색</div>
			<div class="under-search-order">
				<input type="text" class="search-order-input" id="searchOrderInput"
					placeholder="검색어 입력">
			</div>
		</div>

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
		<div id="orderContainer">
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
					<div class="buttons">
						<button class="toggleMoreInfoBtn">주문상세</button>
						<button class="toggleDetailBtn">상세요청</button>
						<button class="toggleDeliveryStatusBtn">진행상태</button>
					</div>
				</div>
				<!-- 주문상세 토글 -->
				<div class="more-info" style="display: none;">
					<div class="more-info-title">주문상세</div>
					<div class="mic-wrapper">
						<div class="more-info-category">
							<div>배송지</div>
							<div>전화번호</div>
							<div>배송문의</div>
							<div>결제은행</div>
							<div>할부</div>
						</div>
						<div class="space-place1"></div>
						<div class="space-place2"></div>
						<div class="more-info-info">
							<div>${orders.order_address}</div>
							<div>${orders.order_tel}</div>
							<div>${orders.order_request}</div>
							<div>${orders.order_bank}</div>
							<div>${orders.order_installments}</div>
						</div>
						<div class="space-place1"></div>
						<div class="space-place1"></div>
						<div class="space-place1"></div>
						<div class="space-place3"></div>
					</div>
				</div>

				<!-- 상세요청 토글 -->
				<c:forEach var="cancels" items="${cancels}">
				<div class="details" style="display: none;">
					<div class="details-title">상세요청</div>
					<div class="detail-wrapper">
						<div class="detail-category">
							<div>요청일</div>
							<div>취소이유</div>
							<div>환불은행</div>
							<div>환불계좌</div>
							<div>예금주명</div>
						</div>
						<div class="space-place1"></div>
						<div class="space-place2"></div>
						<div class="detail-info">
							<div>${cancels.co_date}</div>
							<div>${cancels.co_reason}</div>
							<div>${cancels.co_bank}</div>
							<div>${cancels.co_account}</div>
							<div>${cancels.co_accountName}</div>
						</div>
						<div class="space-place1"></div>
						<div class="space-place1"></div>
						<div class="space-place1"></div>
						<div class="space-place3"></div>
					</div>
				</div>
				</c:forEach>
				
				<!-- 배송조회 토글 -->
				<div class="delivery-status" style="display: none;">
					<div class="status-imgs">
						<div
							class="step1 ${orders.order_status == '주문취소' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path
									d="m760-183-85 84-56-56 84-85-84-85 56-56 85 84 85-84 56 56-84 85 84 85-56 56-85-84ZM240-80q-50 0-85-35t-35-85v-120h120v-560h600v415q-19-7-39-10.5t-41-3.5v-321H320v480h214q-7 19-10.5 39t-3.5 41H200v40q0 17 11.5 28.5T240-160h294q8 23 20 43t28 37H240Zm120-520v-80h360v80H360Zm0 120v-80h360v80H360Zm174 320H200h334Z" /></svg>
						</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path d="m321-80-71-71 329-329-329-329 71-71 400 400L321-80Z" /></svg>
						</div>
						<div
							class="step2 ${orders.order_status == '상품 준비중' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path d="M382-240 154-468l57-57 171 171 367-367 57 57-424 424Z" /></svg>
						</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path d="m321-80-71-71 329-329-329-329 71-71 400 400L321-80Z" /></svg>
						</div>
						<div
							class="step3 ${orders.order_status == '배송시작' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path
									d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z" /></svg>
						</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path d="m321-80-71-71 329-329-329-329 71-71 400 400L321-80Z" /></svg>
						</div>
						<div class="step4 ${orders.order_status == '배송중' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path
									d="M260-361v-40H160v-80h200v-80H200q-17 0-28.5-11.5T160-601v-160q0-17 11.5-28.5T200-801h60v-40h80v40h100v80H240v80h160q17 0 28.5 11.5T440-601v160q0 17-11.5 28.5T400-401h-60v40h-80Zm298 240L388-291l56-56 114 114 226-226 56 56-282 282Z" /></svg>
						</div>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path d="m321-80-71-71 329-329-329-329 71-71 400 400L321-80Z" /></svg>
						</div>
						<div
							class="step5 ${orders.order_status == '배송완료' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
								<path
									d="M720-120H280v-520l280-280 50 50q7 7 11.5 19t4.5 23v14l-44 174h258q32 0 56 24t24 56v80q0 7-2 15t-4 15L794-168q-9 20-30 34t-44 14Zm-360-80h360l120-280v-80H480l54-220-174 174v406Zm0-406v406-406Zm-80-34v80H160v360h120v80H80v-520h200Z" /></svg>
						</div>
					</div>
					<div class="step-info">
						<div
							class="step1 ${orders.order_status == '주문취소' ? 'active' : ''}">취소요청</div>
						<div class="space"></div>
						<div
							class="step2 ${orders.order_status == '상품 준비중' ? 'active' : ''}">검토중</div>
						<div class="space"></div>
						<div
							class="step3 ${orders.order_status == '배송시작' ? 'active' : ''}">취소완료</div>
						<div class="space"></div>
						<div class="step4 ${orders.order_status == '배송중' ? 'active' : ''}">환불
							진행중</div>
						<div class="space"></div>
						<div
							class="step5 ${orders.order_status == '배송완료' ? 'active' : ''}">환불완료</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>