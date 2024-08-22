<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="<c:url value='/js/communitycommon.js' />"></script>
	    <script src="<c:url value='/js/index.js' />"></script>
	    
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
                            <!-- 프사없으면 기본프사적용, 경로재설정필요 -->
                                <!-- 프사 없으면 기본 프사 적용 -->
								<img src="${user.user_profile_image}" /alt="Profile Image" class="profile-img"> 

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
	                        <h1>iBREED 커뮤니티</h1>
	                        <div class="search-bar">
							    <form action="/community/search" method="get">
							        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
							        <button type="submit">통합검색</button>
							    </form>
							</div>
	                    </div>
	                    <!--  여기까진 커뮤니티에 공통으로 포함되어야함.나머지 페이지별 다른건 아래에 작성-->
                    <section class="section category-section">
                        <h1>인기글</h1>
                        <div class="content-box">
                            <ul class="latest-news-list">
                             	 <c:forEach var="post" items="${popularPosts}">
						            <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
						        </c:forEach>
                            </ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>최신글</h2>
                        <div class="content-box">
                            <ul class="latest-news-list">
                         		 <c:forEach var="post" items="${recentPosts}">
					              <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
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
					                <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
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
					                 <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
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
					                <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
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
					                 <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
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
					                 <li class="post-item">
						                <a href="#">${post.postTitle}</a>
						                <span class="post-meta">
						                    <span class="post-author">${post.userId}</span>
						                    <span class="post-separator"> · </span>
						                    <span class="post-date"><fmt:formatDate value="${post.postCreate}" pattern="yyyy-MM-dd"/></span>
						                </span>
						            </li>
					            </c:forEach>
					        </ul>
					    </div>
					</section>
                </main>
                <div id="to_top_Btn">Top</div>
            </div>
        </div>

        <!-- bottom 임포트 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
    </div>
</body>
</html>
