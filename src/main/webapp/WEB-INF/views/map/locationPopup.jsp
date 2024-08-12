<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Location Popup</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverMapClientId}&submodules=geocoder"></script>

    <style>
        #map {
            width: 100%;
            height: 300px;
        }

        #submitbtn {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            display: block;
            text-align: center;
            margin: 20px 0;
        }

        #submitbtn:hover {
            background-color: #45a049;
        }
    </style>

    <script>
        function initMap() {
            let map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.3595704, 127.105399), // 기본 중심 좌표
                zoom: 15
            });

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    let lat = position.coords.latitude; // 현재 위치의 위도
                    let lng = position.coords.longitude; // 현재 위치의 경도

                    let location = new naver.maps.LatLng(lat, lng);
                    map.setCenter(location); // 지도의 중심을 현재 위치로 설정

                    let marker = new naver.maps.Marker({
                        position: location,
                        map: map
                    });

                    // Geocoding을 사용하여 주소로 변환
                    naver.maps.Service.reverseGeocode({
                        coords: location,
                        orders: [
                            naver.maps.Service.OrderType.ADDR,
                            naver.maps.Service.OrderType.ROAD_ADDR
                        ]
                    }, function(status, response) {
                        if (status === naver.maps.Service.Status.OK && response.v2 && response.v2.address) {
                            let fullAddress = response.v2.address.jibunAddress || ''; // 지번 주소 사용

                            if (fullAddress) {
                                // '동', '읍', '면'으로 주소를 자르는 작업
                                let truncatedAddress = fullAddress.split(' ').slice(0, 3).join(' ');
                                document.getElementById('locationInfo').innerText = truncatedAddress; // 주소 표시
                            } else {
                                document.getElementById('locationInfo').innerText = "주소를 가져올 수 없습니다."; // 오류 메시지 표시
                            }
                        } else {
                            document.getElementById('locationInfo').innerText = "주소를 가져올 수 없습니다."; // 오류 메시지 표시
                        }
                    });

                }, function(error) {
                    alert("Geolocation을 사용할 수 없습니다. 오류 코드: " + error.code);
                });
            } else {
                alert("Geolocation을 지원하지 않는 브라우저입니다.");
            }
        }

        function confirmLocation() {
            let address = document.getElementById('locationInfo').innerText;
            window.opener.setLocation(address); // 부모 창의 주소 입력란에 값 설정
            window.close(); // 팝업 창 닫기
        }
    </script>
</head>

<body onload="initMap()">
<h2>현재 위치 확인</h2>
<div id="map"></div>
<p id="locationInfo"></p>
<button id="submitbtn" onclick="confirmLocation()">확인</button>
</body>

</html>
