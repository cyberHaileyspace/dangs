<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/hy/adoptDetail.css">
<script type="text/javascript" src="js/hy/adoptDetail.js" defer></script>
</head>
<body>

	<!-- JSON 데이터를 숨겨진 필드로 전달 -->
	<input type="hidden" id="animalDetail"
		value='<c:out value="${animalDetail}"/>' />

	<div id="adoptLikes" hidden>${adoptLikes }</div>

	<div id="detail-container">
		<!-- JavaScript가 데이터를 동적으로 삽입 -->
	</div>

	<a href="javascript:history.back();" style="margin: 20px; font-size: 18px; text-decoration: none;"> 뒤로가기 </a>
	<script>
		function checklog(div) {
			let adoptLikesVal = document.getElementById('adoptLikes').innerText;
			let icon = 	div.firstElementChild;
			
			if (icon.classList.contains("fa-regular")) {
		        icon.classList.remove("fa-regular");
		        icon.classList.add("fa-solid", "red");
		    } else {
		        icon.classList.remove("fa-solid", "red");
		        icon.classList.add("fa-regular");
		    }
			
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'checkLogin', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (xhr.responseText === 'loggedIn') {
// 						fetch('AdoptionLikeC?adoptLikesVal='+adoptLikesVal, {
// 							method: "get",
// 							  headers: {
// 							    'Content-Type': 'application/json', // JSON 데이터를 보낼 경우 설정
// 							  }})
// 						  .then(response => {
// 						    if (!response.ok) {
// 						      throw new Error('Network response was not ok ' + response.statusText);
// 						    }
// 						    return response.json(); // JSON 응답을 파싱
// 						  })
// 						  .then(data => {
// 						    console.log('GET 요청 데이터:', data); // 응답 데이터 사용
// 						    //true   하트가 빨간색이 되야됨.
						    
						    
						    
// 						  })
// 						  .catch(error => {
// 						    console.error('GET 요청 에러:', error); // 에러 처리
// 						  });
						console.log(icon.dataset.val);
						likeSet(icon.dataset.val);
// 						window.location.href = 'AdoptionLikeC?animalId='
// 								+ adoptLikesVal;
					} else if (xhr.responseText === 'notLoggedIn') {
						window.location.href = 'loginC';
					}
				}
			};
			xhr.send();
		}
	</script>
</body>
</html>
