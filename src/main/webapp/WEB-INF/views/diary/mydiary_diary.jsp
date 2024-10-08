<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary diary</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diary.css' />" />
<%-- <script>
        <%String userId = (String) session.getAttribute("user_id");%>
        console.log("제대로 유저 id 가져오는거 맞습니까? <%=userId%>");
</script> --%>
<script>
    console.log("User ID in JSP: ${user_id}");
</script>
</head>
<body>

	<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


				<!-- 각 페이지 작업 구간  -->

				<div class="diary-container">
					<table class="diary-table">
						<thead>
							<tr>
								<th>작성일</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>조회수</th>
								<th>공개여부</th>
							</tr>
						</thead>
						<tbody>
							<!-- 백엔드연동완 -->
							<c:forEach var="diary" items="${diaryList}">
								<tr>
									<td><fmt:formatDate value="${diary.diaryCreate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${diary.diaryCategory}</td>
									<td>
									<a href="<c:url value='/mydiary/${user_id}/diarydetail/${diary.diaryPostId}'/>">
											${diary.diaryTitle} </a></td>
											
									<td>${diary.diaryViews}</td>
									
								    <td>
								        
								        <!-- 공개 여부는 주인에게만 보임 -->
								        <c:if test="${user_id == diary.userId}">
										    ${diary.diaryPublic}
										</c:if>
										<c:if test="${user_id != diary.userId}">
										   <!-- 또는 빈 칸 -->
										</c:if>
								    </td>		
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="pagination">
						<c:if test="${currentPage > 1}">
							<a href="?page=${currentPage - 1}&size=${pageSize}">&laquo;
								이전</a>
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
							<a href="?page=${currentPage + 1}&size=${pageSize}">다음
								&raquo;</a>
						</c:if>
					</div>

					<div class="write-diary">
					    <c:if test="${sessionScope.user_id == user_id}">
					        <button onclick="location.href='/mydiary/${sessionScope.user_id}/diarywrite'">다이어리 작성하기</button>
					    </c:if>
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
