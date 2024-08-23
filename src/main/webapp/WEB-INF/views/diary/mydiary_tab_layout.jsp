
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentPath" value="${pageContext.request.servletPath}" />
<c:set var="pathSegments" value="${fn:split(currentPath, '/')}" />
<c:set var="lastPathSegment"
	value="${pathSegments[fn:length(pathSegments) - 1]}" />


<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mydiary_home.js'/>"></script>

<nav class="diary_taps">

	<%-- <a href="<c:url value='/mydiary/${sessionScope.user_id}/home'/>"> --%>
	<a id="homeTab" href="#">
		<div class="${lastPathSegment.contains('home')? 'active-tab' : ''}">홈</div>
	</a> 
	
	<a id="diaryTab" href="#">
		<div class="${lastPathSegment.contains('_diary')? 'active-tab' : ''}">일기</div>
	</a> 
	
	<a id="emotionTab" href="#">
		<div
			class="${lastPathSegment.contains('emotion') ? 'active-tab' : ''}">감정관리</div>
	</a> 
	
	<a id="photosTab" href="#">
		<div class="${lastPathSegment.contains('photos') ? 'active-tab' : ''}">사진첩</div>
	</a> 
	
	<a id="calendarTab" href="#">
		<div
			class="${lastPathSegment.contains('calendar') ? 'active-tab' : ''}">캘린더</div>
	</a> 
	
	<a id="friendsTab" href="#">
		<div
			class="${lastPathSegment.contains('friends') ? 'active-tab' : ''}">친구</div>
	</a> 
	
<%-- 	<a id="testTab" href="#">
		<div class="${lastPathSegment.contains('test') ? 'active-tab' : ''}">TEST</div>
	</a> --%>


	

</nav>

	
	<a id="go_to_mydiary" href="<c:url value='/mydiary/${sessionScope.user_id}/home'/>"> 
		<div><img src="<c:url value='/image/home.png'/>"/></div>
	</a> 
