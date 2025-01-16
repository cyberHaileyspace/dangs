$(function() {

	$('#purchase').click(function() {
		let product_id = document.getElementById('product-id').textContent.trim();
		let ordered_stock = document.getElementById('number').textContent.trim();
		let total_price = document.getElementById('totalPrice2').textContent.trim();

		let total_price_N = parseInt(total_price.replace('원', '').replace(',', ''), 10);
		let del_price;

		if (total_price_N >= 100000) {
			del_price = 0;
		} else {
			del_price = 3000;
		}

		var xhr = new XMLHttpRequest();
		xhr.open('GET', 'checkLogin', true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				if (xhr.responseText === 'loggedIn') {
					window.location.href = 'PurchaseC?product_id=' + product_id
						+ '&ordered_stock=' + ordered_stock
						+ '&total_price=' + total_price_N 
						+ '&del_price=' + del_price;
				} else if (xhr.responseText === 'notLoggedIn') {
					window.location.href = 'loginC';
				}
			}
		};
		xhr.send();
	});
})
// 설명---------------------------------

// id가 "apple"인 걸 눌렀을 때 :
// get 방식으로 checkLogin이라는 servlet에 요청
// checkLogin servlet에서 로그인 여부에 따라
// notLoggedIn 또는 loggedIn이라는 글자를 반환
// 두번째 if문에서 하고싶은거 하면 됨
// js 함수를 넣어서 계속 이어가기도 가능

