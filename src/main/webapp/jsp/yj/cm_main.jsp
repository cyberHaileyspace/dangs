<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/yj/cm.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/yj/cm.js"></script>
  </head>
  <body onload="">
    <div class="container-cm">
      <div class="menu-cm">
        <div><span class="menu">전체</span></div>
        <div><span class="menu"data-val="반려꿀팁">반려 꿀팁</span></div>
        <div><span class="menu"data-val="우리멍멍">우리 멍멍</span></div>
        <div><span class="menu"data-val="집사일기">집사 일기</span></div>
        <div><span class="menu"data-val="질의응답">Q&A</span></div>
      </div>

      <div class="search-cm">
        <input id="search-cm-input" placeholder="찾으시는 질문이 있으신가요?" />
        <button id="search-cm-btn">
          <img id="search-cm-btn" class="search-cm-btn"
            alt="" src="https://cdn-icons-png.flaticon.com/512/2989/2989907.png" />
        </button>
        <hr />
       
      </div>

      <div>
<!--         <div class="list-cm">
          <input type="radio" name="cm-option" value="cm-new" checked="checked" /> 최신순
          <input type="radio" name="cm-option" value="cm-like" /> 좋아요순
          <input type="radio" name="cm-option" value="cm-view" /> 조회순
        </div> -->
        <div class="write-cm">
          <button>
            <img class="write-cm-img"
              alt="" src="https://cdn-icons-png.flaticon.com/512/117/117476.png"/>
            <span>작성</span>
          </button>
        </div>
      </div>
      
      <div class="add-size">
		 <input type="radio" id="all" name="cm-dog"><label class="size" for="all">전체</label>
		 <input type="radio" id="s" name="cm-dog"><label class="size" data-val="소형견" for="s">소형견</label>
     	 <input type="radio" id="m" name="cm-dog"><label class="size" data-val="중형견" for="m">중형견</label>
     	 <input type="radio" id="l" name="cm-dog"><label class="size" data-val="대형견" for="l">대형견</label>
 		</div>
      
      <div id="cm-result">
     
      <c:forEach var="i" items="${cm_posts }">
      <div class="post-cm" onclick="location.href='CmPostC?no=${i.cm_no }'">
      	<div class="cm-kind">
      		<div class="cm-menu">${i.cm_cate }</div>
      		<div class="cm-cate">${i.cm_size }</div>
      	</div>
      <div class="cm-title">${i.cm_title }</div>
      <div class="cm-content">
      <div class="cm-text"><span>${i.cm_text }</span></div>
      <div class="cm-img"><img alt="" src="img/post/${i.cm_img }"></div>
      </div>
      <div class="cm-info">
      	<div class="info-name">작성자 : ${i.cm_user_id }</div>
      	<div class="info-date">작성일 : ${i.cm_date }</div>
<%--       	<div class="info-view">조회수 : ${i.cm_view }</div> --%>
      	<div class="info-like">좋아요 : ${i.cm_like }</div>
      	<%-- <div hidden>${i.cm_no }</div> --%>
      </div>
<!--       <hr> -->
      </div>
      </c:forEach>
        </div>
      
      	<div>
			<a href="CmPageC?p=1"> [begin] </a>
			<c:forEach begin="1" end="${pageCount }" var="j">
			<a href="CmPageC?p=${j }"> [ ${j } ] </a>
			</c:forEach>
			<a href="CmPageC?p=${pageCount }"> [end] </a>
		</div>
      
<%--       <c:out value="${cm_posts}" /> --%>
<%-- <c:out value="${pageCount}" /> --%>
      
      
    </div>
    <script type="text/javascript">
    $(function (){
    	$('.write-cm').click(function() {
    	    var xhr = new XMLHttpRequest();
    	    xhr.open('GET', 'checkLogin', true);
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            if (xhr.responseText === 'loggedIn') {
    	                window.location.href = 'CmAddC';
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
