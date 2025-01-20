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
	<button id="loadAddressesButton"> 우리 동네 근처 사람 찾기</button>
	
	<div id="userAddressJM" hidden>${sessionScope.user.address}</div>
	<script>
	$(function() {
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
			    let userAddress = document.getElementById('userAddressJM').textContent.trim();
			    var mapContainer = document.getElementById('map'),
			        mapOption = { 
			            center: new kakao.maps.LatLng(33.450701, 126.570667), 
			            level: 3 
			        };

			    var map = new kakao.maps.Map(mapContainer, mapOption);
			    var geocoder = new kakao.maps.services.Geocoder();
			    var baseCoords;

			    geocoder.addressSearch(userAddress, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            baseCoords = new kakao.maps.LatLng(result[0].y, result[0].x);

			            var marker = new kakao.maps.Marker({
			                map: map,
			                position: baseCoords
			            });

			            map.setCenter(baseCoords);
			            console.log("기준 위치 설정 완료");


			        } 
			    });    
			}  
			function plotAddressesOnMap(addresses, baseCoords, map) {
			    var geocoder = new kakao.maps.services.Geocoder();

			    addresses.forEach(function(address) {
			        geocoder.addressSearch(address, function(result, status) {
			            if (status === kakao.maps.services.Status.OK) {
			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var distance = kakao.maps.geometry.spherical.computeDistanceBetween(baseCoords, coords);
			                
			                if (distance <= 2000) { // 2km 반경 내에 있는지 확인
			                    var marker = new kakao.maps.Marker({
			                        map: map,
			                        position: coords
			                    });
			                }
			            }
			        });
			    });
			}

	 $('#loadAddressesButton').click(function() {
    // AJAX 호출로 서버에서 주소 목록 가져오기
    $.ajax({
        url: '/getAddressesC', // 서버 API 엔드포인트
        method: 'GET',
        success: function(response) {
            // response는 주소 목록 배열이라고 가정
            var addresses = response;
            plotAddressesOnMap(addresses, baseCoords, map);
        },
        error: function() {
            console.error("주소 목록 가져오기 실패");
        }
    });
	 });
	});
	</script>
</body>
</html>