
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="currentPath" value="${pageContext.request.servletPath}" />
<c:set var="pathSegments" value="${fn:split(currentPath, '/')}" />
<c:set var="lastPathSegment" value="${pathSegments[fn:length(pathSegments) - 1]}" />

<nav class="diary_taps">
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/home'/>">
		<div class="${lastPathSegment.contains('home')? 'active-tab' : ''}">홈</div>
	<%-- <div class="${pageContext.request.requestURI.contains('home')> --%>		
	</a> 
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/diary'/>">
		<div  class="${lastPathSegment.contains('_diary')? 'active-tab' : ''}">일기</div>
	</a> 
	
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/emotion'/>">
		<div class="${lastPathSegment.contains('emotion') ? 'active-tab' : ''}">감정관리</div>
	</a> 
	
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/photos'/>">
		<div class="${lastPathSegment.contains('photos') ? 'active-tab' : ''}">사진첩</div>
	</a> 
	
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/calendar'/>">
		<div class="${lastPathSegment.contains('calendar') ? 'active-tab' : ''}">캘린더</div>
	</a> 
	
	<a href="<c:url value='/mydiary/${sessionScope.user_id}/friends'/>">
		<div class="${lastPathSegment.contains('friends') ? 'active-tab' : ''}">친구</div></a>
</nav>
