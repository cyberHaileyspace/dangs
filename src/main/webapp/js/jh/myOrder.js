// 검색 버튼
document.getElementById('searchOrderInput').addEventListener('input', function() {
	const searchText = this.value.toLowerCase().trim();
	const orders = document.querySelectorAll('.per-order');

	orders.forEach(order => {
		const title = order.dataset.title.toLowerCase();
		if (title.includes(searchText)) {
			order.classList.remove('hidden');
		} else {
			order.classList.add('hidden');
		}
	});
});

// 상세정보 버튼
const toggleButtons = document.querySelectorAll(".toggleMoreInfoBtn");
const moreInfoDivs = document.querySelectorAll(".more-info");

toggleButtons.forEach((button, index) => {
	button.addEventListener("click", () => {
		const moreInfoDiv = moreInfoDivs[index]; // 버튼과 대응하는 .more-info div

		// active 클래스 토글
		if (moreInfoDiv.classList.contains("active")) {
			moreInfoDiv.classList.remove("active"); // 사라지기
			setTimeout(() => (moreInfoDiv.style.display = "none"), 10); // 전환 후 display를 none으로
		} else {
			moreInfoDiv.style.display = "flex"; // 먼저 flex로 표시
			setTimeout(() => moreInfoDiv.classList.add("active"), 10); // 부드럽게 보이기
		}
	});
});

// 배송조회 버튼
document.querySelectorAll(".toggleDeliveryStatusBtn").forEach((button, index) => {
	const deliveryStatus = document.querySelectorAll(".delivery-status")[index];
	button.addEventListener("click", () => {
		deliveryStatus.style.transition = "max-height 0.5s ease";
		if (deliveryStatus.style.display === "none" || !deliveryStatus.style.display) {
			deliveryStatus.style.display = "block";
			deliveryStatus.style.maxHeight = "200px";
		} else {
			deliveryStatus.style.maxHeight = "0";
			setTimeout(() => (deliveryStatus.style.display = "none"), 10);
		}
	});
});

//취소/환불 버튼
const cancelRefundButtons = document.querySelectorAll(".toggleCancelRefundBtn");

cancelRefundButtons.forEach((button) => {
	button.addEventListener("click", (event) => {
		alert("취소/환불 페이지로 이동합니다.");
		const orderId = event.target.getAttribute("data-order-id");
		location.href = `CancelOrRefundC?title-now=주문내역&prevPage=마이페이지&order_id=${orderId}`;
	});
});

const buttons = document.querySelectorAll(
	".toggleMoreInfoBtn, .toggleDeliveryStatusBtn"
);

buttons.forEach((button) => {
	button.addEventListener("click", (event) => {
		const perOrderDiv = event.target.closest(".per-order");
		const moreInfoDiv = perOrderDiv.querySelector(".more-info");
		const deliveryStatusDiv = perOrderDiv.querySelector(".delivery-status");

		// 클릭한 버튼에 따라 현재 콘텐츠를 선택
		let targetDiv;
		if (button.classList.contains("toggleMoreInfoBtn")) {
			targetDiv = moreInfoDiv;
		} else if (button.classList.contains("toggleDeliveryStatusBtn")) {
			targetDiv = deliveryStatusDiv;
		}

		// 현재 열려 있는 모든 `.active` 요소를 닫기
		const allActiveDivs = document.querySelectorAll(
			".more-info.active, .delivery-status.active"
		);
		allActiveDivs.forEach((div) => {
			if (div !== targetDiv) {
				div.classList.remove("active");
				setTimeout(() => (div.style.display = "none"), 300);
			}
		});

		// 클릭한 버튼에 해당하는 콘텐츠 열거나 닫기
		if (targetDiv) {
			if (targetDiv.classList.contains("active")) {
				// 현재 클릭한 콘텐츠가 열려 있으면 닫기
				targetDiv.classList.remove("active");
				setTimeout(() => (targetDiv.style.display = "none"), 0);
			} else {
				// 현재 클릭한 콘텐츠가 닫혀 있으면 열기
				targetDiv.style.display = "block";
				setTimeout(() => targetDiv.classList.add("active"), 10);
			}
		}
	});
});