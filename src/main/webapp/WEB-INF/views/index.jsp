<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Main</title>


<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index.css'/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/chatbot/chatbot.css'/>" />


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index.css'/>" />
<script src="<c:url value='/js/index.js'/>" defer></script>

<script>
	const userId = "${sessionScope.user_id}";
	function openMessenger() {
		window.open('<c:url value="/messenger"/>', 'Messenger',
				'width=800,height=600');
	}
</script>


<script src="<c:url value='/js/index.js'/>" defer></script>

<%--    챗봇 시스템 추가--%>
<script>
	var saveChatDataUrl = "${pageContext.request.contextPath}/saveChatData";
	var clearChatbotSessionUrl = "${pageContext.request.contextPath}/clearChatbotSession";
	var getChatDataUrl = "${pageContext.request.contextPath}/getChatData"; // 추가된 부분
	var saveSelectedOptionUrl = "${pageContext.request.contextPath}/saveSelectedOption"; // 추가된 부분
	var getUserData = "${pageContext.request.contextPath}/getUserData";
	var saveAiNameUrl = "${pageContext.request.contextPath}/saveAiNameUrl";
	var getAiNameUrl = "${pageContext.request.contextPath}/getAiNameUrl";
</script>

<script src="<c:url value='/js/chatbot/chatbot.js'/>" defer></script>

<%--    챗봇 시스템 추가 끝--%>
</head>

