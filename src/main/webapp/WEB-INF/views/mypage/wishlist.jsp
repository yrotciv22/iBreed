<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage Wishlist</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/myPage_wishList.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/wishlist.css'/>" />
</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<!-- 공통 마이페이지 mypage_layout.jsp -->
		<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

		<div class="contents_wrap">


			<!-- 아래부터 본문 작성 -->
				<div class="sub_title">
					위시리스트&nbsp; <span>(총 <span>10<span>개)</span>
				</div>
				<div class="select_all_wrap" data-product-id="${l.product_id}">
					<label class="custom-checkbox"> <input class="allCheck" type="checkbox" />
						<span class="checkmark"></span>
						&nbsp; <span>전체 선택</span>
					</label> 
					<div id="remove_selected_btn">선택 상품 삭제</div>
				</div>



				<div class="wishlist">

					<c:forEach var="l" items="${likeList}">
						<div class="one_item_wrap">
							<div class="row_wrap">
								<label class="custom-checkbox"> <input class="chk" type="checkbox" />
									<span class="checkmark"></span>
								</label>
								<div class="prd_image" OnClick="location.href ='/shop_detail/${l.product_id}'">
									<img src="<c:url value='${l.product_img}'/>" />
								</div>
	
								<div class="column_wrap" style="width: 560px">
									<div class="prd_name">${l.product_name}</div>
									<div class="one_prd_price">
										<span>
											<fmt:formatNumber value="${Math.floor((l.product_price-((l.product_discount/100)*l.product_price))/100)*100}"
																			type="number" pattern="##,#00"/>
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


			<!-- 본문작성 끝 -->
		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>