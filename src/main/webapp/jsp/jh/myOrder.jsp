<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/myOrder.css">
<script type="text/javascript" src="js/jh/myOrder.js" defer="defer"></script>
</head>
<body>
	<div class="title-wrapper">
		<div class="title">주문내역</div>
		<div class="process">
			<span class="prevPage"> 마이페이지 </span> <span class="next-stage">&gt;</span>
			<span class="title-now">주문내역</span>
		</div>
	</div>
	<div class="mainBody">
		<div class="search-order">
			<div class="search-order-title">주문 검색</div>
			<div class="under-search-order">
				<input type="text" class="search-order-input" id="searchOrderInput"
					placeholder="검색어 입력">
			</div>
		</div>

		<div class="order-category">
			<div class="order-num">No.</div>
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
			<c:choose>
				<c:when test="${not empty orders}">
			
			<c:forEach var="orders" items="${orders}" varStatus="st">
				<div class="per-order" data-title="${orders.product_name}">
					<div>${st.count }</div>
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
						<button class="toggleDeliveryStatusBtn">배송조회</button>
						<button class="toggleCancelRefundBtn" data-order-id="${orders.order_id}">취소/환불</button>
					</div>
				</div>
				<!-- 주문상세 토글 -->
				<div class="more-info" style="display: none;">
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

				<!-- 배송조회 토글 -->
				<div class="delivery-status" style="display: none;">
					<div class="status-imgs">
						<div
							class="step1 ${orders.order_status == '결제완료' ? 'active' : ''}">
							<svg xmlns="http://www.w3.org/2000/svg" height="24px"
								viewBox="0 -960 960 960" width="24px">
							<path
									d="M444-200h70v-50q50-9 86-39t36-89q0-42-24-77t-96-61q-60-20-83-35t-23-41q0-26 18.5-41t53.5-15q32 0 50 15.5t26 38.5l64-26q-11-35-40.5-61T516-710v-50h-70v50q-50 11-78 44t-28 74q0 47 27.5 76t86.5 50q63 23 87.5 41t24.5 47q0 33-23.5 48.5T486-314q-33 0-58.5-20.5T390-396l-66 26q14 48 43.5 77.5T444-252v52Zm36 120q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z" /></svg>
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
							<path
									d="M440-183v-274L200-596v274l240 139Zm80 0 240-139v-274L520-457v274Zm-80 92L160-252q-19-11-29.5-29T120-321v-318q0-22 10.5-40t29.5-29l280-161q19-11 40-11t40 11l280 161q19 11 29.5 29t10.5 40v318q0 22-10.5 40T800-252L520-91q-19 11-40 11t-40-11Zm200-528 77-44-237-137-78 45 238 136Zm-160 93 78-45-237-137-78 45 237 137Z" /></svg>
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
									d="M240-160q-50 0-85-35t-35-85H40v-440q0-33 23.5-56.5T120-800h560v160h120l120 160v200h-80q0 50-35 85t-85 35q-50 0-85-35t-35-85H360q0 50-35 85t-85 35Zm0-80q17 0 28.5-11.5T280-280q0-17-11.5-28.5T240-320q-17 0-28.5 11.5T200-280q0 17 11.5 28.5T240-240ZM120-360h32q17-18 39-29t49-11q27 0 49 11t39 29h272v-360H120v360Zm600 120q17 0 28.5-11.5T760-280q0-17-11.5-28.5T720-320q-17 0-28.5 11.5T680-280q0 17 11.5 28.5T720-240Zm-40-200h170l-90-120h-80v120ZM360-540Z" /></svg>
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
									d="M280-160q-50 0-85-35t-35-85H60l18-80h113q17-19 40-29.5t49-10.5q26 0 49 10.5t40 29.5h167l84-360H182l4-17q6-28 27.5-45.5T264-800h456l-37 160h117l120 160-40 200h-80q0 50-35 85t-85 35q-50 0-85-35t-35-85H400q0 50-35 85t-85 35Zm357-280h193l4-21-74-99h-95l-28 120Zm-19-273 2-7-84 360 2-7 34-146 46-200ZM20-427l20-80h220l-20 80H20Zm80-146 20-80h260l-20 80H100Zm180 333q17 0 28.5-11.5T320-280q0-17-11.5-28.5T280-320q-17 0-28.5 11.5T240-280q0 17 11.5 28.5T280-240Zm400 0q17 0 28.5-11.5T720-280q0-17-11.5-28.5T680-320q-17 0-28.5 11.5T640-280q0 17 11.5 28.5T680-240Z" /></svg>
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
									d="M400-80v-80h520v80H400Zm40-120q0-81 51-141.5T620-416v-25q0-17 11.5-28.5T660-481q17 0 28.5 11.5T700-441v25q77 14 128.5 74.5T880-200H440Zm105-81h228q-19-27-48.5-43.5T660-341q-36 0-66 16.5T545-281Zm114 0ZM40-440v-440h240v58l280-78 320 100v40q0 50-35 85t-85 35h-80v24q0 25-14.5 45.5T628-541L358-440H40Zm80-80h80v-280h-80v280Zm160 0h64l232-85q11-4 17.5-13.5T600-640h-71l-117 38-24-76 125-42h247q9 0 22.5-6.5T796-742l-238-74-278 76v220Z" /></svg>
						</div>
					</div>
					<div class="step-info">
						<div
							class="step1 ${orders.order_status == '결제완료' ? 'active' : ''}">결제완료</div>
						<div class="space"></div>
						<div
							class="step2 ${orders.order_status == '상품 준비중' ? 'active' : ''}">상품
							준비중</div>
						<div class="space"></div>
						<div
							class="step3 ${orders.order_status == '배송시작' ? 'active' : ''}">배송시작</div>
						<div class="space"></div>
						<div class="step4 ${orders.order_status == '배송중' ? 'active' : ''}">배송중</div>
						<div class="space"></div>
						<div
							class="step5 ${orders.order_status == '배송완료' ? 'active' : ''}">배송완료</div>
					</div>
				</div>
			</c:forEach>
				</c:when>
				<c:otherwise>
					<img alt="no-product-img" src="img/gohan.png">
					<div style="margin-top: 50px; text-align: center;" > <h1> ${ment }</h1></div>
					
				</c:otherwise>
			</c:choose>
			<!-- paging -->
			<div class="paging-container">
			<a class="prev-btn" href="MyOrderPageC?p=1"
				style="text-decoration: none;">‹</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a class="page-num" href="MyOrderPageC?p=${i}"
					style="text-decoration: none;">${i}</a>
			</c:forEach>
			<a class="next-btn" href="MyOrderPageC?p=${pageCount}"
				style="text-decoration: none;">›</a>
		</div>
			
		</div>

	</div>
</body>
</html>