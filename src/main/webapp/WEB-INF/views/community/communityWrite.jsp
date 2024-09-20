<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="userId" value="${sessionScope.user_id}" />  
<%-- <c:set var="boardId" value="${board.boardId}" /> --%>

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
                                    <img src="${sessionScope.user_profile_image}" />
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
                        <h2>커뮤니티 글쓰기</h2>
                    </div>
                    <hr>

                    <!-- 글쓰기 폼 -->
                    <form id="community-post-form" action="/community/board/save" method="post" enctype="multipart/form-data">
                        <div class="write-form">
                            <!-- 제목 -->
                            <label for="title">제목</label>
                            <input type="text" id="title" name="postTitle" required />
                    
                            <!-- 게시판 선택 -->
                            <c:choose>
                                <c:when test="${empty boardId}">
                                    <label for="board">게시판 선택</label>
                                    <select id="board" name="boardId" required onchange="updateHeadings()">
                                        <option value="" disabled selected>게시판을 선택하세요</option>
                                        <option value="1">임신출산</option>
                                        <option value="2">육아정보</option>
                                        <option value="3">후기정보</option>
                                        <option value="4">중고마켓</option>
                                        <option value="5">구인구직</option>
                                    </select>
                                </c:when>
                                <c:otherwise>
                                    <label for="board">게시판</label>
                                    <select id="board" name="boardId" disabled>
                                        <c:choose>
                                            <c:when test="${boardId == 1}"><option value="1" selected>임신출산</option></c:when>
                                            <c:when test="${boardId == 2}"><option value="2" selected>육아정보</option></c:when>
                                            <c:when test="${boardId == 3}"><option value="3" selected>후기정보</option></c:when>
                                            <c:when test="${boardId == 4}"><option value="4" selected>중고마켓</option></c:when>
                                            <c:when test="${boardId == 5}"><option value="5" selected>구인구직</option></c:when>
                                        </c:choose>
                                    </select>
                                    <input type="hidden" name="boardId" value="${boardId}" />
                                </c:otherwise>
                            </c:choose>
                    
                            <!-- 말머리 선택 -->
                            <label for="heading">말머리 선택</label>
                            <select id="heading" name="postHeading" required>
                                <option value="" disabled selected>게시판을 먼저 선택하세요</option>
                                <c:choose>
                                    <c:when test="${boardId == 1}">
                                        <option value="임신">임신</option>
                                        <option value="출산">출산</option>
                                        <option value="산후관리">산후관리</option>
                                    </c:when>
                                    <c:when test="${boardId == 2}">
                                        <option value="육아팁">육아팁</option>
                                        <option value="건강">건강</option>
                                        <option value="놀이">놀이</option>
                                    </c:when>
                                    <c:when test="${boardId == 3}">
                                        <option value="제품후기">제품후기</option>
                                        <option value="병원후기">병원후기</option>
                                        <option value="서비스후기">서비스후기</option>
                                    </c:when>
                                    <c:when test="${boardId == 4}">
                                        <option value="판매">판매</option>
                                        <option value="구매">구매</option>
                                        <option value="교환">교환</option>
                                    </c:when>
                                    <c:when test="${boardId == 5}">
                                        <option value="구인">구인</option>
                                        <option value="구직">구직</option>
                                        <option value="알바">알바</option>
                                    </c:when>
                                </c:choose>
                            </select>
                                <!-- 이미지, 동영상 링크 업로드 -->
		                     <div class="file-upload-buttons">
			                    <button type="button" id="image-upload-btn">사진</button>
			                    <button type="button" id="video-upload-btn">동영상</button>
			                    <button type="button" id="link-upload-btn">링크</button>
			                </div>
			
			                <!-- 숨겨진 파일 업로드 input 요소들 -->
			                <input type="file" id="image-upload" name="image-upload" class="file-input" style="display: none;">
			                <input type="file" id="video-upload" name="video-upload" class="file-input" style="display: none;">
			
			                <!-- 링크 팝업 -->
			                <div id="link-popup" class="popup">
			                    <div class="popup-content">
			                        <span class="close-btn">&times;</span>
			                        <label for="link-input">링크를 입력하세요:</label>
			                        <input type="text" id="link-input" placeholder="URL을 입력하세요">
			                        <button type="button" id="confirm-link">확인</button>
			                    </div>
			                </div>
                    
                            <!-- 내용 -->
                            <label for="content">내용</label>
							<div id="content-area" class="content-area" contenteditable="true"></div>
							<textarea id="hidden-content" name="postContent" style="display:none;"></textarea>
							                    
                        

                       
                           <!--  <!-- 옵션 (공지사항, 스크랩 허용 등) -->
                       <!--       <label>
                                <input type="checkbox" name="isNotice" /> 공지로 설정
                            </label>
                            <label>
                                <input type="checkbox" name="allowScrap" /> 스크랩 허용
                            </label> -->
                    
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
