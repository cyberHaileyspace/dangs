<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/yj/cm.css" />
  </head>
  <body>
    <div class="container-cm">
      <div class="menu-cm">
        <div><a href="CmMainC">전체</a></div>
        <div><a href="CmTipC">반려 꿀팁</a></div>
        <div><a href="CmProudC">우리 멍멍</a></div>
        <div><a href="CmDiaryC">집사 일기</a></div>
        <div><a href="CmQnAC">Q&A</a></div>
      </div>

      <div class="search-cm">
        <input id="search-cm-input" placeholder="찾으시는 질문이 있으신가요?" />
        <button>
          <img
            class="search-cm-btn"
            alt=""
            src="https://cdn-icons-png.flaticon.com/512/2989/2989907.png"
          />
        </button>
        <hr />
        <span id="cm-result"></span>
      </div>

      <div>
        <div class="list-cm">
          <input
            type="radio"
            name="cm-option"
            value="cm-new"
            checked="checked"
          />
          최신순
          <input type="radio" name="cm-option" value="cm-like" /> 좋아요순
          <input type="radio" name="cm-option" value="cm-view" /> 조회순
        </div>
        <div class="write-cm" onclick="location.href='cmAddC'">
          <button>
            <img
              class="write-cm-img"
              alt=""
              src="https://cdn-icons-png.flaticon.com/512/117/117476.png"
            />
            <span>작성</span>
          </button>
        </div>
      </div>
      
      <div class="add-size">
		 <input type="radio" id="s" name="cm-dog"><label for="s">소형견</label>
     	 <input type="radio" id="m" name="cm-dog"><label for="m">중형견</label>
     	 <input type="radio" id="l" name="cm-dog"><label for="l">대형견</label>
 		</div>
      
      
      <c:forEach var="i" items="${cm_posts }">
      <div class="post-cm" onclick="location.href='CmPostC?no=${i.cm_no }'">
      	<div class="cm-kind">
      		<div class="cm-menu">${i.cm_cate }</div>
      		<div class="cm-cate">${i.cm_size }</div>
      	</div>
      <div class="cm-title">${i.cm_title }</div>
      <div class="cm-content">
      <div class="cm-text"><span>${i.cm_text }</span></div>
      <div class="cm-img"><img alt="" src="https://cdn-icons-png.flaticon.com/512/5661/5661457.png"></div>
      </div>
      <div class="cm-info">
      	<div class="info-name">작성자 : ${i.cm_user_id }</div>
      	<div class="info-date">작성일 : ${i.cm_date }</div>
      	<div class="info-view">조회수 : ${i.cm_view }</div>
      	<div class="info-like">좋아요 : ${i.cm_like }</div>
      	<%-- <div hidden>${i_cm_no }</div> --%>
      </div>
<!--       <hr> -->
      </div>
      </c:forEach>
      
      
      
      
      
      
    </div>
  </body>
</html>
