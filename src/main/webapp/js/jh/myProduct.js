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

