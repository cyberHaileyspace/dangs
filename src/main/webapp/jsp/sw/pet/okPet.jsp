<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Pets</title>
    <link rel="stylesheet" type="text/css" href="css/sw/okPet.css">
</head>
<body>
    <div class="okPet-container" id="okPetContainer">
        <div class="okPet-header">우리 집 강아지들</div>
        <div class="okPet-content">
            <c:forEach var="i" items="${pets}">
                <div class="okPet-item" onclick="showPetInfo(${i.petId})">
                    <img alt="Pet Photo" src="img/petProfile/${i.petPhoto}" class="okPet-image">
                    <div class="okPet-name">${i.petName}</div>
                </div>
            </c:forEach>
            <!-- 펫 추가 버튼 -->
            <div class="okPet-item">
                <img alt="Pet Photo" src="img/plusDog.png" class="okPet-image">
                <div class="okPet-name" id="addMorePet">펫 추가하기</div>
            </div>
        </div>
    </div>
        <div class="okPet-info" id="petInfo" style="display: none;">
            <!-- 펫 정보가 여기에 동적으로 추가됩니다. -->
        </div>
    <script type="text/javascript">
 // 펫 아이템 클릭 시 실행되는 함수
    function showPetInfo(petId) {
        // 펫 정보를 가져오는 부분 (여기서는 예시로 id를 사용)
        const petInfo = {
            // 여기서 petId를 사용해 서버에서 해당 pet의 정보를 가져오는 로직을 작성
            // 아래는 예시 데이터
            petName: '강아지 이름',
            petAge: '2년',
            petBreed: '골든 리트리버',
            petDescription: '활발하고 사랑스러운 강아지입니다.'
        };

        // petInfo에 대한 동적 내용 생성
        const petInfoDiv = document.getElementById('petInfo');
        petInfoDiv.innerHTML = `
            <h2>${petInfo.petName}</h2>
            <p><strong>나이:</strong> ${petInfo.petAge}</p>
            <p><strong>품종:</strong> ${petInfo.petBreed}</p>
            <p><strong>설명:</strong> ${petInfo.petDescription}</p>
        `;

        // 슬라이드 영역 확장
        const container = document.getElementById('okPetContainer');
        container.classList.add('expanded');
        petInfoDiv.style.display = 'block';
    }
    </script>
</body>
</html>