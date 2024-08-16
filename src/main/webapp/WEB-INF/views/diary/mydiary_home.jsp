<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>My Diary Home</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_home.css' />" />

<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mydiary_home.js'/>"></script>

</head>

<body>
	<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


				<!-- 각 페이지 작업 구간  -->
				<div class="left_wrap">
					<div class="today_feeling">오늘의 기분 ${mydiary.diary_sentiment}</div>
					<div class="profile_photo">
						<img src="${mydiary.diary_profile_image}" />
					</div>
					<div class="profile_text">${sessionScope.user_nickname}</div>
				</div>

				<div class="right_wrap">

					<form
						id="diaryTitleUpdateForm"
						action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary'/>"
						method="post">
						
						<div class="diary_title">
						
						<input type="hidden" name="user_id" value="${sessionScope.user_id}" />
						
							<input 
								id="diaryTitleInput"
								type="text" 
								name="diary_title"
								value="${mydiary.diary_title}" 
								maxlength="20"
								 />
							<div id="diaryTitleDisplay">${mydiary.diary_title}</div>
							
							<img src="<c:url value='/image/pencil_color.png'/>" id="editButton" /> 


							<button id="saveButton" type="submit"><img src="<c:url value='/image/save_file.png'/>" /></button> 
						</div>
						
					</form>


					<div class="recent_posts">
						<div>최근 게시물</div>

						<ul>
							<li>게시물</li>
							<li>게시물</li>
							<li>게시물</li>
							<li>게시물</li>
						</ul>
					</div>
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
