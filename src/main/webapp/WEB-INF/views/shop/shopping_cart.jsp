<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Shopping Cart</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/shop/shopping_cart.css'/>" />
<script src="<c:url value='/js/shopping_cart.js'/>" defer></script>
</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->
		<div class="shopping_title">
			<span> 01 SHOPPING BAG </span> 
			<span> > </span>
			<span> 02 ORDER </span> 
			<span> > </span>
			<span> 03 ORDER CONFIRMED </span>
		</div>
		<div class="row_wrap">

			<div class="left_box">
				<div class="button_wrap">
					<div class="select_all">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label> &nbsp; <span>전체 선택</span>
					</div>
					<div class="remove_btn_wrap">
						<div id="remove_selected_btn">선택 상품 삭제</div>
						<div id="remove_soldout_btn">품절 상품 삭제</div>
					</div>
				</div>


				<div class="cart_list">

					<!-- 아이템 한개 1 --> 
					<div class="one_item_wrap">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label>
						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20230407_256/1680857947735kpx1f_JPEG/81993836376833409_913438958.jpg?type=f296_296'/>" />
						</div>
						<div style="height:100%;">
							<div class="column_wrap"  style="width:530px;">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>
								<div class="prd_count_btn_box">
									<div class="minus_btn">-</div>
									<div class="total_count">10</div>
									<div class="plus_btn">+</div>
									<div>변경</div>
								</div>
							</div>
						</div>
						<div class="column_wrap" style="align-items: flex-end">
							<div class="prd_delete_btn">X</div>
							<div class="all_prd_price">
								<span>20,000</span><span>원</span>
							</div>
							<div>
								<div class="buy_now_btn">바로구매</div>

							</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->

				
				<!-- 아이템 한개 2 --> 
					<div class="one_item_wrap">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label>
						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20231127_19/1701065544326boLC2_JPEG/5464822140429117_1991374843.jpg?type=f296_296'/>" />
						</div>
						<div style="height:100%;">
							<div class="column_wrap"  style="width:530px;">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>
								<div class="prd_count_btn_box">
									<div class="minus_btn">-</div>
									<div class="total_count">10</div>
									<div class="plus_btn">+</div>
									<div>변경</div>
								</div>
							</div>
						</div>
						<div class="column_wrap" style="align-items: flex-end">
							<div class="prd_delete_btn">X</div>
							<div class="all_prd_price">
								<span>20,000</span><span>원</span>
							</div>
							<div>
								<div class="buy_now_btn">바로구매</div>

							</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->
					
					<!-- 아이템 한개 3 --> 
					<div class="one_item_wrap">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label>
						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20230517_289/1684295649753oyO3N_JPEG/1967134170283075_573486240.jpg?type=f296_296'/>" />
						</div>
						<div style="height:100%;">
							<div class="column_wrap"  style="width:530px;">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>
								<div class="prd_count_btn_box">
									<div class="minus_btn">-</div>
									<div class="total_count">10</div>
									<div class="plus_btn">+</div>
									<div>변경</div>
								</div>
							</div>
						</div>
						<div class="column_wrap" style="align-items: flex-end">
							<div class="prd_delete_btn">X</div>
							<div class="all_prd_price">
								<span>20,000</span><span>원</span>
							</div>
							<div>
								<div class="buy_now_btn">바로구매</div>

							</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->

						<!-- 아이템 한개 4 --> 
					<div class="one_item_wrap">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label>
						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20230915_282/1694763927446sNXFk_JPEG/444711629155010_1834854939.jpg?type=f296_296'/>" />
						</div>
						<div style="height:100%;">
							<div class="column_wrap"  style="width:530px;">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>
								<div class="prd_count_btn_box">
									<div class="minus_btn">-</div>
									<div class="total_count">10</div>
									<div class="plus_btn">+</div>
									<div>변경</div>
								</div>
							</div>
						</div>
						<div class="column_wrap" style="align-items: flex-end">
							<div class="prd_delete_btn">X</div>
							<div class="all_prd_price">
								<span>20,000</span><span>원</span>
							</div>
							<div>
								<div class="buy_now_btn">바로구매</div>

							</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->


						<!-- 아이템 한개 5 --> 
					<div class="one_item_wrap">
						<label class="custom-checkbox"> <input type="checkbox" />
							<span class="checkmark"></span>
						</label>
						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20230407_256/1680857947735kpx1f_JPEG/81993836376833409_913438958.jpg?type=f296_296'/>" />
						</div>
						<div style="height:100%;">
							<div class="column_wrap"  style="width:530px;">
								<div class="prd_name">상품명</div>
								<div class="one_prd_price">
									<span>10,000</span><span>원</span>
									<div class="prd_option">옵션 : [색상]그레이</div>
								</div>
								<div class="prd_count_btn_box">
									<div class="minus_btn">-</div>
									<div class="total_count">10</div>
									<div class="plus_btn">+</div>
									<div>변경</div>
								</div>
							</div>
						</div>
						<div class="column_wrap" style="align-items: flex-end">
							<div class="prd_delete_btn">X</div>
							<div class="all_prd_price">
								<span>20,000</span><span>원</span>
							</div>
							<div>
								<div class="buy_now_btn">바로구매</div>

							</div>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->

					


				</div>
			</div>

			<div class="right_box">
				<div class="payment_box">

					<div class="payment_box_title">주문금액</div>
					<div class="total_prd_amount">
						<div>총 상품금액</div>
						<div>
							<span>10,000</span><span>원</span>
						</div>
					</div>
					<div class="total_shipping_fee">
						<div>총 배송비</div>
						<div>
							<span>0</span><span>원</span>
						</div>
					</div>
					<div class="final_payment_amount">
						<div>최종 결제 금액</div>
						<div>
							<span>10,000</span><span>원</span>
						</div>
					</div>

				</div>
				<a href="<c:url value='/shop/order'/>"><div id="order_all_btn">전체 상품 주문하기</div></a>
				<a href="<c:url value='/shop/order'/>"><div id="order_selected_btn">선택 상품 주문하기</div></a>
			</div>
		</div>



		<div class="shopping_guide">
			<div class="shopping_guide_title">이용 안내</div>
			<div class="shopping_guide_text">
				<div>장바구니</div>

				<ul>
					<li>30,000원 이상 구매 시 무료 배송입니다.</li>
					<li>일부 도서산간 지역은 추가 배송비가 부과됩니다.</li>
					<li>최종 결제 금액은 주문서 내 고객님의 쿠폰/할인 적용에 따라 달라집니다.</li>
					<li>선택하신 상품의 옵션을 변경하시려면 [옵션 변경] 버튼을 누르시면 됩니다.</li>
					<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
				</ul>
			</div>
		</div>


	</div>
	<!-- 본문 끝 -->


	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>
