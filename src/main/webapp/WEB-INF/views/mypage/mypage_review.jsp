<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>iBreed Mypage</title>

	<!-- 공통 layout: head.jsp -->
	<c:import url="/WEB-INF/views/layout/head.jsp" />

	<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage/mypage_layout.css'/>" />

	<style>
		.review-section {
			margin: 20px;
		}

		.review-header {
			display: flex;
			justify-content: space-between;
			padding: 10px;
			font-size: 20px;
			border-bottom: 2px solid #ccc;
		}

		.review-list {
			margin-top: 20px;
			border-top: 1px solid #000;
			padding-top: 10px;
		}

		.review-item {
			display: flex;
			justify-content: space-between;
			padding: 10px;
			border-bottom: 1px solid #ccc;
		}

		.review-item img {
			width: 60px;
			height: 60px;
			background-color: #ddd;
		}

		.review-item div {
			flex: 1;
			margin-left: 10px;
		}

		.review-item button {
			padding: 5px 10px;
			background-color: #ccc;
			border: none;
			cursor: pointer;
		}

		.review-item button:hover {
			background-color: #bbb;
		}

		.no-reviews {
			text-align: center;
			padding: 20px;
			font-size: 16px;
			color: #888;
		}
	</style>
</head>

<body>
<div class="all">
	<!-- 공통 layout: top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />

	<!-- 공통 마이페이지 mypage_layout.jsp -->
	<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

	<div class="contents_wrap">
		<!-- 본문작성 -->
		<div class="review-section">
			<div class="review-header">
				<div>내가 작성한 리뷰 : <c:out value="${fn:length(list)}"/></div>
			</div>

			<div class="review-list">
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="review" items="${list}">
							<div class="review-item">
								<img src="<c:url value='${review.img}'/>" alt="상품 이미지">
								<div>
									<p>${review.review_time} 결제</p>
									<p>${review.review_title}</p>
									<div>
										<c:forEach begin="1" end="5" var="i">
											<c:choose>
												<c:when test="${i <= review.review_rating}">
													&#9733;
												</c:when>
												<c:otherwise>
													&#9734;
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<div>
									<p>${review.review_coment}</p>
								</div>
<%--								<button>삭제하기</button>--%>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="no-reviews">
							작성하신 리뷰가 없습니다.
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- 본문작성 끝 -->
	</div>
</div>

<!-- 공통 layout: botton.jsp -->
<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>
