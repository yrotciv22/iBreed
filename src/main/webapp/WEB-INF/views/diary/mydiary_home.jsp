<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
	<title>My Diary Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_home.css' />" />
</head>

<body>
	<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


			<!-- 각 페이지 작업 구간  -->
				<div class="left_wrap">
					<div class="today_feeling">오늘의 기분</div>
					<div class="profile_photo">프로필 사진</div>
					<div class="profile_text">${sessionScope.user_nickname}</div>
				</div>

				<div class="right_wrap">
					<div class="diary_title">다이어리 제목</div>
					<div class="recent_posts">최근 게시물</div>
					<div class="home_photos">사진첩</div>
				</div>

			<!-- 각 페이지 작업 구간 끝  -->


			</div>
		</div>
		

	<!-- 공통 layout 다이어리 우측 탭 -->
	<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
