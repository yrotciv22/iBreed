 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


		<nav class="diary_taps">
			<a href="<c:url value='/mydiary/${sessionScope.user_id}'/>"><div>홈</div></a> 
			<a href="<c:url value='/mydiary/diary'/>"><div>일기</div></a> 
			<a href="<c:url value='/mydiary/emotion'/>"><div>감정관리</div></a> 
			<a href="<c:url value='/mydiary/photos'/>"><div>사진첩</div></a> 
			<a href="<c:url value='/mydiary/calendar'/>"><div>캘린더</div></a> 
			<a href="<c:url value='/mydiary/friends'/>"><div>친구</div></a> 
		</nav> 