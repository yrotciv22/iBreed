<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>iBreed</title>

	<!-- 공통 layout: head.jsp -->
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<script src="<c:url value='/js/index.js'/>"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverMapClientId}&submodules=geocoder"></script>

	<style>
		/* Reset some basic styles */
		body, h2, p, button, input, table {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}

		/* Basic container setup */
		.all {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			width: 100%;
			min-height: 100vh;
			background-color: #f9f9f9;
			padding: 20px;
		}

		#main {
			display: grid;
			grid-template-columns: 0.2fr 0.4fr 1fr;
			gap: 20px;
			width: 100%;
			max-width: 1200px;
			background-color: #ffffff;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
			border-radius: 8px;
			padding: 20px;
		}

		#menu {
			background-color: #f0f0f0;
			padding: 20px;
			border-radius: 8px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		#menuList {
			margin-top: 20px;
			width: 100%;
		}

		#menuList button {
			padding: 12px;
			background-color: #4CAF50;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			margin-bottom: 10px;
			width: 100%;
			text-align: center;
		}

		#menuList button:hover {
			background-color: #45a049;
		}

		#myPage {
			margin-top: auto;
			text-align: center;
		}

		#checklist {
			display: flex;
			flex-direction: column;
			align-items: center;
			background-color: #ffffff;
			border-radius: 8px;
			padding: 20px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}

		#nowLocation {
			margin-bottom: 20px;
			font-size: 18px;
			font-weight: bold;
			color: #333;
		}

		#searchContainer {
			width: 100%;
			position: relative; /* 검색 결과를 입력창 아래에 위치시키기 위해 설정 */
		}

		#searchResult {
			display: flex;
			width: 100%;
		}

		#searchQuery {
			flex: 1;
			padding: 10px;
			border-radius: 4px 0 0 4px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		button[type="submit"] {
			padding: 10px;
			background-color: #4CAF50;
			color: white;
			border: 1px solid #4CAF50;
			border-radius: 0 4px 4px 0;
			cursor: pointer;
			border-left: none;
			height: 100%;
		}

		button[type="submit"]:hover {
			background-color: #45a049;
		}

		/* 검색 결과 스타일링 */
		#searchResults {
			position: absolute; /* 입력창 아래에 고정되도록 설정 */
			top: calc(100% + 5px); /* 입력창 바로 아래에 위치 */
			left: 0;
			width: 100%; /* 입력창과 동일한 너비 유지 */
			max-height: 300px; /* 최대 높이를 설정하여 스크롤 가능하도록 */
			overflow-y: auto;
			background-color: white;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-shadow: 0 2px 10px rgba(0,0,0,0.1);
			box-sizing: border-box;
			z-index: 9999; /* 다른 요소 위에 표시 */
		}

		.search-item {
			padding: 10px;
			border-bottom: 1px solid #eee;
			cursor: pointer;
		}

		.search-item:last-child {
			border-bottom: none;
		}

		.search-item:hover {
			background-color: #f0f0f0;
		}

		table {
			width: 100%;
			border: 1px solid #ccc;
			margin-top: 10px;
			font-size: 14px;
			table-layout: fixed;
			border-collapse: collapse;
		}

		th, td {
			border: 1px solid #ccc;
			padding: 12px;
			text-align: center;
			width: 33.33%;
		}

		td:hover, th:focus {
			background-color: #e0e0e0;
		}

		#map {
			position: relative;
			background-color: #f0f0f0;
			width: 100%;
			height: 500px;
			border-radius: 8px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}

		#centerMarker {
			position: absolute;
			top: 50%;
			left: 50%;
			width: 30px;
			height: 30px;
			background: url('<c:url value="/image/cross.png" />') no-repeat center center;
			background-size: contain;
			pointer-events: none;
			transform: translate(-50%, -50%);
			z-index: 1000;
		}

		#searchCurrentLocation {
			position: absolute;
			top: 10px;
			left: 50%;
			transform: translateX(-50%);
			background-color: #4CAF50;
			color: white;
			padding: 10px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			z-index: 1000;
		}

		#searchCurrentLocation:hover {
			background-color: #45a049;
		}

		/* Toggle Switch CSS */
		.switch {
			position: relative;
			display: inline-block;
			width: 60px;
			height: 34px;
			margin-bottom: 10px;
		}

		.switch input {
			opacity: 0;
			width: 0;
			height: 0;
		}

		.slider {
			position: absolute;
			cursor: pointer;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: #ccc;
			transition: .4s;
			border-radius: 34px;
		}

		.slider:before {
			position: absolute;
			content: "";
			height: 26px;
			width: 26px;
			left: 4px;
			bottom: 4px;
			background-color: white;
			transition: .4s;
			border-radius: 50%;
		}

		input:checked + .slider {
			background-color: #2196F3;
		}

		input:checked + .slider:before {
			transform: translateX(26px);
		}

		#hospitalList {
			margin-top: 30px; /* 진료 과목 섹션의 위쪽 여백을 추가하여 입력란과의 간격을 확보 */
			width: 100%;
		}
	</style>
