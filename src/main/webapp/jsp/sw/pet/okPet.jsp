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
                <div class="okPet-item" data-pet-id="${i.petId}">
                    <img alt="Pet Photo" src="img/petProfile/${i.petPhoto}" class="okPet-image">
                    <div class="okPet-name">${i.petName}</div>
                </div>
            </c:forEach>
            <!-- 펫 추가 버튼 -->
            <div class="okPet-item" onclick="location.href='registerPetC'">
                <img alt="Pet Photo" src="img/plusDog.png" class="okPet-image">
                <div class="okPet-name" id="addMorePet">펫 추가하기</div>
            </div>
        </div>
    </div>
        <div class="okPet-info" id="petInfo" style="display: none">
            <!-- 펫 정보가 여기에 동적으로 추가됩니다. -->
        </div>
        

<script type="text/javascript" src="js/sw/okPet.js"></script>
</body>
</html>