<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 메인 -->
		<div class="main">


			<div class="search_bar_wrap">
				<div>
					<input />
				</div>
				<button class="search_btn">통합검색</button>
			</div>

			<div class="contents_wrap">
				<div class="left_contents">
					<div id="slideShow">
						<div id="main_banner" class="border">
						<a href="#"> <img
								src="https://media.istockphoto.com/id/1213866189/ko/%EC%82%AC%EC%A7%84/%EB%AA%A8%ED%98%95-3d-%EB%A0%8C%EB%8D%94%EB%A7%81%EC%9D%84-%EC%9C%84%ED%95%9C-%EC%9E%90%EC%8B%9D-%EC%B9%A8%EC%8B%A4-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4.jpg?s=2048x2048&w=is&k=20&c=-G9AR5gJ-UakkR1K4Ajr6rqKdOltvznwnMBvQ3XOtzs=" /></a>

						<a href="#"> <img
								src="https://images.unsplash.com/photo-1522836924445-4478bdeb860c?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" /></a>

							<a href="#"> <img
								src="https://images.unsplash.com/photo-1528938102132-4a9276b8e320?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" /></a>
				
						</div>

				 	<div id="circle_btn_wrap">
							<a><img class="circleBtn" src="../image/hollow_circle.png"></a>
							<a><img class="circleBtn" src="../image/hollow_circle.png"></a>
							<a><img class="circleBtn" src="../image/hollow_circle.png"></a>
						</div> >
					</div>

					<div class="main_short_cut_wrap">
						<div class="main_row_wrap">
							<div class="main_best border">
								<div class="board_title">이달의 베스트 다이어리</div>

								<ul class="main_board_ul">
									<c:set var="index" value="0" />
									<c:forEach var="post" items="${recentPosts}">
										<c:if test="${index < 3}">
											<li><a href="#">${post.postTitle}</a></li>
											<c:set var="index" value="${index + 1}" />
										</c:if>
									</c:forEach>
								</ul>

							</div>
							<div class="main_best border">
								<div class="board_title">인기 게시글</div>

								<ul class="main_board_ul">
									<c:set var="index" value="0" />
									<c:forEach var="post" items="${popularPosts}">
										<c:if test="${index < 3}">
											<li><a href="#">${post.postTitle}</a></li>
											<c:set var="index" value="${index + 1}" />
										</c:if>
									</c:forEach>
								</ul>

							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">임신 / 출산 정보</div>

								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<c:forEach var="post" items="${pregnancyPosts}">
										<li><a href="#">${post.postTitle}</a></li>
									</c:forEach>
								</ul>
								<div class="see_more">
									<a href="<c:url value='/communityMain'/>">더보기 ></a>
								</div>


							</div>


							<div class="main_board border">
								<div class="board_title">육아 정보</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<c:forEach var="post" items="${parentingPosts}">
										<li><a href="#">${post.postTitle}</a></li>
									</c:forEach>
								</ul>
								<div class="see_more">
									<a href="<c:url value='/communityMain'/>">더보기 ></a>
								</div>

							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">중고 마켓</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<c:forEach var="post" items="${marketPosts}">
										<li><a href="#">${post.postTitle}</a></li>
									</c:forEach>
								</ul>
								<div class="see_more">
									<a href="<c:url value='/communityMain'/>">더보기 ></a>
								</div>

							</div>
							<div class="main_board border">
								<div class="board_title">구인 구직</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<c:forEach var="post" items="${jobPosts}">
										<li><a href="#">${post.postTitle}</a></li>
									</c:forEach>

								</ul>
								<div class="see_more">
									<a href="<c:url value='/communityMain'/>">더보기 ></a>
								</div>
								<!-- 샘플끝 -->
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board map border">
								<div class="board_title">동네정보</div>

								<div class="main_board_map">
									<img src="<c:url value='/image/main_map.png'/>">
								</div>
							</div>
							<div class="main_board border">
								<div class="board_title">진행중인 이벤트</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<li>이벤트</li>
									<li>이벤트</li>
									<li>이벤트</li>
									<li>이벤트</li>
									<li>이벤트</li>
									<li>이벤트</li>

								</ul>
								<!-- 샘플끝 -->
								<div class="see_more">
									<a href="<c:url value='/communityMain'/>">더보기 ></a>
								</div>
							</div>
						</div>


					</div>
				</div>

				<div class="right_contents">
					<div class="main_login border">

						<!-- 로그인 X -->
						<c:if test="${empty sessionScope.user_id }">
							<span>아이브리드만의 다이어리를 이용해보세요.</span>
							<a href="<c:url value='/login'/>">
								<button class="main_login_btn">
									<span>iBREED</span> 로그인
								</button>
							</a>

							<div class="member_btns">
								<a href="<c:url value='/join/idcheck'/>">
									<div class="find_id">아이디 찾기</div>
								</a> | <a href="<c:url value='/join/nicknamecheck'/>">
									<div class="find_pw">비밀번호 찾기</div>

								</a> | <a href="<c:url value='/join'/>">
									<div class="join">회원가입</div>
								</a>
							</div>
						</c:if>
						<!-- 로그인 X 끝 -->



						<!-- 로그인 성공시 -->

						<c:if test="${not empty sessionScope.user_id }">
							<div class="loggedin_box1">

								<div class="user_profile_img">
									<%-- <img src="<c:url value='/image/profile_woman.png'/>" /> --%>

									<img src="${sessionScope.user_profile_image}" />
									<!-- /image/profile_woman.png -->

								</div>
								<div class="user_wrap">
									<div class="user_nickname">${sessionScope.user_nickname}
										님</div>
									<div class="user_id">${sessionScope.user_id}</div>

									<div class="user_level">레벨 ${sessionScope.user_rate}</div>
									<div class="user_level_bar">
										<div class="level"
											style="width: ${sessionScope.user_rate * 10}%;"></div>
									</div>
								</div>
							</div>
							<div class="loggedin_box2">

								<div class="main_diary_btn">마이다이어리</div>


								<a href="javascript:void(0);" onclick="openMessenger();">
									<div class="circle_btn">
										<img src="<c:url value='/image/letter.png'/>" /> <span>쪽지</span>
									</div>
								</a> <a href="<c:url value=''/>">
									<div class="circle_btn">
										<img src="<c:url value='/image/settings.png'/>" /> <span>설정</span>
									</div>
								</a> <a href="<c:url value='/logout'/>">
									<div class="circle_btn">
										<img src="<c:url value='/image/logout.png'/>" /> <span>로그아웃</span>
									</div>
								</a>

							</div>
							<div></div>
						</c:if>
						<!-- 로그인 성공시 끝 -->



					</div>

					<a href="<c:url value='/shop'/>"><div
							class="main_market border">
							<span>아이브리드 마켓</span> <img
								src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />
							<!-- 					<img src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
-->
						</div></a> <a href="<c:url value='/#'/>"><div class="main_event border">
							<span> Event 1</span> <img class="event1_img"
								src="https://plus.unsplash.com/premium_photo-1664453890782-2807855161fa?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />
						</div></a> <a href="<c:url value='/#'/>"><div class="main_event border">
							<span>Event 2</span>
							<!-- 						<img class="event2_img" src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
-->
							<img class="event2_img"
								src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />

						</div> </a>

				</div>


				<!-- 챗봇 영역 -->
				<div id="chatbot_container">
					<div id="chat_window">
						<div id="chat_header">
							<span>챗봇</span>
							<button id="close_chatbot">X</button>
						</div>
						<div id="chat_content"></div>
						<div id="option_buttons">
							<button id="option1">진료과목 상담</button>
							<button id="option2">AI 친구</button>
							<button id="option3">AI 상담사</button>
						</div>
						<button id="end_chat" style="display: none;">대화 종료</button>
						<input type="text" id="chat_input" placeholder="메시지를 입력하세요..."
							style="display: none;" />
					</div>
				</div>

				<div id="chatbot_btn">챗봇</div>
				<div id="to_top_Btn">Top</div>
			</div>


		</div>
		<!-- 메인 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>