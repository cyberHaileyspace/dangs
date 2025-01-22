let animal;
document.addEventListener('DOMContentLoaded', () => {

	const animalDetails = document.getElementById('animalDetail').value;
	const detailContainer = document.getElementById('detail-container');
	animal = JSON.parse(animalDetails);


	
	if (animalDetails) {

		try {
			// JSON 데이터를 파싱


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
                	<div class="animalDetailInfo">
                		<div class="animalBasicInfo">
                			<div class="ap-title">
                				<div>${kindCd}</div>
                				<span></span>
                				<div>${age}</div>
                			</div>
                			<div class="like-button" onclick="checklog(this)" data-id="${animal.desertionNo}">
                				<i id="heart-icon" class="fa-regular fa-heart" aria-hidden="true"></i>
                			</div>
                		</div>
                		<div class="animalDetailInfo">	
                			<div>${animal.sexCd === 'F' ? '여아' : '남아'}</div>
                			<div>${animal.neuterYn === 'Y' ? '중성화 완료' : '중성화 미완료'}</div>
                			<div>${animal.colorCd}</div>
                			<div>${animal.weight}</div>
                			<div>특징: ${animal.specialMark}</div>
                		</div>
                		<div class="animalState">
                			<div>상태 : ${animal.processState}</div>
	                		<div>발견 장소: ${animal.happenPlace}</div>
                		</div>
                	</div>
                </div>
                <div class="shelterInfo">
                	<strong> 보호소 정보 </strong>
                	<p>보호소 이름: ${animal.careNm}</p>
                	<p>보호소 주소: ${animal.careAddr}</p>
                	<p>보호소 전화번호: ${animal.careTel}</p>
                </div>
            	
            `;

			// 컨테이너에 상세 정보를 삽입
			detailContainer.innerHTML = contentHtml;
			likeSet(-1)
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


function likeSet(chk){
	fetch('AdoptionLikeC?adoptLikesVal=' + animal.desertionNo + '&chk='+chk, {
		method: "get",
		headers: {
			'Content-Type': 'application/json', // JSON 데이터를 보낼 경우 설정
		}
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok ' + response.statusText);
			}
			return response.json(); // JSON 응답을 파싱
		})
		.then(data => {
			console.log('GET 요청 데이터:', data); // 응답 데이터 사용
				let icon = document.querySelector("#heart-icon");
			if(data == 1){
				icon.classList.remove("fa-regular");
		        icon.classList.add("fa-solid", "red");
		        icon.dataset.val = data;
			}
				icon.dataset.val = data;
		})
}