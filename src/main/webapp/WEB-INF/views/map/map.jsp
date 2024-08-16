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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/map/map.css'/>" />
	<script src="<c:url value='/js/index.js'/>"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverMapClientId}&submodules=geocoder"></script>

	<style>
		#map {
			width: 100%;
			height: 500px;
			position: relative;
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

		#menuList {
			display: flex;
			flex-direction: column;
			gap: 10px;
			margin-top: 10px;
		}

		#menuList button {
			padding: 10px;
			background-color: #2196F3;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			text-align: center;
		}

		#menuList button:hover {
			background-color: #1976D2;
		}

		#searchResults {
			position: absolute;
			top: 100%; /* 검색 입력란 바로 아래에 위치 */
			left: 0;
			width: 100%; /* 입력창과 동일한 너비로 설정 */
			max-height: 300px; /* 검색 결과 목록의 최대 높이 설정 */
			overflow-y: auto; /* 검색 결과가 많을 경우 스크롤 가능하게 설정 */
			background-color: white;
			z-index: 1000;
			border: 1px solid #ccc; /* 검색 결과 목록의 테두리 설정 */
			border-radius: 4px;
			box-shadow: 0 2px 10px rgba(0,0,0,0.1); /* 그림자 효과 추가 */
			box-sizing: border-box; /* 패딩과 보더를 포함한 크기 설정 */
		}

		.search-item {
			padding: 10px;
			border-bottom: 1px solid #eee;
			cursor: pointer;
		}

		.search-item:last-child {
			border-bottom: none; /* 마지막 항목의 아래쪽 테두리 제거 */
		}

		.search-item:hover {
			background-color: #f0f0f0;
		}


		#searchQuery {
			width: calc(100% - 90px);
			padding: 10px;
			border-radius: 4px;
			border: 1px solid #ccc;
			margin-right: 10px;
		}

		button[type="submit"] {
			padding: 10px 20px;
			background-color: #4CAF50;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		button[type="submit"]:hover {
			background-color: #45a049;
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
			<div id="searchContainer" style="position: relative;">
				<form id="searchResult" onsubmit="searchByAddress(event)" style="display: flex; align-items: center;">
					<input type="text" placeholder="검색어를 입력 해 주세요." id="searchQuery" name="query" style="flex: 1; padding: 8px;">
					<button type="submit" style="padding: 8px 12px; margin-left: 8px;">검색</button>
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
						<td><a href="#"></a></td>
						<td><a href="#" onclick="searchNearbyHospitalsByName('이비인후과')">이비인후과</a></td>
						<td><a href="#"></a></td>
					</tr>
				</table>
			</div>
		</section>

		<section id="map">
			<div id="centerMarker"></div> <!-- 지도 중심에 표시할 십자마크 -->
			<button id="searchCurrentLocation" onclick="searchFromCenterLocation()">현재 위치에서 찾기</button> <!-- 현재 지도 중심에서 찾기 버튼 -->
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
