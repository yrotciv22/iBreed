<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="userId" value="${sessionScope.user_id}" />  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>iBreed 커뮤니티 글쓰기</title>
    <!-- 공통 layout: head.jsp -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitycommon.css' />" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/community/communitywrite.css' />" />
    
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/communitycommon.js' />"></script>
    <script src="<c:url value='/js/communitywrite.js' />"></script>
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
                        <h1>글쓰기</h1>
                    </div>

                    <!-- 글쓰기 폼 -->
                    <form action="/community/board/${board.boardId}/savePost" method="post" >
                        <div class="write-form">
                            <!-- 제목 -->
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" required />

                            <!-- 게시판 선택 (프로필에서 글쓰기 클릭 시 보여짐) -->
                            <c:if test="${empty boardId}">
                                <label for="board">게시판 선택</label>
                                <select id="board" name="board">
                                    <option value="1">임신출산</option>
                                    <option value="2">육아정보</option>
                                    <option value="3">후기정보</option>
                                    <option value="4">중고마켓</option>
                                    <option value="5">구인구직</option>
                                </select>
                            </c:if>

                            <!-- 내용 -->
                            <label for="content">내용</label>
                            <textarea id="content" name="content" rows="10" required></textarea>

                            <!-- 이미지, 동영상 업로드 -->
                            <label for="image">이미지 업로드</label>
                            <input type="file" id="image" name="image" accept="image/*" />
                            
                            <label for="video">동영상 업로드</label>
                            <input type="file" id="video" name="video" accept="video/*" />

                            <!-- 옵션 (공지사항, 스크랩 허용 등) -->
                            <label>
                                <input type="checkbox" name="isNotice" /> 공지로 설정
                            </label>
                            <label>
                                <input type="checkbox" name="allowScrap" /> 스크랩 허용
                            </label>

                            <!-- 등록 및 취소 버튼 -->
                            <div class="form-actions">
                                <button type="submit" class="submit-btn">등록</button>
                                <button type="button" class="cancel-btn" onclick="history.back();">취소</button>
                            </div>
                        </div>
                    </form>
                </main>

                <div id="to_top_Btn">Top</div>
            </div>
        </div>

        <!-- 공통 layout: botton.jsp -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />

    </div>
</body>
</html>
