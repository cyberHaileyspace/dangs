$(document).ready(function() {
	// 사용자 ID (임시 하드코딩 또는 세션에서 가져오기)
	const userId = "your_user_id";

	// 관심 등록 데이터 가져오기
	$.ajax({
		url: 'GetFavController',
		type: 'GET',
		data: { userId: userId },
		dataType: 'json',
		success: function(data) {
			console.log(data);

			// HTML 초기화
			$('#favoritesList').empty();

			if (data.length === 0) {
				$('#favoritesList').html('<p>관심 등록된 데이터가 없습니다.</p>');
				return;
			}

			// 데이터 순회 및 HTML 생성
			data.forEach(item => {
				const gender = item.sexCd === 'F' ? '여아' : item.sexCd === 'M' ? '남아' : '알 수 없음';
				const neuterStatus = item.neuterYn === 'Y' ? '중성화 완료' : '중성화 미완료';

				const itemHtml = `
                            <div class="favorite-item">
                                <img src="${item.popfile}" alt="이미지" class="thumbnail">
                                <p><strong>품종:</strong> ${item.kindCd}</p>
                                <p><strong>나이:</strong> ${item.age}</p>
                                <p><strong>발생 장소:</strong> ${item.happenPlace}</p>
                                <p><strong>성별:</strong> ${gender}</p>
                                <p><strong>중성화 여부:</strong> ${neuterStatus}</p>
                            </div>
                        `;
				$('#favoritesList').append(itemHtml);
			});
		},
		error: function(xhr, status, error) {
			console.error('Error fetching favorites:', { xhr, status, error });
			$('#favoritesList').html('<p>데이터를 불러오는데 실패했습니다.</p>');
		}
	});
});


