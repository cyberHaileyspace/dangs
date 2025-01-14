<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jh/product.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jh/product.js" defer="defer"></script>

<script type="text/javascript">
/* db 만들면 비동기로 정보 / 평점 / Q&A 만들 거 */	
	/* $(function() {
		$('.detail').click(function() {
			
			$.ajax({
				url : 'DetailC',
				type : 'get', 
				success : function(resData) {
					
				}
			})
			
		})
	}) */
</script>

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
        </div> <!-- product culumn - img -->

        <!-- 오른쪽에 상품 정보 -->
        <div class="product-info">
            <div class="product-name">귀여운 강아지</div> <!-- product culumn - name-->
            <div class="p-s">
            	<div class="product-price">$9999.9999</div> <!-- product culumn - price -->
            	<img class="share-img" style="width: 25px; height: 25px" src="https://png.pngtree.com/png-vector/20230316/ourmid/pngtree-share-line-icon-vector-png-image_6651445.png" alt="Share image">
			</div>
			<hr>            
            <p> <b>구매혜택 : </b>1000 포인트 적립예정</p> <!-- 얘는 culumn 안 만들고 price의 몇%로 js 계산 -->
            <p> <b>배송 방법 : </b> 택배</p> <!-- 택배 고정 -->
            <p> <b>배송비 : </b> 100,000원 (1,000,000원 이상 무료배송)</p> <!-- 2~3가지 경우수만 고려 culumn은 안만듬 -->
            
           	<div class="stock-chk">
        		<div class="stock">수량</div>
        		<div class="stock2">
        			<div class="bet">
        		<div class="counter-container">
    					<button id="decrease">-</button>
    					<div class="number-display" id="number">1</div>
    					<button id="increase">+</button>
    				</div>
  				<div class="total-price">(가격 x 수량)원</div>
  				</div>
  				</div>
  			</div>
  			<div class="total">
  			<div>총 상품 금액 : </div>
  			<div class="total-price">(가격 x 수량)원</div>
        </div>
        
        <div class="item-categories">
        <div class="item-category">구매하기</div>
        <div class="item-category">장바구니</div>
        <div class="heart">♡</div>
    </div>
        
        </div>
    </div>

    <!-- 카테고리 -->
    <div class="categories">
        <div class="category" id="detail">상세정보</div> <!-- product culumn - detail -->
        <div class="category">댓글</div> <!--  -->
    </div>

    <!-- 길게 상품 설명 -->
    <div class="long-description">
        <p>긴 이미지 넣는 자리</p>
        <img src="https://i.pinimg.com/236x/5c/17/ec/5c17ece6eae6dd710639dc795f9632a2.jpg" alt="Long Description Image">
        <img src="https://i.pinimg.com/236x/5c/17/ec/5c17ece6eae6dd710639dc795f9632a2.jpg" alt="Long Description Image">
        <img src="https://i.pinimg.com/236x/5c/17/ec/5c17ece6eae6dd710639dc795f9632a2.jpg" alt="Long Description Image">
    </div>
    <div class="last-section">
    	<div class="section-title">같은 카테고리의 다른 상품들</div>
    	<div class="slider-placeholder">슬라이더 자리</div>
	</div>
</body>
</html>