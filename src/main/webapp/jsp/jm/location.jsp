<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카카오 지도 API 예제</title>
    <!-- 카카오 지도 API JavaScript SDK 로드 -->
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a63b00ddcc6e53d9861a59b28e3a08e7&libraries=services,clusterer"></script>
</head>
<body>
    <div id="map" style="width: 500px; height: 500px;"></div>

    <script>
        // 지도 생성
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = { 
                center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울의 좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);
    </script>
</body>
</html>
