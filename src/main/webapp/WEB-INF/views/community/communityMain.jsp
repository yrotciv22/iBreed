<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>IBREED 커뮤니티</title>
    
    <!--head 임포트  -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css' />" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/communitymain.js' />"></script>
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
                    <c:when test="${not empty user}">
                        <!-- 로그인된 상태 -->
                        <div id="after-login" class="profile-container">
                            <div class="profile-header">
                            <!-- 프사없으면 기본프사적용, 경로재설정필요 -->
                                <img src="${user.profileImage != null ? user.profileImage : '/images/default-profile.png'}" alt="Profile Image" class="profile-img">
                                <div>
                                    <p>닉네임: ${user.username}</p>
                                    <p>가입일: ${user.joinDate}</p>
                                    <p>레벨/등급: ${user.level}</p>
                                    <p>(뭐 더 적을거 있음적고)</p>
                                </div>
                            </div>
                            <div class="profile-links">
                                <p><a href="/user/posts">내가 쓴 게시글</a></p>
                                <p><a href="/user/comments">내가 쓴 댓글</a></p>
                                <p><a href="/user/likes">좋아요한 게시글</a></p>
                            </div>
                            <a href="/community/write" class="community-write-btn">커뮤니티 글쓰기</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인되지 않은 상태 -->
                        <div class="login-container" id="before-login">	
                            <div class="login-button">
                                <a href="<c:url value='/communityAfterlogin'/>" class="login-link" id="login-Btn">IBREED 로그인</a>
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
                    <li><a href="#" class="nav-link">임신출산</a></li>
                    <li><a href="#" class="nav-link">육아정보</a></li>
                    <li><a href="#" class="nav-link">후기정보</a></li>
                    <li><a href="#" class="nav-link">중고마켓</a></li>
                    <li><a href="#" class="nav-link">구인구직</a></li>
                </ul>
                </nav>
                <main class="main-section">
	                <div class="header-content">
	                        <h1>IBREED 커뮤니티</h1>
	                        <div class="search-bar">
	                            <input type="text" placeholder="검색어를 입력하세요">
	                            <button>검색</button>
	                        </div>
	                    </div>
                    <section class="section category-section">
                        <h2>인기글</h2>
                        <div class="content-box">
                            <ul class="latest-news-list">
                             	<c:forEach var="post" items="${popularPosts}">
                             		<li><a href="#">${post.postTitle}</a></li>
                             	</c:forEach>
                            </ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>최신글</h2>
                        <div class="content-box">
                            <ul class="latest-news-list">
                         		 <c:forEach var="post" items="${recentPosts}">
					              <li><a href="#">${post.postTitle}</a></li>
					             </c:forEach>
                            </ul>
                        </div>
                    </section>
                    <!-- 임신 섹션 -->
                     <section class="section category-section">
					    <h2>임신/출산</h2>
					    <div class="content-box">
					        <ul class="latest-news-list">
					            <c:forEach var="post" items="${pregnancyPosts}">
					                <li><a href="#">${post.postTitle}</a></li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
					<!-- 육아 섹션 -->
					<section class="section category-section">
					    <h2>육아정보</h2>
					    <div class="content-box">
					        <ul class="latest-news-list">
					            <c:forEach var="post" items="${parentingPosts}">
					                <li><a href="#">${post.postTitle}</a></li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
                    
                    	<!-- 중고장터 섹션 -->
                    <section class="section category-section">
					    <h2>후기정보</h2>
					    <div class="content-box">
					        <ul class="latest-news-list">
					            <c:forEach var="post" items="${reviewPosts}">
					                <li><a href="#">${post.postTitle}</a></li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
					
					<!-- 중고장터 섹션 -->
					<section class="section category-section">
					    <h2>중고장터</h2>
					    <div class="content-box">
					        <ul class="latest-news-list">
					            <c:forEach var="post" items="${marketPosts}">
					                <li><a href="#">${post.postTitle}</a></li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
					
					<!-- 구인구직 섹션 -->
					<section class="section category-section">
					    <h2>구인구직</h2>
					    <div class="content-box">
					        <ul class="latest-news-list">
					            <c:forEach var="post" items="${jobPosts}">
					                <li><a href="#">${post.postTitle}</a></li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
                </main>
            </div>
        </div>

        <!-- bottom 임포트 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
    </div>
</body>
</html>
