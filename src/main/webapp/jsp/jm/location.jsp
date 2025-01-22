<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카카오 지도 시작하기</title>
<link rel="stylesheet" href="css/jm/search.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afd7b38172ac4306c02c60ef10383c6c&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="map" class="map"></div>
	<div style="height: 40px;"></div>
	<div style="display: flex;">
		<div class="locationButton">우리 동네 찾기</div>
		<div class="searchButton">우리 동네 검색</div>
	</div>
	<div id="userAddressjm" hidden>${sessionScope.user.address}</div>
	<script>
		$(function() {
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);
			// ---- 지도 ---- //
			/*    function btn(sample) {
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
			   
			   $('.searchButton').click(function() {
					var xhr = new XMLHttpRequest();
					xhr.open('GET', 'checkLogin', true);
					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							if (xhr.responseText === 'loggedIn') {
								window.location.href = 'MiddleC';
							} else if (xhr.responseText === 'notLoggedIn') {
								window.location.href = 'loginC';
							}
						}
					};
					xhr.send();
				});

			function myLocation() {
				let userAddress = document.getElementById('userAddressjm').textContent
						.trim();
				var mapContainer = document.getElementById('map'), mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667),
					level : 3
				};

				var map = new kakao.maps.Map(mapContainer, mapOption);
				var geocoder = new kakao.maps.services.Geocoder();

				geocoder.addressSearch(userAddress, function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y,
								result[0].x);

						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});
						
						  var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="padding:5px;z-index:1;">' + userAddress + '</div>'
					        });
						  
					        infowindow.open(map, marker);

						map.setCenter(coords);

						// 반경 2km 원 그리기 추가
						var circle = new kakao.maps.Circle({
							center : coords, // 원의 중심좌표
							radius : 1500, // 반경 (미터 단위)
							strokeWeight : 5, // 선의 두께
							strokeColor : '#FF0000', // 선의 색깔
							strokeOpacity : 0.8, // 선의 불투명도
							strokeStyle : 'dashed', // 선의 스타일
							fillColor : '#FFAAAA', // 채우기 색깔
							fillOpacity : 0.5
						// 채우기 불투명도
						});

						// 지도에 원을 표시합니다
						circle.setMap(map);
					}
				});

				$.ajax({
					url : '/getAddressesC', // 서버에서 주소 목록을 반환하는 API 엔드포인트
					method : 'GET',
					success : function(response) {
						// response는 주소 목록 배열이라고 가정
						var addresses = response;
						plotAddressesOnMap(addresses);
						console.log("성공");
					},
					error : function() {
						console.error("Failed to fetch addresses");
					}
				});
				
				function plotAddressesOnMap(addresses) {
					var mapContainer = document.getElementById('map'), mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 3
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);
					var geocoder = new kakao.maps.services.Geocoder();
					var baseCoords = new kakao.maps.LatLng(33.450701,
							126.570667); // 기준 좌표

					addresses
							.forEach(function(address) {
								geocoder
										.addressSearch(
												address,
												function(result, status) {
													if (status === kakao.maps.services.Status.OK) {
														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);
														var distance = kakao.maps.geometry.spherical
																.computeDistanceBetween(
																		baseCoords,
																		coords);

														if (distance <= 2000) { // 2km 반경 내에 있는지 확인
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});
														}
													}
												});
							});
							
					app.get('/getAddresses', (req, res) => {
					    // 데이터베이스 쿼리로 user_address를 가져옴
					    /* db.query('SELECT user_address FROM users', (error, results) => {
					        if (error) {
					            res.status(500).send("Database query error");
					        } else {
					            res.json(results.map(row => row.user_address));
					        }
					    }); */
					});
					
				}
			}
		});
	</script>
</body>
</html>