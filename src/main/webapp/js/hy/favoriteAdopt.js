$(document).ready(function() {

	let currentPage = 1; // 현재 페이지 번호


	// 서버에서 데이터를 가져오는 함수
	function loadFavorites() {
		$.ajax({
			url: 'GetFavController', // 관심 공고 데이터를 가져올 컨트롤러
			type: 'GET',
			dataType: 'json', // 서버에서 JSON 형식의 데이터를 반환
			success: function(data) {
				console.log("관심 공고 데이터:", data);

				// 기존 데이터를 초기화
				$('#favoritesList').empty();

				if (data.length === 0) {
					$('#favoritesList').html('<p>관심 등록된 데이터가 없습니다.</p>');
					return;
				}

				// 데이터 순회 및 HTML 생성
				data.forEach(item => {
					
				// 성별 변환
					let gender = (item.sexCd === 'F') ? '여아' : (item.sexCd === 'M') ? '남아' : '알 수 없음';

					// 중성화 여부 변환
					let neuterStatus = (item.neuterYn === 'Y') ? '중성화 완료' : (item.neuterYn === 'N') ? '중성화 미완료' : '알 수 없음';

					// kindCd 변환: [개]를 [강아지]로.
					let kindCd = item.kindCd.replace('[개]', '[강아지]').trim();

					// 나이 계산
					let age = '';
					if (item.age) {
						const birthYearMatch = item.age.match(/^(\d{4})/); // 출생 연도 추출 (4자리 숫자)
						const additionalInfoMatch = item.age.match(/\((.*?)\)/); // 추가 정보 추출 (괄호 안 내용)

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
                        <div class="favorite-item" data-id="${item.desertionNo}">
                            <img src="${item.popfile}" alt="이미지" class="thumbnail">
                            <p><strong>품종:</strong> ${kindCd}</p>
                            <p><strong>나이:</strong> ${age}</p>
                            <p><strong>발생 장소:</strong> ${item.happenPlace}</p>
                            <p><strong>성별:</strong> ${gender}</p>
                            <p><strong>중성화 여부:</strong> ${neuterStatus}</p>
                        </div>
                    `;
					$('#favoritesList').append(itemHtml);
				});
			},
			error: function(xhr, status, error) {
				console.error("관심 공고 데이터 로드 실패:", { xhr, status, error });
				$('#favoritesList').html('<p>데이터를 불러오는데 실패했습니다.</p>');
			}
		});
	}

	// 관심 공고 데이터 로드
	loadFavorites();

	$(document).on('click', '.favorite-item', function() {
		const desertionNo = $(this).data('id');
		window.location.href = `AdoptDetailController?desertionNo=${desertionNo}`;
	});
});
