<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentPath" value="${pageContext.request.servletPath}" />
<c:set var="pathSegments" value="${fn:split(currentPath, '/')}" />
<c:set var="lastPathSegment" value="${pathSegments[fn:length(pathSegments) - 1]}" />

<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>


<script>
	// 세션에서 직접 user_id 가져오기
	const userId = "${sessionScope.user_id}";

	// 현재 경로 및 마지막 경로 세그먼트 확인
	const currentPath = "${currentPath}";
	const lastPathSegment = "${lastPathSegment}";

	console.log("User ID:", userId);
	console.log("Current Path:", currentPath);
	console.log("Last Path Segment:", lastPathSegment);
</script>

<script src="<c:url value='/js/mydiary_home.js'/>"></script>

<nav class="diary_taps">
	<a id="homeTab" href="<c:url value='/mydiary/${sessionScope.user_id}/home'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_home.jsp" ? "active-tab" : ""}'/>">홈</div>
	</a>

	<a id="diaryTab" href="<c:url value='/mydiary/${sessionScope.user_id}/diary'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_diary.jsp" ? "active-tab" : ""}'/>">일기</div>
	</a>

	<a id="emotionTab" href="<c:url value='/mydiary/${sessionScope.user_id}/emotion'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_emotion.jsp" ? "active-tab" : ""}'/>">감정관리</div>
	</a>

	<a id="photosTab" href="<c:url value='/mydiary/${sessionScope.user_id}/photos'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_photos.jsp" ? "active-tab" : ""}'/>">사진첩</div>
	</a>

	<a id="calendarTab" href="<c:url value='/mydiary/${sessionScope.user_id}/calendar'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_calendar.jsp" ? "active-tab" : ""}'/>">캘린더</div>
	</a>

	<a id="friendsTab" href="<c:url value='/mydiary/${sessionScope.user_id}/friends'/>">
		<div class="<c:out value='${lastPathSegment == "mydiary_friends.jsp" ? "active-tab" : ""}'/>">친구</div>
	</a>


	

</nav>

	
	<a id="go_to_mydiary" href="<c:url value='/mydiary/${sessionScope.user_id}/home'/>"> 
		<div><img src="<c:url value='/image/home.png'/>"/></div>
	</a> 
