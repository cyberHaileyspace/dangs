$(function() {


	let currentPage = 1; // 현재 페이지 번호
	const totalPages = 4; // 총 페이지 수

	// 현재 연도 계산
	const currentYear = new Date().getFullYear();

	// 페이지네이션 버튼 생성 함수
	function renderPagination() {
		const paginationContainer = $('#pagination');
		paginationContainer.empty(); // 기존 버튼 초기화

		for (let i = 1; i <= totalPages; i++) {
			const pageButton = $('<button>')
				.addClass('pagination-number')
				.text(i)
				.data('page', i); // 페이지 번호 저장
			if (i === currentPage) {
				pageButton.addClass('active'); // 현재 페이지 강조
			}
			paginationContainer.append(pageButton);
		}
	}

	// 데이터를 가져와 표시하는 함수
	function loadPageData(pageNo) {
		$.ajax({
			url: 'AjaxController',
			type: 'GET',
			data: { pageNo: pageNo },
			dataType: 'json',
			success: function(resData) {
				console.log(resData);

				const items = resData.response.body.items.item;

				// 결과 초기화
				$('#adoptPosts').empty();

				// 각 항목을 순회하며 HTML 생성
				$.each(items, function(i, ob) {

					// 성별 변환
					let gender = (ob.sexCd === 'F') ? '여아' : (ob.sexCd === 'M') ? '남아' : '알 수 없음';

					// 중성화 여부 변환
					let neuterStatus = (ob.neuterYn === 'Y') ? '중성화 완료' : (ob.neuterYn === 'N') ? '중성화 미완료' : '알 수 없음';

					// kindCd 변환: [개]를 [강아지]로.
					let kindCd = ob.kindCd.replace('[개]', '[강아지]').trim();

					// 나이 계산
					let age = '';
					if (ob.age) {
						const birthYearMatch = ob.age.match(/^(\d{4})/); // 출생 연도 추출 (4자리 숫자)
						const additionalInfoMatch = ob.age.match(/\((.*?)\)/); // 추가 정보 추출 (괄호 안 내용)

						if (birthYearMatch) {
							const birthYear = parseInt(birthYearMatch[1], 10); // 2025
							if (currentYear - birthYear > 0) {
								age = `${currentYear - birthYear}살`;
							} else if (additionalInfoMatch && additionalInfoMatch[1].includes('60일미만')) {
								age = '2개월 미만';
							} else {
								age = '알 수 없음';
							}
						} else {
							age = '알 수 없음';
						}
					} else {
						age = '알 수 없음';
					}

					const itemHtml = `
                        <div class="item">
                            <img src="${ob.popfile}" alt="Thumbnail" class="detail-image" data-id="${ob.desertionNo}">
							<div class="itme-content">                            
                           		<p class="detail-kindCd" data-id="${ob.desertionNo}"><strong> ${kindCd}</strong> </p>
                           		<p> ${age} </p>
                            	<p> ${gender} / ${neuterStatus} </p>
                            	<p> 지역: ${ob.happenPlace}</p>
                        	</div>
                        </div>
                    `;

					$('#adoptPosts').append(itemHtml);
				});

				// 페이지네이션 업데이트
				renderPagination();

			},
			error: function(xhr, status, error) {
				console.log('에러 발생');
				console.log('xhr:', xhr);
				console.log('status:', status);
				console.log('error:', error);
				$('#adoptPosts').html('<p>데이터를 불러오는데 실패했습니다.</p>');
			}
		});
	}

	// 초기 데이터 로드
	loadPageData(currentPage);

	// 이미지 클릭 이벤트
	$(document).on('click', '.detail-image', function() {
		const desertionNo = $(this).data('id');
		window.location.href = `AdoptDetailController?desertionNo=${desertionNo}`;
	});

	// 품종 클릭 이벤트
	$(document).on('click', '.detail-kindCd', function() {
		const desertionNo = $(this).data('id');
		window.location.href = `AdoptDetailController?desertionNo=${desertionNo}`;
	});



	// 이전 페이지 버튼 클릭
	$('#prevPage').click(function() {
		if (currentPage > 1) {
			currentPage--;
			loadPageData(currentPage);
		} else {
			alert('첫 페이지입니다.');
		}
	});

	// 다음 페이지 버튼 클릭
	$('#nextPage').click(function() {
		if (currentPage < totalPages) {
			currentPage++;
			loadPageData(currentPage);
		} else {
			alert('마지막 페이지입니다.');
		}
	});

	// 페이지 번호 클릭 이벤트
	$(document).on('click', '.pagination-number', function() {
		const selectedPage = $(this).data('page');
		currentPage = selectedPage;
		loadPageData(currentPage);
	});

});

