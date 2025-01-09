<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카카오 지도 시작하기</title>
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afd7b38172ac4306c02c60ef10383c6c"></script>
</head>
<body>
	<div id="map" class="map"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);

		function btn(sample) {
			alert(sample);
		}

		/* if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var latitude = position.coords.latitude;
				var longitude = position.coords.longitude;
				// 현재 위치를 지도에 중심으로 설정
				var locPosition = new kakao.maps.LatLng(latitude, longitude);
				map.setCenter(locPosition);
				// 마커를 현재 위치에 추가
				var marker = new kakao.maps.Marker({
					position : locPosition
				});
				marker.setMap(map);
			}, function(error) {
				console.log(error);
				alert('위치 정보를 가져올 수 없습니다.');
			});
		} else {
			alert('이 브라우저는 위치 정보 서비스를 지원하지 않습니다.');
		} */

		// document.getElementById('locationButton').addEventListener('click', getLocation);
		/* $(function () {
			$("button").click(function () {

				$.ajax({
					
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var latitude = position.coords.latitude;
				var longitude = position.coords.longitude;
				// 현재 위치를 지도에 중심으로 설정
				var locPosition = new kakao.maps.LatLng(latitude, longitude);
				map.setCenter(locPosition);
				// 마커를 현재 위치에 추가
				var marker = new kakao.maps.Marker({
					position : locPosition
				});
				marker.setMap(map);
			}, function(error) {
				console.log(error);
				alert('위치 정보를 가져올 수 없습니다.');
			});
		} else {
			alert('이 브라우저는 위치 정보 서비스를 지원하지 않습니다.');
		}					
					
				});
			});
		}); */
	</script>
	<div class="locationButton" onclick="javascript:alert('먼저 로그인을 해주세요')">
		우리 동네 찾기</div>
</body>
</html>