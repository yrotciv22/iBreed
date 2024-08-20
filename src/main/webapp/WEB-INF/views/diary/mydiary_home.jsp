<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

					<div class="today_feeling_wrap">
						<div class="today_feeling_title">Today is.. &nbsp;</div>
						<div id="today_feeling">
							<c:choose>
								<c:when test="${mydiary.diary_sentiment == 'happy'}"> 행복 &#128516;</c:when>
								<c:when test="${mydiary.diary_sentiment == 'sad'}"> 슬픔 &#128546; </c:when>
								<c:when test="${mydiary.diary_sentiment == 'angry'}"> 화남 &#128544; </c:when>
								<c:when test="${mydiary.diary_sentiment == 'depressed'}"> 우울 &#128532;</c:when>
								<c:when test="${mydiary.diary_sentiment == 'touched'}"> 감동 &#128532;</c:when>
								<c:otherwise> ?? </c:otherwise>
							</c:choose>
							<img src="<c:url value='/image/pencil_color.png'/>"
								id="edit_feeling_btn" />
						</div>


						<div id=select_feeling_wrap>
							<form id="diaryTitleUpdateForm"
								action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary/diary_sentiment'/>"
								method="post">

								<select id="select_feeling_select" name="diary_sentiment">
									<option value="happy"
										${mydiary.diary_sentiment == 'happy' ? 'selected' : ''}>행복</option>
									<option value="sad"
										${mydiary.diary_sentiment == 'sad' ? 'selected' : ''}>슬픔</option>
									<option value="angry"
										${mydiary.diary_sentiment == 'angry' ? 'selected' : ''}>화남</option>
									<option value="depressed"
										${mydiary.diary_sentiment == 'depressed' ? 'selected' : ''}>우울</option>
									<option value="touched"
										${mydiary.diary_sentiment == 'touched' ? 'selected' : ''}>감동</option>
								</select> <input type="hidden" name="diary_id"
									value="${mydiary.diary_id}">

								<button id="save_feeling_btn" type="submit">
									<img src="<c:url value='/image/save_file.png'/>" />
									
								</button>
							</form>
						</div>

					</div>
					<!--  today_feeling_wrap 끝 -->

					<div class="profile_photo">
						<img src="${mydiary.diary_profile_image}" />
							
							  <div class="overlay">
							  <img src="<c:url value='/image/pencil_color.png'/>"
								id="edit_profile_img_btn" />
								</div>
					</div>


					<!-- 프로필 텍스트 수정  -->
					<form id="profilTextForm"
						action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary/diary_profile_text'/>"
						method="post">
						<input type="hidden" name="user_id"
							value="${sessionScope.user_id}" />

						<div class="profile_text_wrap">

							<div id="profile_text">${mydiary.diary_profile_text}</div>

							<textarea autofocus id="diary_profile_text"
								name="diary_profile_text"
								wrap="hard">
						   	${mydiary.diary_profile_text}
							</textarea>

						</div>

						<div class="edit_profile_text_btn_wrap">
							<div id="edit_profile_text_btn">
								edit &nbsp;<img src="<c:url value='/image/pencil_color.png'/>" />
							</div>
							<button id="save_profile_text_btn" type="submit">
								save &nbsp;<img src="<c:url value='/image/save_file.png'/>" />
							</button>
						</div>

					</form>

				</div>

				<div class="right_wrap">

					<form id="diaryTitleUpdateForm"
						action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary/diary_title'/>"
						method="post">
						<div class="diary_title">
							<input type="hidden" name="user_id"
								value="${sessionScope.user_id}" /> <input id="diaryTitleInput"
								type="text" name="diary_title" value="${mydiary.diary_title}"
								maxlength="20" />

							<div id="diaryTitleDisplay">${mydiary.diary_title}</div>
							<img src="<c:url value='/image/pencil_color.png'/>"
								id="editButton" />

							<button id="saveButton" type="submit">
								<img src="<c:url value='/image/save_file.png'/>" />
							</button>

							<span id="cancelBtn">X</<span>
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
					<div class="home_photo_wrap">
						<div>사진첩</div>
					</div>
				</div>

				<!-- 각 페이지 작업 구간 끝  -->


			</div>
		</div>


		<!-- 공통 layout 다이어리 우측 탭 -->
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
