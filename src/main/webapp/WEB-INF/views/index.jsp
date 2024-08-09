<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed</title>


<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index.css'/>" />
<script src="<c:url value='/js/index.js'/>"></script>

</head>

<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />




		<!-- 메인 -->
		<!-- 0809 am push -->
		<div class="main">


			<div class="search_bar_wrap">
				<div>
					<input />
				</div>
				<button class="search_btn">통합검색</button>
			</div>

			<div class="contents_wrap">
				<div class="left_contents">
					<div class="main_banner border">
						<img
							src="https://media.istockphoto.com/id/1213866189/ko/%EC%82%AC%EC%A7%84/%EB%AA%A8%ED%98%95-3d-%EB%A0%8C%EB%8D%94%EB%A7%81%EC%9D%84-%EC%9C%84%ED%95%9C-%EC%9E%90%EC%8B%9D-%EC%B9%A8%EC%8B%A4-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4.jpg?s=2048x2048&w=is&k=20&c=-G9AR5gJ-UakkR1K4Ajr6rqKdOltvznwnMBvQ3XOtzs=" />
					</div>

					<div class="main_short_cut_wrap">
						<div class="main_row_wrap">
							<div class="main_best border">
								<div class="board_title">이달의 베스트 다이어리</div>
							</div>
							<div class="main_best border">
								<div class="board_title">인기 게시글</div>
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">임신 / 출산 정보</div>

								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<li>임신 10주차</li>
									<li>만삭 사진</li>
									<li>만삭 사진 찍었어요</li>
									<li>만삭 사진 촬영</li>
									<li>만삭 촬영 후기 올려요~</li>
									<li>만삭사진이라니</li>
									<li>드디어 만삭 촬영 했어요.</li>

								</ul>
								<div class="see_more">더보기 ></div>
								<!-- 샘플끝 -->

							</div>


							<div class="main_board border">
								<div class="board_title">육아 정보</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<li>임신 10주차</li>
									<li>만삭 사진</li>
									<li>만삭 사진 찍었어요</li>
									<li>만삭 사진 촬영</li>
									<li>만삭 촬영 후기 올려요~</li>
									<li>만삭사진이라니</li>
									<li>드디어 만삭 촬영 했어요.</li>

								</ul>
								<div class="see_more">더보기 ></div>
								<!-- 샘플끝 -->
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">중고 마켓</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<li>임신 10주차</li>
									<li>만삭 사진</li>
									<li>만삭 사진 찍었어요</li>
									<li>만삭 사진 촬영</li>
									<li>만삭 촬영 후기 올려요~</li>
									<li>만삭사진이라니</li>
									<li>드디어 만삭 촬영 했어요.</li>

								</ul>
								<div class="see_more">더보기 ></div>
								<!-- 샘플끝 -->
							</div>
							<div class="main_board border">
								<div class="board_title">구인 구직</div>
								<!-- 게시판 텍스트 샘플 -->
								<ul class="main_board_ul">
									<li>임신 10주차</li>
									<li>만삭 사진</li>
									<li>만삭 사진 찍었어요</li>
									<li>만삭 사진 촬영</li>
									<li>만삭 촬영 후기 올려요~</li>
									<li>만삭사진이라니</li>
									<li>드디어 만삭 촬영 했어요.</li>

								</ul>
								<div class="see_more">더보기 ></div>
								<!-- 샘플끝 -->
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board map border">
								<div class="board_title">동네정보</div>
								<div>지도</div>
								<div class="main_board_map"></div>
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
							</div>
						</div>


					</div>
				</div>

				<div class="right_contents">
					<div class="main_login border">
						<span>아이브리드만의 다이어리를 이용해보세요.</span> <a
							href="<c:url value='/loggedin'/>">
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
					</div>

					<div class="main_market border">
						<span>아이브리드 마켓</span> <img
							src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />
						<!-- 					<img src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
 -->
					</div>


					<div class="main_event border">
						<span> Event 1</span> <img class="event1_img"
							src="https://plus.unsplash.com/premium_photo-1664453890782-2807855161fa?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />
					</div>

					<div class="main_event border">
						<span>Event 2</span>
						<!-- 						<img class="event2_img" src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
 -->
						<img class="event2_img"
							src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" />

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