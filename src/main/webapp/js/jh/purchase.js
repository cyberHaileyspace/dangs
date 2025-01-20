document.addEventListener("DOMContentLoaded", () => {
	const creditCardRadio = document.getElementById("credit-card");
	const pointOnlyRadio = document.getElementById("point-only");

	// 신용/체크카드 선택 시 포인트 결제 체크 해제
	creditCardRadio.addEventListener("change", () => {
		if (creditCardRadio.checked) {
			pointOnlyRadio.checked = false;
		}
	});

	// 포인트 결제 선택 시 신용/체크카드 체크 해제
	pointOnlyRadio.addEventListener("change", () => {
		if (pointOnlyRadio.checked) {
			creditCardRadio.checked = false;
		}
	});
});

$(document).ready(function() {
	$('.toggle-svg').click(function() {
		// SVG 회전 토글
		$(this).toggleClass('rotated');

		// 테이블 슬라이드 토글
		$('.radio-table').slideToggle(300); // 300ms 동안 슬라이드
	});
});

$(document).ready(function() {
	// 'agree'를 클릭했을 때 detail-table-hidden 표시/숨김
	$('.agree').click(function() {
		$('.detail-table-hidden').slideToggle(300); // 300ms 동안 나타나거나 사라짐
	});
});

// 총금액에서 유저가 입력한 만큼 빼서 최종결제금액에 담는 로직

document.addEventListener("DOMContentLoaded", () => {
	const totalPriceElement = document.querySelector("#total-price2");
	const usagePointInput = document.querySelector("#usage-point-input");
	const finalPriceElement = document.querySelector("#final-price2");
	const hiddenTotalPriceInput = document.querySelector("#hidden-total-price34");

	// 총 금액 가져오기 (숫자로 변환)
	const totalPrice = parseInt(totalPriceElement.dataset.totalPrice, 10);

	// 최종 금액 계산 함수
	const updateFinalPrice = () => {
		// 사용자가 입력한 값을 가져옴 (숫자로 변환)
		let usagePoint = parseInt(usagePointInput.value, 10);

		// 유효하지 않은 값 처리 (빈칸 또는 숫자가 아닌 경우)
		if (isNaN(usagePoint) || usagePoint < 0) {
			usagePoint = 0;
		}

		// 최종 결제 금액 계산
		const finalPrice = Math.max(totalPrice - usagePoint, 0); // 음수 방지

		// 최종 결제 금액 업데이트
		finalPriceElement.textContent = `${finalPrice}원`;

		// 숨겨진 입력 필드 업데이트
		hiddenTotalPriceInput.value = finalPrice;
	};

	// 페이지 로드 시 초기 최종 금액 계산
	updateFinalPrice();

	// 입력 이벤트 리스너 추가 (사용자가 값을 변경할 때 호출)
	usagePointInput.addEventListener("input", updateFinalPrice);
});

// 동의 안하면 결제 못넘어가게
function confirm_purchase(event) {
	// 두 개의 라디오 버튼 요소 가져오기
	const uncheckedRadio1 = document.querySelector('input[name="confirm1"]:not(:checked)');
	const uncheckedRadio2 = document.querySelector('input[name="confirm2"]:not(:checked)');

	const confirm0 = document.getElementById('confirm0');
	const confirm3 = document.getElementById('confirm3');
	
	// 두 라디오 버튼이 모두 체크되지 않았을 경우
	if (uncheckedRadio1 || uncheckedRadio2) {
		event.preventDefault(); // 버튼 클릭 기본 동작 막기
		alert("모든 확인 사항에 동의해야 결제가 가능합니다.");

		// 체크되지 않은 input으로 포커스를 이동
		if (uncheckedRadio1) {
			uncheckedRadio1.focus();
			confirm0.style.color = "red"; 
		//return;
		} else if (uncheckedRadio2) {
			uncheckedRadio2.focus();
			confirm3.style.color = "red"; 
		//return;
		}
		return false;
	}

	// 두 라디오 버튼이 모두 체크된 경우
	alert("결제가 완료되었습니다.");
	return true;
}