// 초기 값 설정
let count = 1;

// 요소 선택
const numberDisplay = document.getElementById('number');
const decreaseButton = document.getElementById('decrease');
const increaseButton = document.getElementById('increase');
const totalPriceDisplay = document.getElementById('totalPrice');
const totalPriceDisplay2 = document.getElementById('totalPrice2');

const firstPrice = document.getElementById('product_price');

// 상품 가격 가져오기 (div 내부 텍스트 값 사용)
const productPrice = parseInt(document.getElementById('product_price').textContent.trim(), 10);

// 초기 총 가격 표시
updateDisplay();

// 감소 버튼 클릭 이벤트
decreaseButton.addEventListener('click', () => {
	if (count > 1) {
		count--;
		updateDisplay();
	}
});

// 증가 버튼 클릭 이벤트
increaseButton.addEventListener('click', () => {
	if (count < 50) {
		count++;
		updateDisplay();
	}
});

// 숫자 및 총 가격 업데이트 함수
function updateDisplay() {
	numberDisplay.textContent = count; // 수량 표시
	totalPriceDisplay.textContent = (count * productPrice).toLocaleString() + "원"; // 총 가격 표시

	if ((count * productPrice) < 100000) {
		totalPriceDisplay2.textContent = (count * productPrice + 3000).toLocaleString() + "원"; // 총 가격 표시
	} else {
		totalPriceDisplay2.textContent = (count * productPrice).toLocaleString() + "원"; // 총 가격 표시		
	}

	firstPrice.textContent = productPrice.toLocaleString() + '원';
}

//---------------------------------------------------------------

// 하트 누르면 색바뀜 + 원래대로 돌아오기
const heart = document.querySelector('.heart');

const origin = '♡︎';
const change = '♥︎︎';

heart.addEventListener('click', () => {
	if (heart.innerText === origin) {
		heart.innerText = change;
	} else {
		heart.innerText = origin;
	}
});

//---------------------------------------------------------------

//go to DetailC
$(document).ready(function() {
	$('#detail').click(function() {
	document.getElementById('detail').style.backgroundColor = "#F4F4F4";
	document.getElementById('comment').style.backgroundColor = "white";
		console.log('aaaa');
		var productId = $(this).closest('.product').find('.product-id').text();

		$.ajax({
			url: 'DetailC',  // 서버 요청 URL
			type: 'get',
			data: { product_id: productId },
			success: function(resData) {
				console.log(resData);  // 콘솔에 출력하여 확인

				// 만약 resData가 배열이라면
				if (Array.isArray(resData)) {
					// 기존 내용 초기화
					$('detail').empty();

					// forEach로 각 detail 데이터 출력
					resData.forEach(function(detail) {


						// AJAX 응답 성공 시, product-grid 갱신
						updateProductDetails(resData);
					});
				} else {
					console.error('resData는 배열이 아닙니다');
				}
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 실패:', error);
			}
		});
	})
});


//go to CommentC
$(document).ready(function() {
	$('#comment').click(function() {
	document.getElementById('comment').style.backgroundColor = "#F4F4F4";
	document.getElementById('detail').style.backgroundColor = "white";
		console.log('cccc');
		var productId = $(this).closest('.product').find('.product-id').text();

		$.ajax({
			url: 'CommentC',  // 서버 요청 URL
			type: 'get',
			data: { product_id: productId },
			success: function(resData) {
				console.log(resData);  // 콘솔에 출력하여 확인

				// 만약 resData가 배열이라면
				if (Array.isArray(resData)) {
					// 기존 내용 초기화
					$('comment').empty();

					// forEach로 각 detail 데이터 출력
					resData.forEach(function(comment) {


						// AJAX 응답 성공 시, product-grid 갱신
						updateProductComment(resData);
					});
				} else {
					console.error('resData는 배열이 아닙니다');
				}
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 실패:', error);
			}
		});
	})
});

// 제품 상세정보 갱신
function updateProductDetails(details) {
	// product-grid 비우기
	$('.long-description').empty();

	// details 데이터를 순회하면서 HTML 생성
    $.each(details, function(index, detail) {
        var detailHtml =
            "<div class='detail'>" +
            "<div class='detail1'><img src='" + detail.pd_detail1 + "' alt='detail1'></div>" +
            "<div class='detail2'><img src='" + detail.pd_detail2 + "' alt='detail2'></div>" +
            "<div class='detail3'><img src='" + detail.pd_detail3 + "' alt='detail3'></div>" +
            "</div>";

		// 상세 정보를 long-description에 추가
		$('.long-description').append(detailHtml);
	});
}

// 제품 comment 갱신
function updateProductComment(comments) {
	$('.comment-section').empty();

	// comments 데이터를 순회하면서 HTML 생성
    $.each(comments, function(index, comment) {
        var commentHtml =
        	"<div class='upper'>" +
            "<div class='upp1'> comment </div>" +
            "<div class='upp-div'>" +
            "<div class='upp2'> user </div>" +
            "<div class='upp3'> date </div>" +
            "</div>" +
            "</div>" +
            "<div class='comment'>" +
            "<div class='comment1'>" + comment.pc_comment + "</div>" +
            "<div class='userDate'>" +
            "<div class='comment2'>" + comment.pc_user + "</div>" +
            "<div class='comment3'>" + comment.pc_date + "</div>" +
            "</div>" +
            "</div>";

		// 상세 정보를 long-description에 추가
		$('.comment-section').append(commentHtml);
	});
}