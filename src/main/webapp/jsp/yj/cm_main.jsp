<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0;
padding: 0;
}
.menu-cm{
display: flex;
justify-content: space-around;
margin-bottom: 10px;
}
.list-cm{
display: flex;
justify-content: flex-start;
}
.write-cm{
display: flex;
justify-content: flex-end;
}
.write-cm-img{
width: 10px;
height: 10px;
}
.size-cm{
display: flex;
flex-direction: column;
justify-content: flex-end;

}
.dog-siza{
border: 1px solid black;
margin-bottom: 10px;
padding: 5px;
}
</style>
</head>
<body>
	<div class="container-cm">
	
		<div class="menu-cm">
			<div><a href="CmMainC">전체</a></div>
			<div><a href="">반려 꿀팁</a></div>
			<div><a href="">우리 멍멍</a></div>
			<div><a href="">집사 일기</a></div>
			<div><a href="">Q&A</a></div>
		</div>
		
		<div>
		
		<div class="list-cm">
		<input type="radio" name="cm-option" value="cm-new" checked="checked"> 최신순
		<input type="radio" name="cm-option" value="cm-like"> 좋아요순
		<input type="radio" name="cm-option" value="cm-view"> 조회순
		</div>
		<div class="write-cm"> <button> <img class="write-cm-img" alt="" src="https://cdn-icons-png.flaticon.com/512/117/117476.png"> <span>작성</span></button> </div>
		</div>
		
		<div class="size-cm">
			<div class="dog-size">소형견</div>
			<div class="dog-size">중형견</div>
			<div class="dog-size">대형견</div>
		</div>

		<div> <a href="jsp/yj/cm_all.jsp">포스트</a> </div>
		
	</div>
</body>
</html>