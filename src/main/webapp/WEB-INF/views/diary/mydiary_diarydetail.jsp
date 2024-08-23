<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>My Diary Diary detail</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diarydetail.css' />" />
</head>
<body>
<div class="all">
    <div class="diary_wrap">
        <div class="diary_content">

            <!-- 각 페이지 작업 구간  -->

            <div class="diary_header">
                <h1>${diary.diaryCategory}</h1>
                <div class="diary_meta">
                    <span class="diary_date">${diary.diaryCreate}</span>
                    <div class="diary_actions">
                        <a href="<c:url value='/mydiary/diarywrite?diaryPostId=${diary.diaryPostId}'/>">수정</a>
                        <a href="<c:url value='/mydiary/diarydelete?diaryPostId=${diary.diaryPostId}'/>">삭제</a>
                    </div>
                </div>
            </div>

            <h2>${diary.diaryTitle}</h2>

            <div class="diary_body">
                <p>${diary.diaryContent}</p>
            </div>

            <!-- 좋아요 및 댓글 기능 -->
            <div class="diary_interaction">
                <button class="like_button">좋아요 ${diary.diaryLike}</button>
                <button class="comment_button">댓글 ${diary.commentCount}</button>
            </div>

            <!-- 댓글 입력 및 표시 -->
            <div class="diary_comments">
                <!-- 여기에 댓글 리스트 및 입력 폼을 구현 -->
            </div>

            <div class="diary_footer">
                <button class="back_button" onclick="location.href='<c:url value='/mydiary/${sessionScope.user_id}/diary' />'">목록으로</button>
            </div>

            <div class="diary_emotion">
                <button class="back_button"
                        onclick="location.href='<c:url value='/diary/emotialresult'/>?user_id=${sessionScope.user_id}&diaryPostId=${diary.diaryId}'">감정분석 시작</button>
            </div>

            <!-- 각 페이지 작업 구간 끝  -->

        </div>
    </div>

    <!-- 공통 layout 다이어리 우측 탭 -->
    <c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

</div>

<script>
    console.log("Current User ID: ${sessionScope.user_id}");
</script>
</body>
</html>
