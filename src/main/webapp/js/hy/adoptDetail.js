document.addEventListener('DOMContentLoaded', () => {

	const animalDetails = document.getElementById('animalDetail').value;

	const detailContainer = document.getElementById('detail-container');

	if (animalDetails) {

		try {
			// JSON 데이터를 파싱
			const animal = JSON.parse(animalDetails);

			let kindCd = animal.kindCd.replace('[개]', '[강아지]').trim();

			let age = "";

			if (animal.age) {
				const birthYearMatch = animal.age.match(/^(\d{4})/); // 출생 연도 추출
				const additionalInfoMatch = animal.age.match(/\((.*?)\)/); // 추가 정보 추출 (괄호 안 내용)

				if (birthYearMatch) {
					const birthYear = parseInt(birthYearMatch[1], 10); // 출생 연도 파싱
					const currentYear = new Date().getFullYear(); // 현재 연도

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
			// 상세 정보를 HTML로 생성
			const contentHtml = `
            	<div class="animalInfo">
            		<div class="animalDetailImg">
                		<img src="${animal.popfile}" alt="Animal Image" >
                	</div>
                	<div class="animalBasicInfo">
                		<div><strong>${kindCd}</strong></div>
                		<div><p>${age}</p></div>
                		<div class="like-button" onclick="checklog()" data-id="${animal.desertionNo}">
                			<i id="heart-icon" class="fa-regular fa-heart" aria-hidden="true"></i>
                		</div>
                	</div>
                	<div>	
                		<p>${animal.sexCd === 'F' ? '여아' : '남아'}</p>
                		<p>${animal.neuterYn === 'Y' ? '중성화 완료' : '중성화 미완료'}</p>
                		<p>${animal.colorCd}</p>
                		<p>${animal.weight}</p>
                		<p>특징: ${animal.specialMark}</p>
                	</div>
                	<div class="animalState">
                		<p>상태 : ${animal.processState}
	                	<p>발견 장소: ${animal.happenPlace}</p>
                	</div>
                <div class="shelterInfo">
                	<strong> 보호소 </strong>
                	<p>보호소 이름: ${animal.careNm}</p>
                	<p>보호소 주소: ${animal.careAddr}</p>
                	<p>보호소 전화번호: ${animal.careTel}</p>
            	</div>
            `;

			// 컨테이너에 상세 정보를 삽입
			detailContainer.innerHTML = contentHtml;

		} catch (error) {
			// JSON 파싱 오류 처리
			console.error('JSON 파싱 오류:', error);
			detailContainer.innerHTML = '<p>데이터를 처리하는 중 오류가 발생했습니다.</p>';
		}

	} else {
		// JSON 데이터가 없는 경우 처리
		detailContainer.innerHTML = '<p>데이터를 불러올 수 없습니다.</p>';
	}

});