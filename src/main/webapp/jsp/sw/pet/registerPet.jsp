<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>펫 등록하기</title>
    <link rel="stylesheet" type="text/css" href="css/sw/registerPet.css">
</head>
<body>
    <div class="register-pet-container">
        <h2>울집 갱쥐 등록하기</h2>
        <form id="registerPetForm" action="registerPetC" method="post" enctype="multipart/form-data">
            <label for="petName">이름:</label>
            <input type="text" id="petName" name="pet_name" required>

            <label for="petType">종:</label>
            <input type="text" id="petType" name="pet_type" required placeholder="ex) 비숑, 말티즈, 리트리버">

            <label for="petSize">Pet Size:</label>
            <select id="petSize" name="pet_size">
                <option value="소형견">소형견</option>
                <option value="중형견">중형견</option>
                <option value="대형견">대형견</option>
            </select>

            <label for="petBirth">생일:</label>
            <input type="date" id="petBirth" name="pet_birth">

                      <label>성:</label>
            <div class="pet-gender-options">
                <label>
                    <input type="radio" name="pet_gender" value="남" required> 남
                </label>
                <label>
                    <input type="radio" name="pet_gender" value="여" required> 여
                </label>
            </div>

            <label for="petDescription">소개:</label>
            <textarea id="petDescription" name="pet_description"></textarea>

            <label for="petPhoto">사진:</label>
            <input type="file" id="petPhoto" name="pet_photo">
            <img id="petPhotoPreview" src="#" alt="Pet Photo Preview">

            <button>Submit</button>
        </form>
    </div>
    <script src="js/sw/registerPet.js"></script>
</body>
</html>
