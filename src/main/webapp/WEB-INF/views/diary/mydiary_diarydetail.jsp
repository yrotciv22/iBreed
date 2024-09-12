<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>My Diary Detail</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diarydetail.css' />" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/mydiary_diarydetail.js' />"></script>
	<script src="<c:url value='/js/mydiary_diarycomment.js' />"></script>
	<meta name="user-id" content="${sessionScope.user_id}">
	<meta name="diary-post-id" content="${diary.diaryPostId}">
 
</head>
<body>
<div class="all">
   <div class="diary_wrap">
    <div class="diary_content">
        <div class="diary_container">
            <!-- 다이어리 상단 (제목 및 기본 정보) -->
            <div class="diary_header">
                <h1>${diary.diaryCategory}</h1>
                <div class="diary_meta">
                    <div class="diary_actions">
					    <c:if test="${sessionScope.user_id == diary.userId}">
					        <button class="editBtn" data-diary-id="${diary.diaryPostId}">수정</button>
					        <span>|</span>
					        <button class="deleteBtn" data-diary-id="${diary.diaryPostId}">삭제</button>	
					    </c:if>
					</div>
                </div>
            </div>

            <h2>${diary.diaryTitle}</h2>

                    <span class="diary_date">${diary.diaryCreate}</span>
            <hr>

            <!-- 다이어리 본문 -->
            <div class="diary_body">
                <p>${diary.diaryContent}</p>
               
            </div>

           <!-- 좋아요 및 댓글 기능 -->
					<div class="diary_interaction">
						<button class="like_button" data-diary-post-id="${diaryPostId}" >
						       
						        좋아요 <span class="like_count">${diary.diaryLike}</span>
						    </button>                
						 <button class="comment_button">댓글 ${commentCount}</button>
            		</div>


            <!-- 댓글 영역 -->
            <hr>
            <div class="diary_comments">
                <!-- 댓글 목록 -->
                <div class="comment_list">
                    <c:forEach var="comment" items="${comments}">
                        <div class="comment" data-comment-id="${comment.id}" style="margin-left: ${comment.parentCommentId != 0 ? '20px' : '0px'};">
                            <div class="comment_header">
                               <span class="comment_user">${comment.diaryCommentUserIdWrite}</span>
                              <div class="comment_actions">
						        <c:if test="${sessionScope.user_id == diary.userId}">
						            <button class="editCommentBtn" data-comment-id="${comment.id}">수정</button>
						            <button class="deleteCommentBtn" data-comment-id="${comment.id}">삭제</button>
						        </c:if>
						    </div>
                            </div>
                            <div class="comment_body">
                                <p>${comment.diaryCommentContent}</p>
                            </div>
                            
                            <!-- 답글쓰기 버튼 -->
                             <div class="comment_footer">
                                <span class="comment_date">
							    <fmt:formatDate value="${comment.createdAt}" pattern="yyyy.MM.dd HH:mm" />
								</span>
                                <button class="replyCommentBtn" data-parent-id="${comment.id}">답글쓰기</button>
                                
                            </div>

                            <!-- 답글 입력 폼 (초기에는 숨김 처리) -->
                             <div class="reply_form" style="display: none;">
                                <textarea placeholder="답글을 입력하세요" class="reply_content"></textarea>
                                <div class="reply_buttons">
                                    <button class="cancel_reply">취소</button>
                                    <button class="submit_reply">등록</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 댓글 입력 폼 -->
                <div class="comment_form">
                    <textarea placeholder="댓글을 입력하세요" id="commentContent"></textarea>
                    <div>
                        <input type="checkbox" id="isSecret" /> 비밀댓글
                    </div>
                    <button id="submitComment">댓글 달기</button>
                </div>
            </div>

            <!-- 하단 버튼들 -->
            <div class="diary_footer">
                <button class="back_button" onclick="location.href='<c:url value='/mydiary/${sessionScope.user_id}/diary' />'">목록으로</button>
                <button class="emotion_button" onclick="location.href='<c:url value='/diary/emotialresult'/>?user_id=${sessionScope.user_id}&diaryPostId=${diaryPostId}'">감정분석 시작</button>
            </div>
        </div>
    </div>
</div>


    <!-- 공통 layout 다이어리 우측 탭 -->
    <c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />
</div>

<script>
    console.log("지금 접속자: ${sessionScope.user_id}");

</script>
</body>
</html>
