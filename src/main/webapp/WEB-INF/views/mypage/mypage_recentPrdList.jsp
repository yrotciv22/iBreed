<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage 최근본상품</title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/wishlist.css'/>" />
</head>


<body>
	<div class="all">

		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

		<div class="contents_wrap">


			<!-- 아래부터 본문 작성 -->
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


			<!-- 본문작성 끝 -->
		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>