<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="userId" value="${sessionScope.user_id}" />  

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>iBreed 커뮤니티:임신출산</title>
	
	<!-- 공통 layout: head.jsp -->
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitycommon.css' />" />

	<link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communityBoard.css' />" />
	
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/communitycommon.js' />"></script>
</head>

<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->
		<div class="Wrap">
            <div class="content-wrapper">
                <nav class="sidebar">
                <!-- 로그인 상태에 따라 다른 내용을 표시 -->
                <c:choose>
                    <c:when test="${not empty userId}">
                        <!-- 로그인된 상태 -->
                        <div id="after-login" class="profile-container" style="display: none;">
                            <div class="profile-header">
                            <!-- 프사없으면 기본프사적용, 경로재설정필요 -->
                                <!-- 프사 없으면 기본 프사 적용 -->
								<img src="${user.profileImage != null ? user.profileImage : '/image/default-profile.png'}" alt="Profile Image" class="profile-img">

                                <div>
                                   <p>${sessionScope.user_nickname}님</p>
                                   <p>${sessionScope.user_id}</p>  
                                   <p>${sessionScope.user_rate}.Lv</p> 
                                </div>
                            </div>
                            <hr>
                            <div class="profile-links">
                                <p><a href="/user/posts">내가 쓴 게시글</a></p>
                                <p><a href="/user/comments">내가 쓴 댓글</a></p>
                                <p><a href="/user/likes">좋아요한 게시글</a></p>
                            </div>
                            <hr>
                            <a href="/community/write" class="community-write-btn">커뮤니티 글쓰기</a>
                            <a href="/logout" class="logout-btn">로그아웃</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인되지 않은 상태 -->
                        <div class="login-container" id="before-login">	
                            <div class="login-button">
                                <a href="<c:url value='/login'/>" class="login-link" id="login-Btn">IBREED 로그인</a>
                                <div class="add-links">
                                    <a href="<c:url value='/findID' />" class="add-link">아이디찾기</a>
                                    <span>|</span>
                                    <a href="<c:url value='/findpwd' />" class="add-link">비밀번호찾기</a>
                                    <span>|</span>
                                    <a href="<c:url value='/join' />" class="add-link">회원가입</a>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                
               <ul>
				    <li><a href="/community/board/1" class="nav-link ${board.boardId == 1 ? 'active' : ''}">임신출산</a></li>
				    <li><a href="/community/board/2" class="nav-link ${board.boardId == 2 ? 'active' : ''}">육아정보</a></li>
				    <li><a href="/community/board/3" class="nav-link ${board.boardId == 3 ? 'active' : ''}">후기정보</a></li>
				    <li><a href="/community/board/4" class="nav-link ${board.boardId == 4 ? 'active' : ''}">중고마켓</a></li>
				    <li><a href="/community/board/5" class="nav-link ${board.boardId == 5 ? 'active' : ''}">구인구직</a></li>
				</ul>
                </nav>
                <main class="main-section">
	                <div class="header-content">
	                      <h1>${board.boardName}</h1>
	                        <div class="search-bar">
							    <form action="/community/search" method="get">
							        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
							        <button type="submit">통합검색</button>
							    </form>
							</div>
	                    </div>
		<!--  여기까진 커뮤니티에 공통으로 포함되어야함.나머지 페이지별 다른건 아래에 작성-->
		 
  
                    <!-- 게시판 목록 -->
                    <div class="board-content">
                        <table class="board-table">
                            <!-- 공지사항 -->
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                    <th>좋아요</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 공지사항 목록 -->
                                <c:forEach var="notice" items="${notices}">
                                    <tr class="notice">
                                        <td><a href="/community/post/${notice.postId}">📢 ${notice.postTitle}</a></td>
                                        <td>${notice.userId}</td>
                                        <td><fmt:formatDate value="${notice.postCreate}" pattern="yyyy.MM.dd" /></td>
                                        <td>${notice.postCount}</td>
                                        <td>${notice.likes}</td>
                                    </tr>
                                </c:forEach>

                                <!-- 일반 게시글 목록 -->
                                <c:forEach var="post" items="${posts}">
                                    <tr>
                                        <td><a href="/community/post/${post.postId}">${post.postTitle}</a></td>
                                        <td>${post.userId}</td>
                                        <td><fmt:formatDate value="${post.postCreate}" pattern="yyyy.MM.dd" /></td>
                                        <td>${post.postCount}</td>
                                        <td>${post.postLikes}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- 페이지네이션 -->
                        <div class="pagination">
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <a href="?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
                            </c:forEach>
                        </div>

                        <!-- 글쓰기 버튼 -->
                        <div class="write-btn">
                            <a href="/community/board/${board.boardId}/write" class="btn">글쓰기</a>
                        </div>
                    </div>
                </main>
	
		<!-- 본문 끝 -->

		<div id="to_top_Btn">Top</div>
		</div>
		</div>
		
		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>