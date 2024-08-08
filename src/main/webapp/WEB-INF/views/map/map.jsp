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
				<ul>
					<li>홈</li>
					<li>프로필</li>
					<li class="active">다이어리</li>
					<li>감정관리</li>
					<li>사진첩</li>
					<li>캘린더</li>
					<li>친구</li>
					<li>마이페이지</li>
				</ul>
		</aside>

		<section id="checklist"></section>

		<section id="map"></section>
		왜 아무것도안나와??
	</div>


	<!-- 메인 끝 -->


	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>