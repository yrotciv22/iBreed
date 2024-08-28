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
						<div id="shipBox">
							<div id="shipping">배송</div>
							<div id="ship_inf">무료배송<br><span>09/01(수)</span> 이내 도착 예정<br>제주 추가 3,000원</div>
						</div>
						<div id="sellerBox">
							<div class="seller">판매자</div>
							<div class="seller_inf">아이브리드</div>
						</div>
						<div id="quantityBox">
							<div class="prdSelect">상품선택</div>
							<div id="qtyBox">
								<div id="subTitle">
									<p>(임신캘린더+육아캘린더 2종 세트) 임산부 선물 임밍아웃 임신출산 축하 뱃지</p>
								</div>
								<div id="qtyCtr">
									<input type="button" id="minusBtn" class="btn" value="-">
									<div id="qty">1</div>
									<!-- <input type="text" id="qty" value="1"> -->
									<input type="button" id="plusBtn" class="btn" value="+">
								</div>
								<div id="priceBox2">
									<span id="discount2">10,000원</span>
									<span id="price2">20,000원</span>
								</div>
							</div>
						</div>
						<div id="finalPrice">
							<span>총 상품금액: </span>
							<span id="price3">10,000</span>
							<span>원</span>
						</div>
						<div id="btnBox">
							<input type="image" src="/image/no_like.png" id="likes">
							<input type="button" value="장바구니" id="put_cart">
							<input type="button" value="구매하기" id="buying">
						</div>
					</div>
				</div>
			</div>
			
			<nav>
				<ul>
					<li><a><span>상세정보</span></a></li>
					<li><a><span>리뷰</span></a></li>
					<li><a><span>배송정보</span></a></li>
				</ul>
			</nav>
			<div id="midBox">
				<div id="detailImgBox">
					<div id="detailImg">
						<img src="/image/detailImg.JPG">
					</div>
					<div>
						<input type="button" id="openBtn">
						<input type="button" id="foldBtn">
					</div>
				</div>
				
			</div>
			
			<div id="reviewBox">
				<h2>상품 리뷰</h2>
				<div id="reviewImgBox">
					<!-- 이미지는 8개까지 들어감 -->
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
					<a href="#"><img class="reviewImg" src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/081f1e26-bb46-445e-8574-c33ea97ab166.jpeg"></a>
				</div>
				
				<div>
				
				</div>
				
				<div id="reviewComentBox">
					<div class="reviewComent">
						<div class="reviewer">
							<span>김**</span>
						</div>
						<article>
							<div class="rcName">
								<h3>구매한 상품 이름</h3>
							</div>
							<p class="rcComment">***** 촉촉한! 아기 물티슈!!
								첫째 둘째 모두 신생아부터 하기스 물티슈만 사용했는데, 처음 보는 거라, 호기심에 샀어요;; 이제 아이들이 조금 컸는데도 여전히 물티슈를 많이 쓰게 되더라고요,
								식탁 옆에 두고, 간식 먹기 전에 손도 닦고, 학교 준비물로도 가져가고요,  손부터 여기저기 많이 닦다보니, 청정수로 만든 부분이 제일 믿음이 가요,,, 혹시나 입으로 들어갈 지도 모르는데 먹는 물 만큼 관리한다니,,,ㅋ
								
								보라색 패키지도 촌스럽지 않고 예쁜것 같아요, 제품 뒷면에 오픈한 날짜도 쓸 수 있게 해준 센스,,,
								
								참, 하기스 물티슈는 특히,,,(아이가 좀 크다보니 사용 속도는 느린 편이라서) 하나 뜯으면 꽤나 오래 쓰는 편인데 마지막 장까지 촉촉하 물기가 계속 있는게 제일 좋은 것 같아요, 오픈마켓에서 파는 다른 제품 좀 써봤는데, 정말 반은 남았는데 아주 메마른 적이 많았거든요.ㅠ
								
								다 쓰고 다시 구매하려고요, 컬리다운 배송도 깔끔해서 좋앗어요
							</p>
							<div class="rcimage">
								<img src="https://thumbnail6.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4094481484664863063/3aecc922-7f5b-402c-a923-cf20a17e8f92.jpeg">
							</div>
							<div class="rcFooter">
								<div class="rcDate"><span>작성날짜</span></div>
								<button class="rcBtn">
									<span>🖒도움돼요</span>
								</button>
							</div>
						</article>
					</div>
					<div class="reviewComent">
						<div class="reviewer">
							<span>이**</span>
						</div>
						<article>
							<div class="rcName">
								<h3>구매한 상품 이름</h3>
							</div>
							<p>
							우리집 강아지전용으로 사용하고 있어요 톡톡하고 특별한 향이 나지도않고 닦았을때 거품같은것도 안나고 깨끗하고 좋아요
							</p>
							<div class="rcimage">
								<img src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202408/19/4602509952990876816/6296d648-fb0d-4a55-94a7-78508e5a6ab2.jpeg">
							</div>
							<div class="rcFooter">
								<div class="rcDate"><span>작성날짜</span></div>
								<button>
									<span>🖒도움돼요</span>
								</button>
							</div>
						</article>
					</div>
				</div>
			</div>
			
			<div id="bottomBox">
				배송정보
			</div>
		</div>
	</div> <!-- main 박스 종료 -->
	
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>