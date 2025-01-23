$(function() {
	document.querySelectorAll('.okPet-item').forEach(item => {
		item.addEventListener('click', function() {
			const petId = this.getAttribute('data-pet-id');
			showPetInfo(petId);
		});
	});
	function showPetInfo(petId) {
		const xhr = new XMLHttpRequest();
		xhr.open("GET", `/dangs/getPetInfoC?petId=${petId}`, true);

		xhr.onload = function() {
			if (xhr.status === 200) {
				const petInfo = JSON.parse(xhr.responseText);
				const petInfoDiv = document.getElementById('petInfo');

				// 받은 petInfo에서 petBirthStr을 사용해서 HTML 업데이트
				petInfoDiv.innerHTML = `
                	<div class="detailInfoWrapper">
	<div class="detailInfoImg"><img alt="" src="img/petProfile/${petInfo.petPhoto}"></div>
	<div class="detailInfoAll">
                    <p><strong>이름:</strong> ${petInfo.petName}</p>
					<p><strong>생일:</strong> ${petInfo.petBirthStr}</p>
					<p><strong>성별:</strong> ${petInfo.petGender}</p>
                    <p><strong>품종:</strong> ${petInfo.petType}</p>
					<p><strong>분류:</strong> ${petInfo.petSize}</p>
                    <p><strong>설명:</strong> ${petInfo.petDescription}</p></div>
	<div id="closeDetailInfo">닫기</div>
	</div>
                `;

				//                const container = document.getElementById('okPetContainer');
				//                container.classList.add('expanded');

				// #petInfo 영역을 보이게 함
				petInfoDiv.style.display = 'block';
				// 닫기버튼 기능
				$('#closeDetailInfo').click(function() {
					petInfoDiv.style.display = 'none';
				});
			}
		};

		xhr.send();
	}



});