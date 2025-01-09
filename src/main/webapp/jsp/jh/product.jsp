<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/jh/product.css">
<script type="text/javascript" src="../js/jh/product.js" defer="defer"></script>
</head>
<body>
	<body>

    <!-- 경로 표시 -->
    <div class="breadcrumb">
        Home > Category > Product Name
    </div>

    <!-- 제품 상세 영역 -->
    <div class="product-detail-container">
        <!-- 왼쪽에 큰 상품 사진 -->
        <div class="product-image">
            <img src="https://i.pinimg.com/236x/84/59/f7/8459f7c5ea4a42995cbbbf99646e8918.jpg" alt="Product Image">
        </div>

        <!-- 오른쪽에 상품 정보 -->
        <div class="product-info">
            <div class="product-name">귀여운 강아지</div>
            <div class="p-s">
            	<div class="product-price">$99.99</div>
            	<img class="share-img" style="width: 25px; height: 25px" src="https://png.pngtree.com/png-vector/20230316/ourmid/pngtree-share-line-icon-vector-png-image_6651445.png" alt="Share image">
			</div>
			<hr>            
            <p> <b>구매혜택 : </b>1000 포인트 적립예정</p>
            <p> <b>배송 방법 : </b> 택배</p>
            <p> <b>배송비 : </b> 100,000원 (1,000,000원 이상 무료배송)</p>
            
        	<div class="counter-container">
    			<button id="decrease">-</button>
    			<div class="number-display" id="number">1</div>
    			<button id="increase">+</button>
  			</div>
        </div>
    </div>

    <!-- 카테고리 -->
    <div class="categories">
        <div class="category">상세정보</div>
        <div class="category">구매평</div>
        <div class="category">Q&A</div>
    </div>

    <!-- 길게 상품 설명 -->
    <div class="long-description">
        <img src="https://i.pinimg.com/236x/5c/17/ec/5c17ece6eae6dd710639dc795f9632a2.jpg" alt="Long Description Image">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur luctus, felis a eleifend tincidunt, lacus magna cursus erat, id facilisis lorem est nec lectus. Integer convallis auctor nibh, sit amet viverra elit congue vel. Praesent et orci a elit pharetra viverra. Donec auctor facilisis vehicula.</p>
    </div>
</body>
</html>