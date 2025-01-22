<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>검색 결과</title>
<link rel="stylesheet" href="css/jm/search.css">
</head>
<body>
	<h1>내 글 검색 결과</h1>
	<c:choose>
		<c:when test="${not empty ddd}">
			<div style="float: left;">
				<div style="width: 100%; display: flex; justify-content: center;">
					<div>
						<ul class="post-list">
							<c:forEach var="i" items="${ddd}">
								<li class="post-item">
									<div class="post-header">${i.title}</div>
									<div class="post-info">
										<span><strong>작성자 : </strong> ${i.user_id}</span><br> <span><strong>주소
												: </strong> ${i.address}</span><br> <span><strong>작성일 :
										</strong> ${i.date}</span>
									</div>
									<div>
									<span><strong>내용 : </strong> ${i.content}</span>
									</div>
									<div class="post-actions">
										<button style="background-color: #007BFF;" onclick="location.href='detailWritingC?id=${i.id}'">수정</button>
										<button style="background-color: #FA5858;" onclick="deleteWriting('${i.id}')">삭제</button>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<p>검색 결과가 없습니다.</p>
		</c:otherwise>
	</c:choose>
</body>
<script>
function deleteWriting(no) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'deleteWritingC?id=' + no;
	}
}
</script>
</html>