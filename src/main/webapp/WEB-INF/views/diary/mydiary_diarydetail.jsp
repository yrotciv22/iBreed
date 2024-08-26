<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>My Diary Detail</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diarydetail.css' />" />
    	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/mydiary_diarydetail.js' />"></script>
 
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
                        <a href="#" class="editBtn" data-diary-id="${diary.diaryPostId}">수정</a>
                        <span>|</span>
            			<a href="#" class="deleteBtn" data-diary-id="${diary.diaryPostId}">삭제</a>	
                    </div>
                </div>
            </div>

            <h2>${diary.diaryTitle}</h2>

                    <span class="diary_date">${diary.diaryCreate}</span>
            <hr>

            <!-- 다이어리 본문 -->
            <div class="diary_body">
                <p>${diary.diaryContent}</p>
                <img src="${diary.diaryFile}" alt="Diary Image">

            </div>

            <!-- 좋아요 및 댓글 기능 -->
            <div class="diary_interaction">
                <button class="like_button">좋아요 ${diary.diaryLike}</button>
                <button class="comment_button">댓글 ${diary.commentCount}</button>
            </div>


            <!-- 댓글 영역 -->
            <div class="diary_comments">
                <!-- 댓글 목록 및 입력 폼 -->
                <div class="comment_list">
                    <!-- 여기서 반복문으로 댓글을 출력 -->
                    <c:forEach var="comment" items="${comments}">
                        <div class="comment">
                            <div class="comment_header">
                                <span class="comment_user">${comment.userId}</span>
                                <span class="comment_date">${comment.createDate}</span>
                            </div>
                            <div class="comment_body">
                                <p>${comment.commentContent}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- 댓글 입력 폼 -->
                <div class="comment_form">
                    <textarea placeholder="댓글을 입력하세요"></textarea>
                    <button>댓글 달기</button>
                </div>
            </div>

            <!-- 하단 버튼들 -->
            <div class="diary_footer">
                <button class="back_button" onclick="location.href='<c:url value='/mydiary/${sessionScope.user_id}/diary' />'">목록으로</button>
                <button class="emotion_button" onclick="location.href='<c:url value='/diary/emotialresult'/>?user_id=${sessionScope.user_id}&diaryPostId=${diary.diaryId}'">감정분석 시작</button>
            </div>
        </div>
    </div>
</div>


    <!-- 공통 layout 다이어리 우측 탭 -->
    <c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />
</div>

<script>
    console.log("지금 접속자": ${sessionScope.user_id}");

</script>
</body>
</html>
