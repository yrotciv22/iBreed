<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage recent</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mypage_recentPrdList.js'/>"></script>
<script>const userId = "${sessionScope.user_id}"</script>
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

			<div class="sub_title">
				최근 본 상품&nbsp; <span>(총 <span>10<span>개)</span>
			</div>

			<div class="wishlist">
				<c:forEach var="l" items="${recentProducts}">
					<div class="one_item_wrap">
						<div class="row_wrap">
							<label class="custom-checkbox"> <input class="chk"
								type="checkbox" /> <span class="checkmark"></span>
							</label>
							<div class="prd_image"
								OnClick="location.href ='/shop_detail/${l.product_id}'">
								<img src="<c:url value='${l.product_img}'/>" />
							</div>

							<div class="column_wrap" style="width: 560px">
								<div class="prd_name">${l.product_name}</div>
								<div class="one_prd_price">
									<span> <fmt:formatNumber
											value="${Math.floor((l.product_price-((l.product_discount/100)*l.product_price))/100)*100}"
											type="number" pattern="##,#00" />
									</span><span>원</span>
								</div>
							</div>
						</div>
						<div class="button_wrap">
							<div class="prd_delete_btn">X</div>
							<div id="add_to_cart_btn" class="button">장바구니</div>
							<div id="buy_now_btn" class="button">바로구매</div>
						</div>
					</div>
				</c:forEach>

			</div>


		</div>
	</div>

	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>