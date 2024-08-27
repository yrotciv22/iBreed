<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.ibreed_project.model.CalendarVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary Emotion</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_calendar.css' />" />
<script src="<c:url value='/js/calendar2.js'/>"></script>

</head>
<body>

	<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


				<!-- 각 페이지 작업 구간  -->

				<div id="calendar"></div>

				<!-- 각 페이지 작업 구간 끝  -->

			</div>

		</div>

		<!-- /js/calendar2.js에서 사용하기 위해서 숨겨둠 -->
		<c:forEach items="${calList}" var="cal">
			<input class="calendar_no" type="hidden" value="${cal.CALENDAR_NO }">
			<input class="calendar_title" type="hidden" value="${cal.CALENDAR_TITLE }">
			<input class="calendar_start" type="hidden" value="${cal.CALENDAR_START }">			
			<input class="calendar_end" type="hidden" value="${cal.CALENDAR_END }">			
		</c:forEach>

		<!-- 공통 layout 다이어리 우측 탭 -->
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
