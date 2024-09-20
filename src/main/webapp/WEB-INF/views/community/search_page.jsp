<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<!-- 여기에 css, js 파일 링크를 작성하세요. -->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/search_page.css'/>" />


</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->

		<div class="search_result_wrap">

			<c:if test="${not empty postList}">

				<main class="main-section">
					<div class="result_title">
						검색 결과 <span>${resultCount}</span>개
					</div>


					<!-- 게시글 목록 (공지사항 + 일반 게시글) -->
					<div id="postsContainer" class="list-view">
						<!-- 고정된 테이블 헤더 -->
						<table class="board-table list-view-content">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>						
								</tr>
							</thead>
							<tbody>
								<c:forEach var="post" items="${postList}">
									<tr>
										<td>${post.postId}</td>
										<!-- 0부터 시작하므로 +1 -->
										<td><a href="/community/post/${post.postId}">${post.postTitle}</a></td>
										<td>${post.postContent}</td>
										<td>${post.userId}</td>
										<td><fmt:formatDate value="${post.postCreate}"
												pattern="yyyy.MM.dd" /></td>
										<td>${post.postCount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>



					</div>



					<!-- 페이지네이션 -->
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



				</main>
			</c:if>

			
			<c:if test="${empty postList}">
				<p class="no_result">검색 결과가 없습니다.
				<div class="go_home">
					<a href="<c:url value='/'/>">홈화면으로 이동</a>
				</div>
				</p>
			</c:if>

		</div>

		<!-- 본문 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>