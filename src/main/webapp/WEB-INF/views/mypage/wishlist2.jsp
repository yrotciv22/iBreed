<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/wishlist.css'/>" />
<script src="<c:url value='/js/wishlist.js'/>" defer></script>

</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->
		<div class="title">My Page</div>

		<div class="top_wrap">
			<div class="user_id">
				<span>맘편한세상</span> 님
			</div>
			<div class="top_box_wrap">
				<div class="top_box">회원 등급</div>
				<div class="top_box">
					총 작성한 <br />다이어리
				</div>
				<div class="top_box">
					다이어리<br /> 꾸준히<br /> 작성한지 <br />3일
				</div>
				<div class="top_box">총 주문 횟수</div>
				<div class="top_box">
					사용가능 <br /> 쿠폰 >
				</div>
				<div class="top_box">마일리지 ></div>
			</div>

		</div>

		<div class="row_wrap">
			<div class="left_sidebar">

				<div class="nav_label">나의 쇼핑 활동</div>
				<a href="<c:url value=''/>"><div class="nav_menu">주문/배송 조회</div></a>
				<a href="<c:url value=''/>"><div class="nav_menu">취소/교환/반품
						내역</div></a> <a href="<c:url value=''/>"><div class="nav_menu">찜리스트</div></a>
				<a href="<c:url value=''/>"><div class="nav_menu">최근 본 상품</div></a>
				<a href="<c:url value=''/>"><div class="nav_menu">리뷰 내역</div></a>

				<div class="nav_label">나의 정보 관리</div>

				<a href="<c:url value=''/>"><div class="nav_menu">회원정보 수정</div></a>
				<a href="<c:url value=''/>"><div class="nav_menu">알림 설정</div></a>

				<div class="nav_label">고객센터</div>
			</div>

			<div class="contents_wrap">
			<!-- 위까지 레이아웃  -->
			
				<div class="sub_title">
					위시리스트&nbsp; <span>(총 <span>10<span>개)</span>
				</div>
				<div class="select_all_wrap">
					<label class="custom-checkbox"> <input type="checkbox" />
						<span class="checkmark"></span>
					</label> &nbsp; <span>전체 선택</span>
					<div id="remove_selected_btn">선택 상품 삭제</div>
				</div>



				<div class="wishlist">

					<!-- 아이템 한개 -->

					<div class="one_item_wrap">
						<!-- 좌 -->
						<div class="row_wrap">
							<label class="custom-checkbox"> <input type="checkbox" />
								<span class="checkmark"></span>
							</label>
							<div class="prd_image">
								<img
									src="<c:url value='https://shop-phinf.pstatic.net/20230407_256/1680857947735kpx1f_JPEG/81993836376833409_913438958.jpg?type=f296_296'/>" />
							</div>

							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>

							</div>
						</div>
						<!-- 우 -->
						<div class="button_wrap">
							<div class="prd_delete_btn">X</div>
							<div id="add_to_cart_btn" class="button">장바구니</div>
							<div id="buy_now_btn" class="button">바로구매</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->

					<!-- 아이템 한개 -->

					<div class="one_item_wrap">
						<!-- 좌 -->
						<div class="row_wrap">
							<label class="custom-checkbox"> <input type="checkbox" />
								<span class="checkmark"></span>
							</label>
							<div class="prd_image">
								<img
									src="<c:url value='https://shop-phinf.pstatic.net/20230407_256/1680857947735kpx1f_JPEG/81993836376833409_913438958.jpg?type=f296_296'/>" />
							</div>

							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>

							</div>
						</div>
						<!-- 우 -->
						<div class="button_wrap">
							<div class="prd_delete_btn">X</div>
							<div id="add_to_cart_btn" class="button">장바구니</div>
							<div id="buy_now_btn" class="button">바로구매</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->

					<!-- 아이템 한개 -->

					<div class="one_item_wrap">
						<!-- 좌 -->
						<div class="row_wrap">
							<label class="custom-checkbox"> <input type="checkbox" />
								<span class="checkmark"></span>
							</label>
							<div class="prd_image">
								<img
									src="<c:url value='https://shop-phinf.pstatic.net/20230407_256/1680857947735kpx1f_JPEG/81993836376833409_913438958.jpg?type=f296_296'/>" />
							</div>

							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>

							</div>
						</div>
						<!-- 우 -->
						<div class="button_wrap">
							<div class="prd_delete_btn">X</div>
							<div id="add_to_cart_btn" class="button">장바구니</div>
							<div id="buy_now_btn" class="button">바로구매</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->


				</div>
				
			</div><!-- 우측 콘텐츠랩 끝 -->
		</div>

		<!-- 본문 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>