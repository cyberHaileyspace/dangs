// DOMContentLoaded 이벤트 리스너 추가
document.addEventListener('DOMContentLoaded', function() {
	// 1. 요소 선택
	const productPriceElement = document.getElementById('product_price');

	console.log(productPriceElement);
	// 2. 텍스트에서 숫자 추출
	const rawPriceText = productPriceElement; // "123456원"

	console.log(rawPriceText);

	const numericPrice = parseInt(rawPriceText.replace('원', '').trim(), 10); // 숫자만 추출

	// 3. 쉼표 추가 (toLocaleString 사용)
	const formattedPrice = numericPrice.toLocaleString() + "원";

	// 4. 포맷된 값 다시 설정
	productPriceElement.textContent = formattedPrice; // "123,456원"
});

//sub category
$(function() {
	let menuVis1 = true;
	let menuVis2 = true;
	let menuVis3 = true;

	$('#b1').click(function() {
		if (menuVis1) {
			$('#menu1').css('visibility', 'visible')
		} else {
			$('#menu1').css('visibility', 'hidden')
		}
		menuVis1 = !menuVis1;
	})
	$('#b2').click(function() {
		if (menuVis2) {
			$('#menu2').css('visibility', 'visible')
		} else {
			$('#menu2').css('visibility', 'hidden')
		}
		menuVis2 = !menuVis2;
	})
	$('#b3').click(function() {
		if (menuVis3) {
			$('#menu3').css('visibility', 'visible')
		} else {
			$('#menu3').css('visibility', 'hidden')
		}
		menuVis3 = !menuVis3;
	})
})

//go to SelectCateC
$(document).ready(function() {
	$('.category').click(function() {
		//    console.log('aaaa');
		var category = $(this).text();

		$.ajax({
			url: 'SelectCateC',  // 서버 요청 URL
			type: 'get',
			data: { category: category },
			success: function(resData) {
				console.log(resData);  // 콘솔에 출력하여 확인

				// 만약 resData가 배열이라면
				if (Array.isArray(resData)) {
					// 기존 내용 초기화
					$('product').empty();

					// forEach로 각 product 데이터 출력
					resData.forEach(function(product) {


						// AJAX 응답 성공 시, product-grid 갱신
						updateProductGrid(resData);
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

//go to SelectCateC - sub로
$(document).ready(function() {
	$('.sub-category').click(function() {
		//    console.log('aaaa');
		var sub_category = $(this).text();

		$.ajax({
			url: 'SelectSubCateC',  // 서버 요청 URL
			type: 'get',
			data: { sub_category: sub_category },
			success: function(resData) {
				console.log(resData);  // 콘솔에 출력하여 확인

				// 만약 resData가 배열이라면
				if (Array.isArray(resData)) {
					// 기존 내용 초기화
					$('product').empty();

					// forEach로 각 product 데이터 출력
					resData.forEach(function(product) {
						// 원하는 컬럼만 추출하여 HTML에 추가
						/*$('product').append(
							"<div class='product'>" +
							"<div class='product-name'>" + product.product_name + "</div>" +
							"<div class='product-price'>" + product.product_price + "원</div>" +
							"<div class='product-category'>" + product.product_category + "</div>" +
							"</div>"
						);*/

						// AJAX 응답 성공 시, product-grid 갱신
						updateProductGrid(resData);
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

// 제품 목록 갱신 함수
function updateProductGrid(products) {
	// product-grid 비우기
	$('.product-grid').empty();

	// 서버에서 받은 제품 데이터로 그리드 업데이트
	$.each(products, function(index, product) {
		var productHtml =
			"<div class='product' onclick=\"location.href='ProductC?product_id=" + product.product_id + "'\">" +
			"<div class='product-img'>" +
			"<img src='" + product.product_img + "' alt='product-img'>" +
			"</div>" +
			"<div class='product-name'>" + product.product_name + "</div>" +
			"<div class='product-price'>" +
			new Intl.NumberFormat().format(product.product_price) + "원" +
			"</div>" +
			"<div class='product-date'>개시일 : " + product.product_date + "</div>" +
			"</div>";

		// 제품을 product-grid에 추가
		$('.product-grid').append(productHtml);
	});
}