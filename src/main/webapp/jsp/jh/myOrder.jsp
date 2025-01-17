<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/myOrder.css">
</head>
<body>
	<div class="title-wrapper">
		<div class="title">주문내역</div>
		<div class="process">
			<span class="prevPage"> ${prev_page} </span> <span class="next-stage">&gt;</span>
			<span class="title-now">주문내역</span>
		</div>
	</div>
	<div class="mainBody">
		<div class="search-order">
			<div class="search-order-title">주문 검색</div>
			<div class="under-search-order">
				<input type="text" class="search-order-input">
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

		<c:forEach var="orders" items="${orders}">
			<div class="per-order">
				<div>${orders.order_date}</div>
				<div>${orders.order_id}</div>
				<%-- <c:forEach var="products" items="${products}"> --%>
					<div class="img-wrapper">
						<img class="product_img2" alt="product_img"
							src="${orders.product_img}"></img>
					</div>
					<!-- product -->
					<div class="name-wrapper">
						<div class="product_name2">${orders.product_name}</div>
					</div>
					<!-- product -->
				<%-- </c:forEach> --%>
				<div>${orders.order_stock}</div>
				<div>${orders.order_price}</div>
				<div>${orders.order_status}</div>
				<div class="buttons">
					<button class="toggleMoreInfoBtn">주문상세</button>
					<button>배송조회</button>
					<button>취소/환불</button>
				</div>
			</div>
			<div class="more-info"  style="display: none;">
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
		</c:forEach>

	</div>
	
	<script>
    const toggleButtons = document.querySelectorAll(".toggleMoreInfoBtn");
    const moreInfoDivs = document.querySelectorAll(".more-info");

    toggleButtons.forEach((button, index) => {
        button.addEventListener("click", () => {
            const moreInfoDiv = moreInfoDivs[index]; // 버튼과 대응하는 .more-info div

            // active 클래스 토글
            if (moreInfoDiv.classList.contains("active")) {
                moreInfoDiv.classList.remove("active"); // 사라지기
                setTimeout(() => (moreInfoDiv.style.display = "none"), 300); // 전환 후 display를 none으로
            } else {
                moreInfoDiv.style.display = "flex"; // 먼저 flex로 표시
                setTimeout(() => moreInfoDiv.classList.add("active"), 10); // 부드럽게 보이기
            }
        });
    });
</script>
	
</body>
</html>