<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary Friends</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_friends.css' />" />

<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mydiary_friend.js'/>"></script>
<script>
	const userId = "${sessionScope.user_id}";
</script>
</head>
<body>

	<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


				<!-- 각 페이지 작업 구간  -->

				<c:choose>
					<c:when test="${not empty friendList}">
						<div class="friends_all">

							<c:forEach var="f" items="${friendList}">
								<div class="friend_wrap">

									<div class="frd_profile_img">

										<c:url var="defaultImageUrl" value="/image/profile_woman.png" />
										<img
											src="${f.user_profile_image != 'default' ? f.user_profile_image : defaultImageUrl}" />

									</div>

									<div class="column_wrap">
										<div class="frd_profile_nickname">${f.user_nickname}</div>
										<div class="frd_profile_id">${f.user_id}</div>
										<div class="trigger see_more">...</div>

										<div class="click_see_more">
											<ul>
												<a href="<c:url value='/mydiary/${f.user_id}/home'/>"><li>다이어리
														방문하기</li></a>
												<li>프로필 보기</li>

												<c:if test="${sessionScope.user_id == user_id}">
													<a
														href="<c:url value='/mydiary/${user_id}/deleteFriend/${f.user_id}'/>"
														onclick="return confirm('정말 삭제하시겠습니까?');">
														<li class="delete_friend">친구 끊기</li>
													</a>
												</c:if>

											</ul>
										</div>

									</div>

								</div>
							</c:forEach>

						</div>
					</c:when>
					<c:otherwise>
						<div>아직 친구가 없습니다.</div>
					</c:otherwise>
				</c:choose>


			</div>
		</div>


		<!-- 공통 layout 다이어리 우측 탭 -->
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
