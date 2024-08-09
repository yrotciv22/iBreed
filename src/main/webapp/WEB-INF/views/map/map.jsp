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

		<section id="map"></section>
	</div>


	<!-- 메인 끝 -->


	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>