</head>

<body>
<div class="all">
	<!-- 공통 layout: top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />

	<div id="main">
		<aside id="menu">
			<div id="menuList">
				<button onclick="goHome()">홈</button>
				<button onclick="searchNearbyHospitalsByName('병원')">병원</button>
			</div>
			<div id="myPage">
				<label class="switch">
					<input type="checkbox" id="toggle-switch">
					<span class="slider"></span>
				</label>
				<p>마이<br>페이지</p>
			</div>
		</aside>

		<section id="checklist">
			<h2 id="nowLocation">현재 위치 : 서울</h2>
			<div id="searchContainer">
				<form id="searchResult" onsubmit="searchByAddress(event)">
					<input type="text" placeholder="검색어를 입력 해 주세요." id="searchQuery" name="query">
					<button type="submit">검색</button>
				</form>
				<div id="searchResults"></div> <!-- 검색 결과를 표시할 영역 -->
			</div>

			<div id="hospitalList">
				<h2>진료 과목</h2>
				<table>
					<tr>
						<td><a href="#" onclick="searchNearbyHospitalsByName('내과')">내과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('외과')">외과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('산부인과')">산부인과</a></td>
					</tr>
					<tr>
						<td><a href="#" onclick="searchNearbyHospitalsByName('소아과')">소아과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('정신과')">정신과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('신경과')">신경과</a></td>
					</tr>
					<tr>
						<td><a href="#" onclick="searchNearbyHospitalsByName('피부과')">피부과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('비뇨기과')">비뇨기과</a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('안과')">안과</a></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('이비인후과')">이비인후과</a></td>
						<td></td>
					</tr>
				</table>
			</div>
		</section>

		<section id="map">
			<div id="centerMarker"></div>
			<button id="searchCurrentLocation" onclick="searchFromCenterLocation()">현재 위치에서 찾기</button>
		</section>
	</div>

	<!-- 공통 layout: bottom.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</div>

