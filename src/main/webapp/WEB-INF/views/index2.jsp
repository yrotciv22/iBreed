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

 <script>
        function openMyDiary() {
        	console.log("Open MyDiary");
            let requestUrl = "/mydiary"; 
            let popupTitle = "iBreed Diary"; 
            let popupWidth = 1200; 
            let popupHeight = 700; 

            window.open(requestUrl, popupTitle, 
                        "width=" + popupWidth + 
                        ",height=" + popupHeight + 
                        ",top=0px" + ",left=0px");
        }
</script>

</head>

<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top2.jsp" />


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
					<div class="main_banner border">
					<img src="https://media.istockphoto.com/id/1213866189/ko/%EC%82%AC%EC%A7%84/%EB%AA%A8%ED%98%95-3d-%EB%A0%8C%EB%8D%94%EB%A7%81%EC%9D%84-%EC%9C%84%ED%95%9C-%EC%9E%90%EC%8B%9D-%EC%B9%A8%EC%8B%A4-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4.jpg?s=2048x2048&w=is&k=20&c=-G9AR5gJ-UakkR1K4Ajr6rqKdOltvznwnMBvQ3XOtzs="/></div>

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
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							
							</div>
							
							
							<div class="main_board border">
								<div class="board_title">육아 정보</div>
								<!-- 게시판 텍스트 샘플 -->
							<ul class="main_board_ul">
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">중고 마켓</div>
								<!-- 게시판 텍스트 샘플 -->
							<ul class="main_board_ul">
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							</div>
							<div class="main_board border">
								<div class="board_title">동네 정보</div>
								<!-- 게시판 텍스트 샘플 -->
							<ul class="main_board_ul">
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							</div>
						</div>

						<div class="main_row_wrap">
							<div class="main_board border">
								<div class="board_title">구인 구직</div>
								<!-- 게시판 텍스트 샘플 -->
							<ul class="main_board_ul">
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							</div>
							<div class="main_board border">
								<div class="board_title">공지사항</div>
								<!-- 게시판 텍스트 샘플 -->
							<ul class="main_board_ul">
							<li>임신 10주차 </li>
								<li>만삭 사진</li>
								<li>만삭 사진 찍었어요</li>
								<li>만삭 사진 촬영</li>
								<li>만삭 촬영 후기 올려요~</li>
								<li>만삭사진이라니</li>
								<li>드디어 만삭 촬영 했어요.</li>
								
							</ul>
							<div class="see_more">더보기 ></div><!-- 샘플끝 -->
							</div>
						</div>


					</div>
				</div>

				<div class="right_contents">
					<div class="main_login border">
					<div class="loggedin_box1">
					
						<div class="circle"></div>
						<div class="user_wrap">
							<div class="user_nickname"> 맘편한세상 님</div>
							<div class="user_id">mompyunhan</div>
							
								<div class="user_level">레벨 10</div>
								<div class="user_level_bar">
								<div class="level"></div>
								
								</div>
								</div>
					</div>
						<div class="loggedin_box2">
					
					
					<div class="main_diary_btn" onclick="openMyDiary()">마이다이어리</div>
					
						<div class="circle_btn"><span>쪽지</span></div>
							<div class="circle_btn"><span>설정</span></div>
							<div class="circle_btn"><span>로그아웃</span></div>
						</div>
					<div></div>
						<!-- <span>맘편한세상 님</span>
						<button class="main_login_btn">
							<span>iBREED</span> 다이어리
						</button>
						
						<div class="member_btns">
							<div class="find_id">쪽지</div>
							|
							<div class="find_pw">로그아웃</div>
						</div> -->
					</div>

					<div class="main_market border">
					<span>아이브리드 마켓</span> 
				
				<img src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
<!-- 					<img src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
 -->					
					</div>
					
					
					<div class="main_event border">
					<span>	Event 1</span>
				
					<img class="event1_img" src="https://plus.unsplash.com/premium_photo-1664453890782-2807855161fa?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
					</div>
					
					<div class="main_event border">
						<span>Event 2</span>
<!-- 						<img class="event2_img" src="https://images.unsplash.com/photo-1559659133-8781d8f3b673?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
 -->					
 <img class="event2_img" src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
					
					</div>

				</div>

				<div id="to_top_Btn">Top</div>
			</div>


		</div>
		<!-- 메인 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>