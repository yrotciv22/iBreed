<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>My Diary Home</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_home.css' />" />

<!-- Slick  -->


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/slick.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/slick-theme.css'/>" />


<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mydiary_home.js'/>"></script>
<script>
	const userId = "${sessionScope.user_id}";
</script>

<script>
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('preview');
			output.src = reader.result;
			output.style.display = 'block'; // 이미지 미리보기를 보이게 설정
		};
		reader.readAsDataURL(event.target.files[0]); // 선택된 파일의 데이터를 읽어오기
	}
</script>
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
								<c:when test="${mydiary.diary_sentiment == 'love'}"> 사랑 &#128525;</c:when>
								<c:when test="${mydiary.diary_sentiment == 'surprised'}"> 놀람 &#128561;</c:when>
								<c:when test="${mydiary.diary_sentiment == 'embarrassed'}"> 당황 &#128517;</c:when>
								<c:when test="${mydiary.diary_sentiment == 'hilarious'}"> 웃김 &#128513;</c:when>
								<c:otherwise>&#128516;</c:otherwise>
							</c:choose>


							<c:if test="${sessionScope.user_id == user_id}">
								<img src="<c:url value='/image/pencil_color.png'/>"
									id="edit_feeling_btn" />
							</c:if>
						</div>


						<div id=select_feeling_wrap>
							<!-- id 중복 -->
							<form id="diaryFeelingUpdateForm"
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
									<option value="love"
										${mydiary.diary_sentiment == 'love' ? 'selected' : ''}>사랑</option>
									<option value="surprised"
										${mydiary.diary_sentiment == 'surprised' ? 'selected' : ''}>놀람</option>
									<option value="embarrassed"
										${mydiary.diary_sentiment == 'embarrassed' ? 'selected' : ''}>당황</option>
									<option value="hilarious"
										${mydiary.diary_sentiment == 'hilarious' ? 'selected' : ''}>웃김</option>
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
						<%-- <img
							src="${mydiary.diary_profile_image != 'default' ? mydiary.diary_profile_image : 'https://images.unsplash.com/photo-1480985041486-c65b20c01d1f?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dg'}" />
 --%>

<img src="${pageContext.request.contextPath}${mydiaryVO.diary_profile_image_path}" alt="Diary Image" />
						<c:if test="${sessionScope.user_id == user_id}">
							<!-- label을 사용하여 클릭 시 파일 입력 창이 열리도록 설정 -->
							<label for="fileInput">
								<div class="overlay">

									<img src="<c:url value='/image/pencil_color.png'/>"
										id="edit_profile_img_btn" />

								</div>
							</label>
						</c:if>

						<!-- 이미지 업로드 폼 -->
						<form id="uploadProfileImgForm"
							action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary/diary_profile_image'/>"
							method="post" enctype="multipart/form-data"
							style="display: none;">

							<input type="hidden" name="user_id"
								value="${sessionScope.user_id}" />
							<!-- 파일 입력 요소 style="display: none;"  -->

							<input type="file" id="fileInput" name="diary_profile_image"
								accept="image/*" onchange="previewImage(event)" />
							<!-- 이미지 미리보기 -->
							<img id="preview" src="#" alt="Image Preview"
								style="display: none; width: 200px; height: 200px;" />

							<!-- 업로드 버튼 -->
							<button type="submit">이미지 업로드</button>
							<!-- 확인 버튼 
							<button type="button" id="confirmUploadBtn"
								style="display: none;">확인</button> -->
						</form>
					</div>
					<!--  profile_photo 끝 -->



					<!-- 프로필 텍스트 수정  -->
					<form id="profilTextForm"
						action="<c:url value='/mydiary/${sessionScope.user_id}/updateDiary/diary_profile_text'/>"
						method="post">
						<input type="hidden" name="user_id"
							value="${sessionScope.user_id}" />

						<div class="profile_text_wrap">

							<div id="profile_text">${mydiary.diary_profile_text}</div>

							<textarea autofocus id="diary_profile_text"
								name="diary_profile_text" wrap="hard">
						   	${mydiary.diary_profile_text}
							</textarea>

						</div>

						<c:if test="${sessionScope.user_id == user_id}">
							<div class="edit_profile_text_btn_wrap">
								<div id="edit_profile_text_btn">
									edit &nbsp;<img src="<c:url value='/image/pencil_color.png'/>" />
								</div>
								<button id="save_profile_text_btn" type="submit">
									save &nbsp;<img src="<c:url value='/image/save_file.png'/>" />
								</button>
							</div>
						</c:if>

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
							<c:if test="${sessionScope.user_id == user_id}">
								<img src="<c:url value='/image/pencil_color.png'/>"
									id="editButton" />

								<button id="saveButton" type="submit">
									<img src="<c:url value='/image/save_file.png'/>" />
								</button>

								<span id="cancelBtn">X</<span>
							</c:if>
						</div>
					</form>


					<div class="recent_posts_wrap">
						<div>최근 작성한 다이어리</div>


						<ul>
							<c:forEach var="diary" items="${diaryList}">

								<%-- <li><fmt:formatDate value="${diary.diaryCreate}"
										pattern="yyyy-MM-dd" /></li> --%>
								<li><a
									href="<%= request.getContextPath() %>/mydiary/${user_id}/diarydetail/${diary.diaryPostId}">

										<div class="recent_post">
											<div>[${diary.diaryCategory}] ${diary.diaryTitle}</div>
											<div>
												<fmt:formatDate value="${diary.diaryCreate}"
													pattern="yyyy-MM-dd" />
											</div>
										</div>
								</a></li>

							</c:forEach>
						</ul>


					</div>
					<!-- recent_posts_wrap 끝 -->


					<div class="home_photo_wrap">
						<%-- 	<img
							src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" /> --%>

						<section class="center slider">
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1510154221590-ff63e90a136f?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1504439268584-b72c5019471e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fCVFQSVCMCU4MCVFQyVBMSVCMXxlbnwwfHwwfHx8MA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1609220136736-443140cffec6?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://plus.unsplash.com/premium_photo-1676049342411-c118fe1570b2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1530047625168-4b29bfbbe1fc?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1510588960070-8e3ebf81324c?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>
							<div>
								<img
									src="<c:url value='https://images.unsplash.com/photo-1470843810958-2da815d0e041?q=80&w=1548&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
							</div>


						</section>
					</div>
				</div>

				<!-- 각 페이지 작업 구간 끝  -->


			</div>
		</div>


		<!-- 공통 layout 다이어리 우측 탭 -->
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script charset="utf-8" type="text/javascript"
		src="<c:url value='/js/slick.js'/>"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {

			$('.center').slick({
				centerMode : true,
				/* 	centerPadding : '0px',
					slidesToShow : 1, */
				centerMode : false, // 중앙 정렬 모드 비활성화
				slidesToShow : 1, // 한 번에 보여줄 슬라이드 수
				slidesToScroll : 1, // 한 번에 스크롤할 슬라이드 수
				infinite : true, // 무한 루프 활성화
				speed : 300, // 슬라이드 전환 속도 (밀리초)
				arrows : true, // 이전/다음 화살표 표시
				dots : true
			// 네비게이션 도트 표시 (필요시)
			});

		});
	</script>
</body>
</html>
