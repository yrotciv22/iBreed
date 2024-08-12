<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBreed 쇼핑몰</title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shop/shop_main.css' />" />
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
				<div id="slideShow">
					<div id="slidePanel">
						<a href="#"><img src="https://shop-phinf.pstatic.net/20240628_116/1719557405922c9A0U_JPEG/%BD%BA%B8%B6%C6%AE%BD%BA%C5%E4%BE%EE_%C4%AB%C5%D7%B0%ED%B8%AE%B9%E8%B3%CA_%C1%DF%BF%E4%B8%DE%C0%CE_%BD%B4%C6%DB%BD%BD%B8%B2.jpg?type=m1280" class="slideImage"></a>
						<a href="#"><img src="https://shop-phinf.pstatic.net/20240423_137/1713835385166khqLf_JPEG/%BD%BA%B8%B6%C6%AE%BD%BA%C5%E4%BE%EE_%C4%AB%C5%D7%B0%ED%B8%AE%B9%E8%B3%CA_%BF%C0%B8%AE%C1%F6%B3%CE%C5%D7%C0%CC%C7%C1.jpg?type=m1280" class="slideImage"></a>
						<a href="#"><img src="https://shop-phinf.pstatic.net/20240523_28/1716428431361mCzJC_JPEG/%BD%BA%B8%B6%C6%AE%BD%BA%C5%E4%BE%EE_%C4%AB%C5%D7%B0%ED%B8%AE%B9%E8%B3%CA_%BD%BD%B8%B2%C5%D7%C0%CC%C7%C1.jpg?type=m1280" class="slideImage"></a>
						<a href="#"><img src="https://shop-phinf.pstatic.net/20240523_229/1716428472811DUkzk_JPEG/%BD%BA%B8%B6%C6%AE%BD%BA%C5%E4%BE%EE_%C4%AB%C5%D7%B0%ED%B8%AE%B9%E8%B3%CA_%C3%BC%C7%E8%C6%D1_W.jpg?type=m1280" class="slideImage"></a>
					</div>
					<div>
						<img id="arrow-R" src="../image/arrow-R.png">
						<img id="arrow-L" src="../image/arrow-L.png">
					</div>
					<div id="slideCtrl">
						<a><img class="ctrlBtn" src="../image/circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
					</div>
				</div>
				<div id="popularItem">
					<div class=""><strong class="bigMenu">실시간 인기 TOP 10⭐</strong></div>
					<div id="popularSlide">
						<c:forEach items="${topTenList}" var="prd" varStatus="status">
							<div class="popularMenuBox" OnClick="location.href ='#'">
								<div class="bestIcon">
									<img class="tagIcon" src="../image/tag.png">
									<strong class="bestRating">${status.count}</strong>
								</div>
								<div class="P_thumbnail">
									<img class="P_thumbnailImg" src="${prd.product_img}">
									<div class="P_likeCartBox">
										<a href="#"><img src="<c:url value='/image/cart_btn.png'/>"></a>
										<a href="#"><img src="<c:url value='/image/like_btn.png'/>"></a>
									</div>
								</div>
								<div class="P_titleBox">
									<strong class="P_menuTitle">${prd.product_name}</strong><br>
								</div>
								<div class="P_prdExplain">
									<strong class="P_price"><fmt:formatNumber value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}"
																			type="number" pattern="##,#00"/>원</strong>
									<span class="P_existingPrice">${prd.product_price}원</span>
									<strong class="P_discount">${prd.product_discount}%</strong>
									<p>${prd.product_coment}</p>
								</div>
							</div>
						</c:forEach>
						
						<div class="allViewBox">
							<div id="allViewBtn"><a href="#">						
								<img id="allView" src="../image/arrow-R.png">
								<span id="allViewText">전체보기</span>
							</a></div>
						</div>
					</div>
				</div>
				<div id="arrowBox">
					<img id="arrow2-R" src="../image/arrow-R.png">
					<img id="arrow2-L" src="../image/arrow-L.png">
				</div>
				<div id="newItem">
					<div><strong class="bigMenu">신상 육아 아이템⭐</strong><br></div>
					<ul>
						<c:forEach items="${newItemList}" var="prd">
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
				
				<div id="bestItem">
					<div><strong class="bigMenu">아이브리드 베스트⭐</strong></div>
					<ul>
						<c:forEach items="${bestItemList}" var="prd" begin="0" end="5">
							<li><div class="menuBox" OnClick="location.href ='#'">
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
				
				<div id="soldOutItem">
					<div><strong class="bigMenu">⏰재고 50개 이하 품절임박!</strong></div>
					<ul>
						<c:forEach items="${soldOutItemList}" var="prd">
							<li><div class="menuBox" OnClick="location.href ='#'">
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