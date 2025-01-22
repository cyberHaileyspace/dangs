<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/insertProduct.css">
<script type="text/javascript" src="js/jh/insertProduct.js" defer="defer"></script>
</head>
<body>
	<form action="InsertProductC" method="post" enctype="multipart/form-data">
    <div class="title-wrapper">
        <div class="title">상품등록</div>
        <div class="process">
            <span class="prevPage"> 마이페이지</span> 
            <span class="next-stage">&gt;</span>
            <span class="title-now">상품등록</span>
        </div>
    </div>

    <div class="container">
        <h1>상품 정보 입력</h1>
        <section class="product-info">
            <div class="ref-acc">
                <label for="product-name">상품명</label> 
                <input type="text" class="product-name" name="product-name">
                
                <label for="main-img">대표이미지</label> <br>
                <input type="file" class="main-img" name="main-img"> <br> 
                
                <label for="seller">판매자</label> 
                <input type="text" class="seller" name="seller" value="${sessionScope.user.id}" readonly>
                
                <label for="price">개당 가격</label> <br>
                <input type="tel" class="price" name="price"> <br>
                
                <label for="quantity">수량</label> <br>
<input type="number" id="quantity" name="quantity" min="1" max="100" step="1" value="1">
                
                <div class="categories">카테고리</div>
                
                <label for="main-cate">메인</label>
                <select id="main-cate" name="main-cate">
                    <option value="food">food</option>
                    <option value="cloth">cloth</option>
                    <option value="etc">etc</option>
                </select>
                
                <label for="sub-cate">서브</label>
                <select id="sub-cate" name="sub-cate">
                    <!-- 서브 카테고리는 JS에서 동적으로 추가 -->
                </select>
            </div>
        </section>
        <!-- 제출 버튼 -->
        <div class="submit-button">
            <button type="submit">요청 제출</button>
        </div>
        <!-- 고객 지원 안내 -->
        <section class="customer-support">
            <h2>고객 지원</h2>
            <p>추가 문의 사항이 있으시면 고객 지원 센터로 연락주시기 바랍니다.</p>
            <p><strong>전화:</strong> 010-8639-0899</p>
            <p><strong>이메일:</strong> leejinhyun99@naver.com</p>
        </section>
    </div>
</form>
</body>
</html>