<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/hy/adopt.js"></script>
</head>
<body>

<h1> 상세 공고 페이지 </h1>

    <div>
        <img src="${animal.popfile}" alt="Animal Image" width="300">
        <p>유기번호: ${animal.desertionNo}</p>
        <p>품종: ${animal.kindCd}</p>
        <p>나이: ${animal.age}</p>
        <p>성별: ${animal.sexCd == 'F' ? '여아' : '남아'}</p>
        <p>중성화 여부: ${animal.neuterYn == 'Y' ? '중성화 완료' : '중성화 미완료'}</p>
        <p>특징: ${animal.specialMark}</p>
        <p>발견 장소: ${animal.happenPlace}</p>
     </div>   
     <div>   
        <p>보호소 이름: ${animal.careNm}</p>
        <p>보호소 주소: ${animal.careAddr}</p>
        <p>보호소 전화번호: ${animal.careTel}</p>
    </div>
    <a href="javascript:history.back();"> 뒤로가기 </a>





</body>
</html>
