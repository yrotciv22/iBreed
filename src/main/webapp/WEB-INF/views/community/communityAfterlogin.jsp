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
                   <!-- 로그인 후 프로필 정보 -->
                        <div class="profile-container">
                            <div class="profile-info">
                                <div class="profile-header">
                                    <img src="<c:url value='/static/images/profile.png' />" alt="프로필" class="profile-img">
                                    <div>
                                        <p>닉네임:${user.nickname}</p>
                                        <p>가입일: ${user.joinDate}</p>
                                    </div>
                                </div>
                                <div class="profile-body">
                                    <p>레벨/등급: ${user.level}LV</p>
                                    <p>(뭐 더 적을거 있음적고)</p>
                                </div>
                                <hr>
                                <div class="profile-links">
                                    <p><a href="#">내가 쓴 게시글</a></p>
                                    <p><a href="#">내가 쓴 댓글</a></p>
                                    <p><a href="#">좋아요한 게시글</a></p>
                                </div>
                                <hr>
                                <button class="community-write-btn">커뮤니티 글쓰기</button>
                            </div>
                        </div>
                      
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
                    <section class="section latest-news">
                        <h2>최신글</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요111111111111111111111111111111               </a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        
                        </div>
                    </section>
                    <section class="section popular-posts">
                        <h2>인기글</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>임신/출산</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>육아정보</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>후기정보</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        </div>
                    </section>
                    <section class=" section category-section">
                        <h2>중고마켓</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                        	</ul>
                        </div>
                    </section>
                    <section class="section category-section">
                        <h2>구인구직</h2>
                        <div class="content-box">
                        	<ul class="latest-news-list">
                        		<li><a href="#게시글">임신10주차인데,너무건조해요</a></li>
                        		<li><a href="#게시글">산후조리원</a></li>
                        		<li><a href="#게시글">임신일까요?테스트기 봐주세요!</a></li>
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
                       			<li><a href="#게시글">제품 추천 부탁드려요~</a></li>
                       			<li><a href="#게시글">애들 바로 재우는 꿀팁</a></li> 	
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
