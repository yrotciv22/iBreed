<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBreed 쇼핑몰</title>
<script src="../jquery-3.7.1.min.js"></script>
<link rel="stylesheet"   type="text/css"  href="../css/shop_main.css">
<script src="../js/slideShow.js"></script>
</head>
<body>
	<header></header>
	<nav></nav>
	<section>
		<div id="wrap">
			<div id="category"> <!-- 왼쪽 카테고리 박스 -->
				<div id="home">
					<img src="">
				</div>
				<div id="categoryList">
					<ul>
						<li><a href='#'>베스트</a></li>
						<li><a href="#">i다이어리</a></li>
						<li><a href="#">전체상품</a></li>
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
					<div>
						<img id="arrow-R" src="../image/arrow-R.png">
						<img id="arrow-L" src="../image/arrow-L.png">
					</div>
					<div id="slideCtrl">
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
						<a><img class="ctrlBtn" src="../image/hollow_circle.png"></a>
					</div>
				</div>
				<div id="popularItem">
					<div class=""><strong class="bigMenu">실시간 인기 TOP 3️⃣️</strong></div>
					<div>
						<ul id="ratingCtrl">
							<li><a href="#">실시간</a></li>
							<li>|</li>
							<li><a href="#">일간</a></li>
							<li>|</li>
							<li><a href="#">주간</a></li>
							<li>|</li>
							<li><a href="#">월간</a></li>
						</ul>
						<a id="allView" href="#">☞ 전체보기</a>
					</div>
					<div class="menuBox">
						<div class="bestIcon">
							<img class="starIcon" src="../image/star.png">
							<strong class="bestRating">1</strong>
						</div>
						<div class="thumbnail">
							<img alt="" src="">
						</div>
						<strong class="menuTitle">인기 상품</strong><br>
						<strong class="price">10,000원</strong>
						<span>20,000원</span>
						<strong class="discount">50%</strong>
						<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
					</div>
					<div class="menuBox">
						<div class="bestIcon">
							<img class="starIcon" src="../image/star.png">
							<strong class="bestRating">2</strong>
						</div>
						<div class="thumbnail">
							<img alt="" src="">
						</div>
						<strong class="menuTitle">인기 상품</strong><br>
						<strong class="price">10,000원</strong>
						<span>20,000원</span>
						<strong class="discount">50%</strong>
						<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
					</div>
					<div class="menuBox">
						<div class="bestIcon">
							<img class="starIcon" src="../image/star.png">
							<strong class="bestRating">3</strong>
						</div>
						<div class="thumbnail">
							<img alt="" src="">
						</div>
						<strong class="menuTitle">인기 상품</strong><br>
						<strong class="price">10,000원</strong>
						<span>20,000원</span>
						<strong class="discount">50%</strong>
						<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
					</div>
					<img id="arrow2-R" src="../image/arrow-R.png">
					<img id="arrow2-L" src="../image/arrow-L.png">
				</div>
				
				<div id="newItem">
					<div><strong class="bigMenu">신상 육아 아이템⭐</strong><br></div>
					<ul>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
					</ul>
				</div>
				
				<div id="bestItem">
					<div><strong class="bigMenu">아이브리드 베스트⭐</strong></div>
					<ul>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
						<li><div class="menuBox">
							<div class="thumbnail">
								<img alt="" src="">
							</div>
							<strong class="menuTitle">상품 제목</strong><br>
							<strong class="price">10,000원</strong>
							<span>20,000원</span>
							<strong class="discount">50%</strong>
							<p>상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.상품에 대한 설명을 적어주는 칸입니다.</p>
						</div></li>
					</ul>
				</div>
			</div> <!-- 오른쪽 콘텐트 박스 끝 -->
		</div> <!-- wrap 끝 -->
	</section>
	<footer></footer>
</body>
</html>