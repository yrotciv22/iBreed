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

					// 카카오 로컬 API를 사용해 병원 검색
					searchNearbyHospitals(lat, lng, map);
				}, function(error) {
					alert("Geolocation을 사용할 수 없습니다. 오류 코드: " + error.code);
				});
			} else {
				alert("Geolocation을 지원하지 않는 브라우저입니다.");
			}
		}

		function searchNearbyHospitals(lat, lng, map) {
			$.ajax({
				url: "/search/hospitals?lat=" + lat + "&lng=" + lng, // 서버에 좌표 기반 검색 요청
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



		window.onload = function() {
			initMap();
		};
	</script>
</head>

<body>
<div class="all">
	<!-- 공통 layout: top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />

	<div id="main">
		<aside id="menu">
			<div id="menuList">
				<p>홈</p>
				<p>병원</p>
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
			<form action="searchResult" method="GET" id="searchResult">
				<input type="text" placeholder="검색어를 입력 해 주세요." name="query">
				<button type="submit">검색</button>
			</form>

			<div id="hospitalList">
				<h2>진료 과목</h2>
				<table>
					<tr>
						<td><a href="#">내과</a></td>
						<td><a href="#">외과</a></td>
						<td><a href="#">산부인과</a></td>
					</tr>
					<tr>
						<td><a href="#">소아과</a></td>
						<td><a href="#">정신과</a></td>
						<td><a href="#">신경과</a></td>
					</tr>
					<tr>
						<td><a href="#">피부과</a></td>
						<td><a href="#">비뇨기과</a></td>
						<td><a href="#">안과</a></td>
					</tr>
					<tr>
						<td><a href="#"></a></td>
						<td><a href="#">이비인후과</a></td>
						<td><a href="#"></a></td>
					</tr>
				</table>
			</div>
		</section>

		<section id="map" onload="initMap()"></section>
	</div>

	<!-- 공통 layout: bottom.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</div>
</body>
</html>
