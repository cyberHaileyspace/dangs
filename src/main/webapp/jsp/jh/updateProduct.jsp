<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/insertProduct.css">
<script type="text/javascript" src="js/jh/updateProduct.js" defer="defer"></script>
</head>
<body>
	<form action="UpdateProductC" method="post" enctype="multipart/form-data">
    <div class="title-wrapper">
        <div class="title">상품수정</div>
        <div class="process">
            <span class="prevPage"> 마이페이지</span> 
            <span class="next-stage">&gt;</span>
            <span class="title-now">내 등록상품</span>
            <span class="next-stage">&gt;</span>
            <span class="title-now">상품수정</span>
        </div>
    </div>

    <div class="container">
        <h1>수정 정보 입력</h1>
        <section class="product-info">
            <div class="ref-acc">
                <label for="product-name">상품명</label> 
                <input type="text" class="product-name" name="product-name" value="${product_name}">
                
                <label>현재 대표이미지</label> <br>
                <img alt="current-main-img" src="${product_img}" style="width : 100px; padding : 10px"> <br>
                <label for="main-img">수정할 대표이미지</label> <br>
                <input type="file" class="main-img" name="main-img-new"> <br> 
                <input hidden class="main-img" name="main-img-old" value="${product_img}"> <br> 
                
                <label for="seller">판매자</label>
                <label style="color : red">(판매자는 수정이 불가능합니다.)</label>
                <input type="text" class="seller" name="seller" value="${sessionScope.user.id}" readonly>
                
                <label for="price">개당 가격</label> <br>
                <input type="tel" class="price" name="price" value="${product_price}"> <br>
                
                <label for="quantity">수량</label> <br>
				<input type="number" id="quantity" name="quantity" min="1" max="100" step="1" value="1" value="${product_stock}">
                
                <div class="categories">카테고리</div>
                
                <label for="main-cate">메인</label>
                <select id="main-cate" name="main-cate">
                    <option value="food" ${product_category == 'food' ? 'selected' : ''}>food</option>
    				<option value="cloth" ${product_category == 'cloth' ? 'selected' : ''}>cloth</option>
    				<option value="etc" ${product_category == 'etc' ? 'selected' : ''}>etc</option>
				</select>
                
                <label for="sub-cate">서브</label>
                <select id="sub-cate" name="sub-cate">
                    <!-- 서브 카테고리는 JS에서 동적으로 추가 -->
                </select>
            </div>
        </section>
        <!-- 수정 버튼 -->
        <div class="submit-button">
            <button type="submit">수정</button>
        </div>
    </div>
    <input type="hidden" name="product_id" value="${product_id}">
    <input type="hidden" name="current-img" value="${product_img}">
</form>
</body>
</html>