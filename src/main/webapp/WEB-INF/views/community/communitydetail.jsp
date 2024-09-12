<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="userId" value="${sessionScope.user_id}" />  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>IBREED 커뮤니티</title>
    
    <!--head 임포트  -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitycommon.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/community.css' />" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/index.js' />"></script>
    <script src="<c:url value='/js/communitycommon.js' />"></script>
	    
  </head>
  <body>
    <div class="All">
        <!-- top 임포트 -->
        <c:import url="/WEB-INF/views/layout/top.jsp" />

        <div class="Wrap">
            <div class="content-wrapper">
                <nav class="sidebar">
                <!-- 로그인 상태에 따라 다른 내용을 표시 -->
                <c:choose>
                    <c:when test="${not empty userId}">
                        <!-- 로그인된 상태 -->
                        <div id="after-login" class="profile-container" style="display: none;">
                            <div class="profile-header">
                                <img src="${user.user_profile_image != null ? user.user_profile_image : '/image/default-profile.png'}" alt="Profile Image" class="profile-img">
                                <div>
                                   <p>${sessionScope.user_nickname}님</p>
                                   <p>${sessionScope.user_id}</p>
                                   <p>레벨${sessionScope.user_rate}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="profile-links">
                                <p><a href="/user/posts">내가 쓴 게시글</a></p>
                                <p><a href="/user/comments">내가 쓴 댓글</a></p>
                                <p><a href="/user/likes">좋아요한 게시글</a></p>
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
	                        <h1>${post.postTitle}</h1>
	                        <p>작성자: ${post.userId}</p>
	                        <p>작성일: <fmt:formatDate value="${post.postCreate}" pattern="yyyy.MM.dd HH:mm" /></p>
	                        <p>조회수: ${post.postCount}</p>
	                        <p>${post.postContent}</p>
	                        
	                        <!-- 좋아요 기능 -->
	                        <form action="/community/board/${post.boardId}/post/${post.postId}/like" method="post">
	                            <button type="submit">❤️ 좋아요 ${post.likeCount}</button>
	                        </form>
	                </div>
                    
                    <!-- 댓글 섹션 -->
                    <div class="comments-section">
                        <h2>댓글</h2>
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment">
                                <p><strong>${comment.commentIdWrite}</strong> | <fmt:formatDate value="${comment.commentCreate}" pattern="yyyy.MM.dd HH:mm" /></p>
                                <p>${comment.commentContent}</p>
                                <!-- 대댓글 버튼 -->
                                <button class="reply-btn" onclick="showReplyForm(${comment.commentId})">답글</button>

                                <!-- 대댓글 폼 -->
                                <div class="reply-form" id="reply-form-${comment.commentId}" style="display: none;">
                                    <form action="/community/board/${post.boardId}/post/${post.postId}/comment/reply" method="post">
                                        <input type="hidden" name="parentCommentId" value="${comment.commentId}">
                                        <textarea name="replyContent" placeholder="답글을 입력하세요"></textarea>
                                        <button type="submit">등록</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- 댓글 작성 폼 -->
                        <div class="comment-form">
                            <form action="/community/board/${post.boardId}/post/${post.postId}/comment" method="post">
                                <textarea name="commentContent" placeholder="댓글을 입력하세요"></textarea>
                                <label><input type="checkbox" name="commentSecret" value="1" /> 비밀 댓글</label>
                                <button type="submit">댓글 등록</button>
                            </form>
                        </div>
                    </div>
                </main>
                
                <div id="to_top_Btn">Top</div>
            </div>
        </div>

        <!-- bottom 임포트 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
    </div>

    <script>
        function showReplyForm(commentId) {
            var replyForm = document.getElementById('reply-form-' + commentId);
            replyForm.style.display = replyForm.style.display === 'none' ? 'block' : 'none';
        }
    </script>
  </body>
</html>
