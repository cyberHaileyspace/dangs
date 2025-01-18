<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" href="css/sw/main.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="sw-post-wrapper">
	<div class="sw-post-header">
	<div>새 글 </div>
	<div>더보기</div>
	</div>
	<c:forEach var="i" items="${posts }">
	<div style="cursor: pointer" onclick="location.href='CmPostC?no=${i.cm_no }'">${i.cm_title }</div>
	</c:forEach>
	</div>



	<button id="wishlist-button" data-product-id="123"
		class="wishlist-button">
		<i class="heart-icon">♡</i>
	</button>
	
	
	
	
	<script type="text/javascript">
document.getElementById('wishlist-button').addEventListener('click', function() {
	  const productId = this.getAttribute('data-product-id');

	  fetch('CheckSessionServlet', {
	    method: 'GET',
	    headers: {
	      'Content-Type': 'application/json'
	    }
	  })
	  .then(response => response.json())
	  .then(data => {
	    if (data.isLoggedIn) {
	      fetch('ToggleWishlistServlet', {
	        method: 'POST',
	        headers: {
	          'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ productId: productId })
	      })
	      .then(response => response.json())
	      .then(result => {
	        if (result.success) {
	          const heartIcon = document.querySelector('.heart-icon');
	          heartIcon.classList.toggle('active', result.isWishlisted);
	        } else {
	          alert('찜 상태 변경에 실패했습니다.');
	        }
	      });
	    } else {
	      window.location.href = 'loginC';
	    }
	  })
	  .catch(error => {
	    console.error('에러 발생:', error);
	  });
	});
</script>

</body>
</html>
