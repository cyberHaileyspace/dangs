<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yj/cmPost.css"/>
</head>
<body>


	<div class="container-cm-post">
	
	
		<div class="cm-back"><span> 커뮤니티 > </span></div>
		
		<div class="post-title"><span> ${getPost.cm_title } </span></div>
	
		<div class="post-info">
			<div class="post-profile"><img alt="" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.namu.wiki%2Fi%2FNqAfQ710Z4IejlTwoibjuP5A3BZhfOtVvosO0OXV2qp6_9oONtnW9Hzf04Oo6fyPKyONMT11UMwZuNVinu6NhQ.webp&type=a340"></div>
			<div class="post-mini-wrapper">
			<div class="post-string">
				<div class="post-name">${getPost.cm_user_id }</div>
				<div class="post-date">${getPost.cm_date }</div>
			</div>
			<div class="post-items">
				<div class="post-view"><img alt="" src="https://cdn-icons-png.flaticon.com/512/7835/7835667.png">${getPost.cm_view }</div>
				<div class="post-like"><img alt="" src="https://cdn-icons-png.flaticon.com/512/833/833234.png">${getPost.cm_like }</div>
			</div>
			</div>
		</div>
		
	<div class="post-content">
		<div class="post-img">
			<img alt=""
				src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.namu.wiki%2Fi%2FNqAfQ710Z4IejlTwoibjuP5A3BZhfOtVvosO0OXV2qp6_9oONtnW9Hzf04Oo6fyPKyONMT11UMwZuNVinu6NhQ.webp&type=a340">
		</div>
		<div class="post-text">${getPost.cm_text }</div>
    <div id="post-${getPost.cm_no}">
    <button class="like-button" data-post-id="${getPost.cm_no}">♡</button>
    <span class="like-count" id="like-count-${getPost.cm_no}">0</span>
</div>
</div>
      </div>
	
	<div class="post-comment">
		<div class="reply">
			<div class="reply-img"><img alt="" src="https://image.zeta-ai.io/profile-image/e04ebe5c-180e-40e7-b498-4ad395fb9c91/1976a741-62c0-4e5a-b29e-04cfbc601217.png?w=750&q=75&f=webp"></div>
			<div class="reply-string">
				<div class="reply-name">멍냥</div>
				<div class="reply-text">캉캉캉캉캉캉캉캉</div>
				<div class="reply-date">2025-01-14 12:21</div>
			</div>
		</div>
	</div>
		
		<div class="reply-write">
			<div class="reply-ta"><textarea rows="" cols="" placeholder="댓글을 입력하세요."></textarea></div>
			<button class="reply-btn">등록</button>
		</div>
		
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('.like-button').click(function() {
	        var postId = $(this).data('post-id');

	        // 로그인 여부 확인
	        var xhr = new XMLHttpRequest();
	        xhr.open('GET', 'checkLogin', true);
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	                if (xhr.responseText === 'loggedIn') {
	                    // 로그인된 경우 좋아요 처리
	                    $.ajax({
	                        url: '/dangs/likePostC',
	                        method: 'POST',
	                        data: { postId: postId },
	                        success: function(response) {
	                            if (response.success) {
	                                $('#like-count-' + postId).text(response.newLikeCount);
	                                $('.like-button[data-post-id="' + postId + '"]').text('♥');
	                            } else {
	                                alert(response.message);
	                            }
	                        },
	                        error: function() {
	                            alert('좋아요 요청에 실패했습니다.');
	                        }
	                    });
	                } else if (xhr.responseText === 'notLoggedIn') {
	                    // 로그인되지 않은 경우 로그인 페이지로 이동
	                    window.location.href = 'loginC';
	                }
	            }
	        };
	        xhr.send();
	    });
	});
	</script>
</body>
</html>