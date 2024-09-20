<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="userId" value="${sessionScope.user_id}" />  
<c:set var="boardId" value="${board.boardId}" />

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
							<img src="${sessionScope.user_profile_image}" />

                                <div>
                                   <p>${sessionScope.user_nickname}님</p>
                                   <p>${sessionScope.user_id}</p>  
                                   <p>${sessionScope.user_rate}.Lv</p> 
                                </div>
                            </div>
                            <hr>
                         
								<a href="/community/communityWrite" class="community-write-btn">커뮤니티 글쓰기</a>                            
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
							        <input type="hidden" name="boardId" value="${board.boardId}"> <!-- 보드 ID 추가 -->
							    
							        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
							        <button type="submit">통합검색</button>
							    </form>
							</div>
							
	                    </div>
							

		<!--  여기까진 커뮤니티에 공통으로 포함되어야함.나머지 페이지별 다른건 아래에 작성-->
		 
						<!-- 게시글 목록 (공지사항 + 일반 게시글) -->
						<div id="postsContainer"  class="list-view">
						    <!-- 고정된 테이블 헤더 -->
						    <table class="board-table list-view-content">
						        <thead>
						            <tr>
						            	
						                <th>번호</th>
						                <th>제목</th>
						                <th>작성자</th>
						                <th>작성일</th>
						                <th>조회수</th>
						                <th>좋아요</th>
						            </tr>
						        </thead>
						        <tbody>
						   
						
						       <c:if test="${not empty posts}">
						    <c:forEach var="post" items="${posts}">
						        <tr>
						            <td>${post.postId}</td>
						            <td><a href="/community/board/${post.boardId2}/postdetail/${post.postId}">[${post.postHeading}]${post.postTitle}</a></td>
						            <td>${post.userId}</td>
						            <td><fmt:formatDate value="${post.postCreate}" pattern="yyyy.MM.dd" /></td>
						            <td>${post.postCount}</td>
						            <td>${post.postLikes}</td>
						        </tr>
						    </c:forEach>
						</c:if>
						<c:if test="${empty posts}">
						    <tr>
						        <td colspan="6">검색 결과가 없습니다.</td>
						    </tr>
						</c:if>
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
	
		<!-- 본문 끝 -->

		<div id="to_top_Btn">Top</div>
		</div>
		</div>
		
		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>