<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>My Diary Emotion</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diary.css' />" />
</head>
<body>

<script>
	<%
    String userId = (String) session.getAttribute("user_id");
%>
	console.log("제대로 유저 id 가져오는거 맞습니까? <%= userId %>");
</script>


<div class="all">
	<div class="diary_wrap">
		<div class="diary_content">


			<!-- 각 페이지 작업 구간  -->

			<div class="diary-container">
				<table class="diary-table">
					<thead>
					<tr>
						<th>작성일</th>
						<th>제목</th>
						<th>게시물 ID</th> <!-- 추가된 부분 -->
						<th>감정분석 ID</th> <!-- 추가된 부분 -->
					</tr>
					</thead>
					<tbody>
					<!-- emotionList 데이터를 출력 -->
					<c:forEach var="emotion" items="${emotionList}">
						<tr>
							<td><fmt:formatDate value="${emotion.diary_create}" pattern="yyyy-MM-dd" /></td>
							<td>
								<a href="/diary/detail?post_id=${emotion.sentiment_note_id}">
										${emotion.sentiment_note_id} 번째 분석 결과
								</a>
							</td>
							<td>${emotion.diary_post_id}</td> <!-- post_id를 그대로 출력하는 부분 -->
							<td>${emotion.sentiment_note_id}</td> <!-- post_id를 그대로 출력하는 부분 -->
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="?page=${currentPage - 1}&size=${pageSize}">&laquo; 이전</a>
					</c:if>

					<c:forEach var="i" begin="1" end="${totalPages}" step="1">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span>${i}</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}&size=${pageSize}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage < totalPages}">
						<a href="?page=${currentPage + 1}&size=${pageSize}">다음 &raquo;</a>
					</c:if>
				</div>

				<div class="write-diary">
					<button onclick="location.href='<c:url value='/mydiary/diarywrite' />'">다이어리 작성하기</button>
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
