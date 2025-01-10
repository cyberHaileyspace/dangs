<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/adoptMain.css">
</head>
<body>

	<div>
		<div id="header1">
			<ul class="tap">
				<a class="adopt"> 입양 홈 </a>
				<a class="shelter"
					href="AdoptionController?action=shelterAdoption.jsp"> 보호소 입양 </a>
				<a class="foster" href="FosterController?action=fosterAdoptions.jsp">
					임시 보호 </a>
			</ul>
		</div>
	</div>

	<div>
		<div id="header2">
			<div>
				<a href="AdoptionController?action=shelterAdoption.jsp"> 보호소 입양
				</a> <a href="AdoptionController?action=myFavorites"> 나의 관심 공고 </a>
				<!-- 로그인 여부에 따라서 가는 페이지가 달라짐 -->
			</div>
		</div>
	</div>

	<div class="main">
		<div class="main-wrap">
			<div>관리자 로그인시 보일 버튼 <button onclick="APITest">데이터셋 생성</button> </div>
			<div class="shelter-title">보호소 입양</div>
			<div>지역, 품종 필터</div>
			<div> 필터링 된 컨텐츠 숫자 표시 </div>
			<div class="adopt-contents">
				<div class="adopt-post">
					<div>
						<div> 
							<img alt="" src="https://www.animal.go.kr/files/shelter/2024/09/202410160910215.jpg">
						</div>
						<div> 설명 </div>
					</div>
					<div> 지역 설명 </div>
				</div>
				<div class="adopt-post">
					<div>
						<div> 
							<img alt="" src="https://www.animal.go.kr/files/shelter/2024/09/202410160910215.jpg">
						</div>
						<div> 설명 </div>
					</div>
					<div> 지역 설명 </div>
				</div>
				<div class="adopt-post">
					<div>
						<div> 
							<img alt="" src="https://www.animal.go.kr/files/shelter/2024/09/202410160910215.jpg">
						</div>
						<div> 설명 </div>
					</div>
					<div> 지역 설명 </div>
				</div>
				<div class="adopt-post">
					<div>
						<div> 
							<img alt="" src="https://www.animal.go.kr/files/shelter/2024/09/202410160910215.jpg">
						</div>
						<div> 설명 </div>
					</div>
					<div> 지역 설명 </div>
				</div>
			</div>
		</div>
	</div>



	<p>보호소에서 제공하는 입양 공고 목록입니다.</p>
	<!-- 공고 데이터를 동적으로 출력 -->
	<ul>
		<!-- 예시: 동적 데이터 -->
		<li>강아지 공고 1</li>
		<li>강아지 공고 2</li>
	</ul>

</body>
</html>