<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBreed 쇼핑몰 리스트</title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shop/shop_list.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/slideShow.js'/>"></script>
<script src="<c:url value='/js/shop_main.js'/>"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/top.jsp" />

	<!-- 메인 -->
	<section>
		<div id="wrap">
			<div id="category"> <!-- 왼쪽 카테고리 박스 -->
				<div id="home">
					<img src="https://play-lh.googleusercontent.com/yB5gop9KPTmwTHEjm89FDNkEgNWXW_CVVwWTsfA05rT66McI_3jxGfxwhsFaDvfsRqg=w240-h480-rw">
				</div>
				<div id="categoryList">
					<ul>
						<li><a href='#'>베스트</a></li>
						<li><a href="#">전체상품</a></li>
						<li><a href="#">i다이어리</a></li>
						<li><a href="#">i달력</a></li>
						<li><a href="#">의류/잡화/소품</a></li>
						<li><a href="#">임신/출산 선물세트</a></li>
						<li><a href="#">초보엄마아빠템</a></li>
						<li><a href="#">콜라보레이션</a></li>
						<li><a href="#">이벤트</a></li>
					</ul> 
				</div>
			</div> <!-- 왼쪽 카테고리 박스 끝 -->
			
			<div id="content"> <!-- 오른쪽 콘텐트 박스 -->
				
				<div id="ItemList">
					<div id="titleBox">
						<strong class="bigMenu">전체상품</strong>
					</div>
					<div id="orderBar">
						<div id="itemCount">총 몇건</div>
						<div id="orderSelect">
							<a>추천순</a> |
							<a>신상품순</a> |
							<a>낮은 가격순</a> |
							<a>높은 가격순</a> |
							<a>판매량순</a>
						</div>
					</div>
					<ul>
						<c:forEach items="${viewAllPrd}" var="prd">
							<li><div class="menuBox"  OnClick="location.href ='#'">
								<div class="thumbnail">
									<img class="newThumbnail" src="${prd.product_img}">
									<div class="likeCartBox1">
										<a href="www.naver.com"><img src="<c:url value='/image/cart_btn.png'/>"></a>
										<a href="#"><img src="<c:url value='/image/like_btn.png'/>"></a>
									</div>
								</div>
								<div class="titleBox">
									<strong class="menuTitle">${prd.product_name}</strong><br>
								</div>
								<div class="prdExplain">
									<strong class="price"><fmt:formatNumber value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}"
																			type="number" pattern="##,#00"/>원</strong>
									<span class="existingPrice">${prd.product_price}원</span>
									<strong class="discount">${prd.product_discount}%</strong>
									<p>${prd.product_coment}</p>
								</div>
							</div></li>
						</c:forEach>
					</ul>
				</div>
				
			</div> <!-- 오른쪽 콘텐트 박스 끝 -->
		</div> <!-- wrap 끝 -->
	</section>
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>