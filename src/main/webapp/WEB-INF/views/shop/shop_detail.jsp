<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBreed 쇼핑몰 상품상세보기</title>
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/shop_detail.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shop/shop_detail.css' />" />
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	
	
	
	<div id="main">
		<div id="category"> <!-- 왼쪽 카테고리 박스 -->
			<div id="home">
				<img src="#">
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
		</div>
	
		<div id="content">
			<div id="topBox">
				<div id="imgBox">
					<img id="thumbmail" src="https://cafe24.poxo.com/ec01/makerad/0jJurf5+JqL2mXn6P+LWO4fLCe4ab/jzY/Qv7UQEyBuzSVAgX/See/cHJ02/coz6OIKUPwwR8Oll3R2K0PC+pA==/_/web/product/big/202010/2d123fe9e5d7ee1dfe27bcad2b81f269.png">
				</div>
				
				<div id="expBox">
					<div id="expMiniBox">
						<h1>(임신캘린더+육아캘린더 2종 세트) 임산부 선물 임밍아웃 임신출산 축하 뱃지</h1>
						<div id="total_review"><a href="#">리뷰 20건</a> | ⭐5.0</div>
						<div id="priceBox">
							<span id="precent">50%</span>
							<span id="price">20,000원</span>
							<p><strong id="discount">10,000원</strong></p>
						</div>
						<div>
							<div id="shipping">배송정보</div>
							<div id="ship_inf">무료배송</div>
						</div>
						<div id="qtyCtr">수량조절박스</div>
						<div id="finalPrice">
							<span>총 상품금액: </span>
							<span>1000000</span>
							<span>원</span>
						</div>
						<div id="btnBox">
							<input type="button" value="장바구니" id="put_cart">
							<input type="button" value="구매하기" id="buying">
							<input type="button" value="찜" id="likes">
						</div>
					</div>
				</div>
			</div>
			
			<div id="midBox">
				상품상세
			</div>
			
			<div id="reviewBox">
				리뷰박스
			</div>
			
			<div id="bottomBox">
				배송정보
			</div>
		</div>
	</div> <!-- main 박스 종료 -->
	
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>