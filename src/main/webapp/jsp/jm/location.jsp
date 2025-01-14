<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카카오 지도 시작하기</title>
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afd7b38172ac4306c02c60ef10383c6c&libraries=services"></script>
</head>
<body>
	<div id="map" class="map"></div>
	<div class="locationButton">우리 동네 찾기</div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
		// ---- 지도 ---- //
		/* 	function btn(sample) {
				alert(sample);
			} */
		$('.locationButton').click(function() {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'checkLogin', true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (xhr.responseText === 'loggedIn') {
						myLocation();
					} else if (xhr.responseText === 'notLoggedIn') {
						window.location.href = 'loginC';
					}
				}
			};
			xhr.send();
		});

		function myLocation() {

			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(
						function(position) {
							var latitude = position.coords.latitude;
							var longitude = position.coords.longitude;
							// 현재 위치를 지도에 중심으로 설정
							var locPosition = new kakao.maps.LatLng(latitude,
									longitude);
							map.setCenter(locPosition);
							// 마커를 현재 위치에 추가
							var marker = new kakao.maps.Marker({
								position : locPosition
							});
							marker.setMap(map);
							// 주소를 얻기 위한 geocoder 객체 생성
							var geocoder = new kakao.maps.services.Geocoder();
							// 좌표로 주소를 변환하는 함수
				            geocoder.coord2Address(longitude, latitude, function(result, status) {
				                if (status === kakao.maps.services.Status.OK) {
				                    // 첫 번째 응답을 사용 (result[0]은 가장 근접한 주소)
				                    var address = result[0].address.address_name;
				                    // 인포윈도우 생성 (위치에 표시될 텍스트)
				                    var infowindow = new kakao.maps.InfoWindow({
				                        content: '<div style="padding:5px;">' + address + '</div>',
				                        position: locPosition,
				                        removable: true
				                    });
				                    infowindow.open(map, marker);
				                    
				                    console.log(address);
				                    window.location.href="registerWalkingMateC?location="+address;
				                    
				                } else {
				                	console.log("주소 반환에 실패했습니다.");
				                }
				            });
						}, function(error) {
							console.log(error);
							alert('위치 정보를 가져올 수 없습니다.');
						});
			} else {
				alert('이 브라우저는 위치 정보 서비스를 지원하지 않습니다.');
			}
		}
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
</body>
</html>