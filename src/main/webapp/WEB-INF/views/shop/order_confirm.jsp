<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Shopping Order</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/shop/order_confirm.css'/>" />
<script src="<c:url value='/js/order_confirm.js'/>" defer></script>
</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->
		<div class="shopping_title">
			<span> 01 SHOPPING BAG </span> <span> > </span> <span>02 ORDER</span>
			<span> > </span>
			<div>03 ORDER CONFIRMED</div>
		</div>

		<div class="confirmation_wrap">
			<div class="confirmation_message">주문이 정상적으로 완료되었습니다.</div>
			<div>
				<div class="confirm_title">주문상품정보</div>
				<div class="order_product content_wrap">
				<!-- 아이템 한개 -->
					<div class="one_item_wrap">

						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20231127_19/1701065544326boLC2_JPEG/5464822140429117_1991374843.jpg?type=f296_296'/>" />
						</div>
						<div>
							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">상품명</div>
								<div>옵션: [색상] Grey</div>

								<div class="one_prd_price">
									<span>10,000</span><span>원</span> /<span>수량 : 1개</<span>>
							
								</div>
								<div class="coupon">
									쿠폰적용가 : <span>9,000</span>원
								</div>
							</div>
						</div>

					</div>
					<!-- 아이템 한개 끝 -->
					<!-- 아이템 한개 -->
					<div class="one_item_wrap">

						<div class="prd_image">
							<img
								src="<c:url value='https://shop-phinf.pstatic.net/20231127_19/1701065544326boLC2_JPEG/5464822140429117_1991374843.jpg?type=f296_296'/>" />
						</div>
						<div>
							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">상품명</div>
								<div>옵션: [색상] Grey</div>

								<div class="one_prd_price">
									<span>10,000</span><span>원</span> /<span>수량 : 1개</<span>>
							
								</div>
								<div class="coupon">
									쿠폰적용가 : <span>9,000</span>원
								</div>
							</div>
						</div>

					</div>
					<!-- 아이템 한개 끝 -->
					</div>
			</div>
		</div>



		<!-- 본문 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>