<script>
	let map;
	let currentMapName = '병원'; // 기본값은 '병원'
	let markers = []; // 현재 표시된 마커들을 저장할 배열

	function initMap() {
		map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 15
		});

		// 현재 지도 중심 위치의 주소를 업데이트하는 함수
		function updateCenterAddress() {
			let center = map.getCenter(); // 지도의 현재 중심 좌표 가져오기

			// Geocoding을 사용하여 중심 좌표의 주소 가져오기
			naver.maps.Service.reverseGeocode({
				coords: center,
				orders: [
					naver.maps.Service.OrderType.ADDR,
					naver.maps.Service.OrderType.ROAD_ADDR
				]
			}, function(status, response) {
				if (status === naver.maps.Service.Status.OK) {
					let fullAddress = response.v2.address.jibunAddress || '주소를 가져올 수 없습니다.';
					document.getElementById('nowLocation').innerText = '현재 위치 : ' + fullAddress; // 주소 표시
				} else {
					document.getElementById('nowLocation').innerText = '주소를 가져올 수 없습니다.';
				}
			});
		}

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				let lat = position.coords.latitude; // 현재 위치의 위도
				let lng = position.coords.longitude; // 현재 위치의 경도

				let location = new naver.maps.LatLng(lat, lng);
				map.setCenter(location); // 지도의 중심을 현재 위치로 설정

				// 현재 위치에 마커 추가
				let currentLocationMarker = new naver.maps.Marker({
					position: location,
					map: map,
					title: '현재 위치',
					icon: {
						content: '<div style="background-color: blue; width: 20px; height: 20px; border-radius: 50%; border: 2px solid white;"></div>',
						anchor: new naver.maps.Point(10, 10)
					}
				});

				// Geocoding을 사용하여 현재 위치의 주소 가져오기 (초기 로딩 시)
				naver.maps.Service.reverseGeocode({
					coords: location,
					orders: [
						naver.maps.Service.OrderType.ADDR,
						naver.maps.Service.OrderType.ROAD_ADDR
					]
				}, function(status, response) {
					if (status === naver.maps.Service.Status.OK) {
						let fullAddress = response.v2.address.jibunAddress || '주소를 가져올 수 없습니다.';
						document.getElementById('nowLocation').innerText = '현재 위치 : ' + fullAddress; // 주소 표시
					} else {
						document.getElementById('nowLocation').innerText = '주소를 가져올 수 없습니다.';
					}
				});

				// 초기 로딩 시 기본 병원 검색
				searchNearbyHospitals(lat, lng, map, currentMapName);
			}, function(error) {
				alert("Geolocation을 사용할 수 없습니다. 오류 코드: " + error.code);
			});
		} else {
			alert("Geolocation을 지원하지 않는 브라우저입니다.");
		}

		// 지도 드래그나 확대/축소 등으로 중심이 바뀔 때마다 주소 업데이트
		naver.maps.Event.addListener(map, 'dragend', updateCenterAddress);
		naver.maps.Event.addListener(map, 'zoom_changed', updateCenterAddress);
	}

	function clearMarkers() {
		// 배열에 저장된 모든 마커 제거
		for (let i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		// 마커 배열 초기화
		markers = [];
	}

	function goHome() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				let lat = position.coords.latitude; // 현재 위치의 위도
				let lng = position.coords.longitude; // 현재 위치의 경도

				let location = new naver.maps.LatLng(lat, lng);
				map.setCenter(location); // 지도의 중심을 현재 위치로 설정

				// 기존 마커 제거
				clearMarkers();

				// 현재 위치에 마커 추가
				let currentLocationMarker = new naver.maps.Marker({
					position: location,
					map: map,
					title: '현재 위치',
					icon: {
						content: '<div style="background-color: blue; width: 20px; height: 20px; border-radius: 50%; border: 2px solid white;"></div>',
						anchor: new naver.maps.Point(10, 10)
					}
				});

				// Geocoding을 사용하여 현재 위치의 주소 가져오기
				naver.maps.Service.reverseGeocode({
					coords: location,
					orders: [
						naver.maps.Service.OrderType.ADDR,
						naver.maps.Service.OrderType.ROAD_ADDR
					]
				}, function(status, response) {
					if (status === naver.maps.Service.Status.OK) {
						let fullAddress = response.v2.address.jibunAddress || '주소를 가져올 수 없습니다.';
						document.getElementById('nowLocation').innerText = '현재 위치 : ' + fullAddress; // 주소 표시
					} else {
						document.getElementById('nowLocation').innerText = '주소를 가져올 수 없습니다.';
					}
				});

				// 현재 위치에서 병원 검색
				searchNearbyHospitals(lat, lng, map, '병원');
			}, function(error) {
				alert("Geolocation을 사용할 수 없습니다. 오류 코드: " + error.code);
			});
		} else {
			alert("Geolocation을 지원하지 않는 브라우저입니다.");
		}
	}

	function searchNearbyHospitalsByName(map_name) {
		currentMapName = map_name; // 선택된 진료 과목을 저장
		searchFromCenterLocation(); // 지도 중심을 기준으로 검색
	}

	function searchFromCenterLocation() {
		let center = map.getCenter(); // 지도의 현재 중심 좌표 가져오기
		let lat = center.lat();
		let lng = center.lng();

		// 기존 마커 제거
		clearMarkers();

		// 선택한 진료 과목에 따라 병원 검색
		searchNearbyHospitals(lat, lng, map, currentMapName);
	}

	function searchNearbyHospitals(lat, lng, map, map_name) {
		$.ajax({
			url: "/search/hospitals?lat=" + lat + "&lng=" + lng +"&map_name=" + map_name, // 서버에 좌표 기반 검색 요청
			type: "GET",
			success: function(response) {
				console.log("병원 데이터 수신 성공:", response);
				let hospitalData = response.documents; // 카카오 API에서 검색된 병원 정보
				hospitalData.forEach(function(item) {
					let hospitalLocation = new naver.maps.LatLng(item.y, item.x);

					let marker = new naver.maps.Marker({
						position: hospitalLocation,
						map: map,
						title: item.place_name
					});

					markers.push(marker); // 마커를 배열에 저장

					let infowindow = new naver.maps.InfoWindow({
						content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + item.place_name + '</b><br>' +
								item.road_address_name + '<br>' + item.phone + '</div>'
					});

					// 마커에 hover(마우스 오버) 이벤트 추가
					naver.maps.Event.addListener(marker, 'mouseover', function() {
						infowindow.open(map, marker);
					});

					// 마커에서 마우스를 떼면(마우스 아웃) 인포윈도우 닫기
					naver.maps.Event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});

					// 마커 클릭 시 새로운 창에서 카카오맵 상세 페이지 열기
					naver.maps.Event.addListener(marker, 'click', function() {
						window.open(item.place_url, '_blank');
					});
				});
			},
			error: function(xhr, status, error) {
				console.error("병원 정보를 가져오는 데 실패했습니다:", error);
			}
		});
	}

	// 사용자가 입력한 주소로 검색하는 함수
	function searchByAddress(event) {
		event.preventDefault(); // 기본 폼 제출 방지

		let address = document.getElementById('searchQuery').value;

		$.ajax({
			url: "/search/address?query=" + encodeURIComponent(address), // 주소로 장소 검색 요청
			type: "GET",
			success: function(response) {
				if (response.documents.length > 0) {
					displaySearchResults(response.documents); // 검색 결과 표시
				} else {
					alert('장소를 찾을 수 없습니다.');
				}
			},
			error: function() {
				alert('장소 검색 중 오류가 발생했습니다.');
			}
		});
	}

	function displaySearchResults(items) {
		let searchResults = document.getElementById('searchResults');
		searchResults.innerHTML = ''; // 기존 검색 결과 초기화

		items.forEach(function(item) {
			let searchItem = document.createElement('div');
			searchItem.className = 'search-item';
			searchItem.textContent = item.place_name + " (" + (item.road_address_name || item.address_name) + ")";

			searchItem.addEventListener('click', function() {
				let lat = parseFloat(item.y); // 위도
				let lng = parseFloat(item.x); // 경도

				// 지도 중심을 선택한 장소로 설정
				let location = new naver.maps.LatLng(lat, lng);
				map.setCenter(location);

				// 지도 중심의 주소를 갱신
				updateCenterAddress();

				// 선택한 위치에서 병원 검색
				searchNearbyHospitals(lat, lng, map, currentMapName);

				// 검색 결과 창을 숨김
				searchResults.style.display = 'none';
			});

			searchResults.appendChild(searchItem);
		});

		// 검색 결과 창을 보이도록 설정
		searchResults.style.display = 'block';
	}

	window.onload = function() {
		initMap();
	};
</script>
</body>
</html>
