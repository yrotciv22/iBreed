<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="userId" value="${sessionScope.user_id}" />  
<c:set var="userNickname" value="${sessionScope.user_nickname}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>IBREED 커뮤니티</title>
    
    <!-- head import -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitydetail.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitycommon.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/community.css' />" />
	
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/index.js' />"></script>
    <script src="<c:url value='/js/communitycommon.js' />"></script>
    <script src="<c:url value='/js/communitydetail.js' />"></script>
    <script src="<c:url value='/js/communitycomment.js' />"></script>
        
    
    
    
    <meta name="user-id" content="${sessionScope.user_id}">
    <meta name="post-id" content="${post.postId}">
    <meta name="board-id" content="${board.boardId}">
  </head>
  <body>
    <div class="All">
        <!-- top import -->
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
                                <img src="${sessionScope.user_profile_image}" />
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
				    <div class="post-header">
					    <div class="post-category">
					       <h3><a href="/community/board/${board.boardId}">📖${board.boardName}></a></h3>
					    </div>
					    <h1>${post.postTitle}</h1>
					    <div class="post-info">
					        <div class="user-info">
					            <img src="${profileImage}" alt="Profile Image">
					           	
					           	<div class="user-details"> 
					           	<div class="nickname-and-id">
					            <h4 class="author-nickname">${authorNickname}</h4>
					             <span class="userId">${post.userId}</span>
					        	  </div>
							 <div class="metadata-details">					             
								<span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy.MM.dd HH:mm" /></span>
								 <span class="post-views">조회 ${post.postCount}</span>
					          </div>
					        </div>
					    </div>
			                    <div class="post_actions">
								    <c:if test="${sessionScope.user_id == post.userId}">
								        <button class="editPostBtn" data-post-id="${post.postId}">수정</button>
								        <span>|</span>
								        <button class="deletePostBtn" data-post-id="${post.postId}">삭제</button>	
								    </c:if>
								</div>
					</div>
				</div>
                    <div class="post-content">
                        <p>${post.postContent}</p>
                    </div>
              <!-- 좋아요 및 댓글 기능 -->
					<div class="post-actions">
					    <button class="like-btn" data-post-id="${post.postId}">
					        좋아요 <span class="like_count">${post.postLikes}</span>
					    </button>
					    <button class="comment-btn"> 댓글 ${commentCount}</button>
					</div>
					
					<!-- 댓글 영역 -->
					<hr>
					<div class="comments-section" style="display: block;">
					    <h2>댓글</h2>
					    <!-- 댓글 목록 -->
					    <div class="comment_list">
					        <c:forEach var="comment" items="${comments}">
					            <div class="comment" data-comment-id="${comment.comment_id}" style="margin-left: ${comment.parent_comment_id != 0 ? '20px' : '0px'};">
					                <div class="comment_header">
					                  <strong>${comment.comment_id_write}</strong>
					              
					                    <div class="comment_actions">
					                        <c:if test="${sessionScope.user_id == comment.comment_id_write}">
					                            <button class="editCommentBtn" data-comment-id="${comment.comment_id}">수정</button>
					                            <button class="deleteCommentBtn" data-comment-id="${comment.comment_id}">삭제</button>
					                        </c:if>
					                    </div>
					                </div>
					                <div class="comment_body">
					                    <p>${comment.comment_content}</p>
					                </div>
										 <!-- 수정 폼 (초기에는 숨김 처리) -->
						            <div class="edit-form" style="display: none;">
						                <textarea class="edit_content">${comment.comment_content}</textarea>
						                <button class="saveBtn" data-comment-id="${comment.comment_id}">저장</button>
						                <button class="cancelBtn">취소</button>
						            </div>
					                <!-- 답글쓰기 버튼 -->
					                <div class="comment_footer">
					                   <span class="comment_date">
									    <fmt:formatDate value="${comment.comment_create}" pattern="yyyy.MM.dd HH:mm" />
									</span>
					                    <button class="reply-btn" data-parent-id="${comment.comment_id}">답글쓰기</button>
					                </div>
					
					                <!-- 답글 입력 폼 (초기에는 숨김 처리) -->
					                <div class="reply-form" style="display: none;">
					                    <textarea placeholder="답글을 입력하세요" class="reply_content"></textarea>
					                    <div class="reply_buttons">
					                        <button class="cancel_reply">취소</button>
					                        <button class="submit_reply">등록</button>
					                    </div>
					                </div>
					            </div>
					        </c:forEach>
					    </div>
					
					    <!-- 로그인 여부에 따라 댓글 입력 폼 또는 로그인 요청 메시지 표시 -->
					    <c:choose>
					        <c:when test="${not empty sessionScope.user_id}">
					            <!-- 댓글 입력 폼 -->
					            <div class="comment_form">
					                <textarea placeholder="댓글을 입력하세요" id="commentContent"></textarea>
					                
					                <button id="submitComment">댓글 달기</button>
					            </div>
					        </c:when>
					        <c:otherwise>
					            <!-- 로그인 필요할 때 메시지 -->
					            <div class="login-prompt">
					                <p>댓글을 작성하려면 <a href="/login">로그인</a> 해주세요.</p>
					            </div>
					        </c:otherwise>
					    </c:choose>
					</div>
            <!-- 하단 버튼들 -->
						<div class="bottom-buttons">
					    <!-- 목록으로 가기 버튼 -->
					    <button class="back-to-list-btn" onclick="window.location.href='/community/board/${board.boardId}'">목록으로</button>
					
					    <!-- 추가할 버튼 예시 -->
					    <button class="write-post-btn" onclick="window.location.href='/community/communityWrite'">새 글 쓰기</button>
					</div>


						
                    </div>
                </main>
            </div>
        </div>

        <!-- bottom import -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
    </div>

  </body>
</html>
