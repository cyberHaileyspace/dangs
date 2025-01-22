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
<script type="text/javascript" src="js/yj/cm.js" defer></script>
</head>
<body>

	<div class="container-cm-post">
	
	
		<div class="cm-back"><span> 커뮤니티 > </span></div>
		
		<div class="post-title"><span> ${getPost.cm_title } </span></div>
	
		<div class="post-info">
			<div class="post-profile"><img alt="" src="img/userProfile/${getPost.user_profile }"></div>
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
			<img alt="" style="width:300px"
				src="img/post/${getPost.cm_img }">
		</div>
		<div class="post-text">${getPost.cm_text }</div>
    <div id="post-${getPost.cm_no}">
    <button class="like-button" data-post-id="${getPost.cm_no}">♡</button>
    <span class="like-count" id="like-count-${getPost.cm_no}">0</span>
</div>
	<div class="cm-asd-btn">
		<button class="cm-up-btn" style="display: ${asd}" onclick="location.href='CmUpdateC?no=${getPost.cm_no}'">수정</button>
		<button class="cm-del-btn" style="display: ${asd}" onclick="deleteCm('${getPost.cm_no}')">삭제</button>
		</div>
</div>
      </div>
      <c:forEach var="re" items="${cm_reply }">
	<div class="post-comment">
		<div class="reply">
			<div class="reply-img"><img alt="" src="img/userProfile/${getRpPro.user_profile }"></div>
			<div class="reply-string">
				<div class="reply-name">${re.cmr_user_id}</div>
				<div class="reply-text">${re.cmr_text}</div>
				<div class="reply-date">${re.cmr_date}</div>
			</div>
		</div>
	</div>
		</c:forEach>

		<div class="reply-write">
			<div class="reply-ta"><textarea rows="" cols="" placeholder="댓글을 입력하세요." id="cmReply" name="cm-reply"></textarea></div>
			<button class="reply-btn">등록</button>
		</div>
	<input id="replyPostNo" value="${getPost.cm_no}" hidden>
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
	
	
    $(function (){
    	$('.reply-btn').click(function() {
    		let cmReply = document.getElementById('cmReply').value;
    		let postNum = document.getElementById('replyPostNo').value;
    		console.log(cmReply);
    		console.log(postNum);
    	    var xhr = new XMLHttpRequest();
    	    xhr.open('GET', 'checkLogin', true);
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            if (xhr.responseText === 'loggedIn') {
    	                window.location.href = 'CmAddReplyC?cmReply='+cmReply+'&no='+ postNum;
    	            } else if (xhr.responseText === 'notLoggedIn') {
    	                window.location.href = 'loginC';
    	            }
    	        }
    	    };
    	    xhr.send();
    	});
    })
    </script>
	
</body>
</html>