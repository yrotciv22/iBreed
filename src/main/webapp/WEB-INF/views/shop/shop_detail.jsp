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
<script src="<c:url value='/js/addCookie.js'/>"></script>
<script>const userId = "${sessionScope.user_id}"</script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shop/shop_detail.css' />" />
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/head.jsp" />
	
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	
	<div id="main">
		<div id="category"> <!-- 왼쪽 카테고리 박스 -->
			<!-- <div id="home">
				<img src="#">
			</div> -->
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
			
			<form id="cartForm" >
				<div id="imgBox">
					<img id="thumbmail" src=${prd.product_img}>
				</div>
				
				<div id="expBox">
					<div id="expMiniBox">
						<h1>${prd.product_name}</h1>
						<div id="total_review"><a id="reviewMove2">리뷰 ${rCount}건</a> | ⭐${rAvg}</div>
						<div id="priceBox">
						
							<c:if test="${prd.product_discount > 1}">
								<span id="precent">${prd.product_discount}</span><span>%</span>
								<div id="price"><span>${prd.product_price}</span><span>원</span></div>
							</c:if>
							
							<p id="discount"><strong><fmt:formatNumber value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}"
																			type="number" pattern="##,#00"/></strong><strong>원</strong></p>
							<input id="prc" type="hidden" type="number" value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}">												
							<input id="recent_prdIds" type="hidden" value="${prd.product_id}" name="product_id">
						</div>
						<div id="shipBox">
							<div id="shipping">배송</div>
							<div id="ship_inf">무료배송<br><span id="ship_date">09/01(수)</span> 이내 도착 예정<br>제주 추가 3,000원</div>
						</div>
						<div id="sellerBox">
							<div class="seller">판매자</div>
							<div class="seller_inf">아이브리드</div>
						</div>
						<div id="quantityBox">
							<div class="prdSelect">상품선택</div>
							<div id="qtyBox">
								<div id="subTitle">
									<p>${prd.product_name}</p>
								</div>
								<div id="qtyCtr">
									<input type="button" id="minusBtn" class="btn" value="-">
									 <div id="qty" name="cart_quantity">1</div> 
									 
									 <!-- 수량을 전송하는 숨겨진 input 태그 -->
									<input type="hidden" id="cart_quantity_input" name="cart_quantity" value="1">
									
									<input type="button" id="plusBtn" class="btn" value="+">
								
								</div>
								<div id="priceBox2">
									<c:if test="${prd.product_discount > 1}">
										<div id="discount2"><span>${prd.product_price}</span><span>원</span></div>
									</c:if>
									<div id="price2"><span><fmt:formatNumber value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}"
																			type="number" pattern="##,#00"/></span><span>원</span></div>
								</div>
							</div>
						</div>
						<div id="finalPrice">
							<span>총 상품금액: </span>
							<span id="price3"><fmt:formatNumber value="${Math.floor((prd.product_price-((prd.product_discount/100)*prd.product_price))/100)*100}"
																			type="number" pattern="##,#00"/></span>
							<span>원</span>
						</div>
						
						
						<div id="btnBox">
							<c:if test="${empty likeResult}"> <!-- 로그인 하지 않았을 경우 -->
								<input type="image" src="/image/no_like.png" id="likes">
							</c:if>
							<c:if test="${likeResult eq 'not_available'}"> 
								<a href="<c:url value='/insertLike/${prd.product_id}'/>">
								<input type="image" src="/image/no_like.png" id="likes"></a>
							</c:if>
							<c:if test="${likeResult eq 'available'}">
								<a href="<c:url value='/deleteLike/${prd.product_id}'/>">
								<input type="image" src="/image/yes_like.png" id="likes"></a>
							</c:if>
							
						
							<input type="button" value="장바구니" id="put_cart" >
						
							<input type="button" value="구매하기" id="buying">
							
						</div> <!-- btnBox 끝 -->
						
						<!-- 장바구니 알림 팝업창 -->
						<div id="confirm_add_cart">
							<div id="cart_close_btn">X</div>
							<div class="popup_text"></div>
							<div id="go_to_cart"><a href="<c:url value='/shop/${sessionScope.user_id}/cart'/>">장바구니 바로가기 ></a></div>
						</div>
	
				
						
						
					</div>
				</div>
				</form>
				
			</div>
			
			<nav>
				<ul>
					<li><a id="detailMove"><span>상세정보</span></a></li>
					<li><a id="reviewMove"><span>리뷰(${rCount})</span></a></li>
					<li><a id="returnMove"><span>반품/교환정보</span></a></li>
				</ul>
			</nav>
			<div id="midBox">
				<div id="detailImgBox">
					<div id="detailImg">
						<img src="/image/detailImg.JPG">
					</div>
					<div>
						<input type="button" id="openBtn" value="상세정보 더보기">
						<input type="button" id="foldBtn" value="상세정보 접기">
					</div>
				</div>
			</div>
			
			<div id="reviewBox">
				<h2>상품 리뷰</h2>
				<div>
					
				</div>
				<div id="reviewImgBox">
					<!-- 이미지는 8개까지 들어감 -->
					<c:forEach items="${reviewList}" var="r" varStatus="status" begin="0" end="9">
					<a href="#"><img class="reviewImg" src="${r.img}"></a>
					</c:forEach>
				</div>
				
				<div id="reviewComentBox">
					<c:choose>
					    <c:when test="${endIndex lt 0}">
					        <c:set var="endIndex" value="0"/>
					    </c:when>
					    <c:otherwise>
					        <c:set var="endIndex" value="${endIndex}"/>
					    </c:otherwise>
					</c:choose>
					<c:forEach items="${reviewList}" var="r" varStatus="status" begin="${startIndex}" end="${endIndex}">
						<div class="reviewComent">
							<div class="reviewer">
								<span>${r.user_name}</span>
							</div>
							<article class="art">
								<div class="rcName">
									<h3>${r.product_name}</h3>
									<p class="reviewRating" data-value="${r.review_rating}">${r.review_rating}</p>
								</div>
								<p class="rcComment">${r.review_coment}
								</p>
								<div class="rcimage">
								<c:if test="${not empty r.img}">
									<img src="${r.img}">
								</c:if>
								</div>
								<div class="rcFooter">
									<div class="rcDate">
										<span>
											<%-- <fmt:formatDate value="${r.review_time}" pattern="yyy-MM-dd"/> --%>
										</span>
									</div>
									<button class="rcBtn">
										<span>🖒도움돼요</span>
									</button>
								</div>
							</article>
						</div>
					</c:forEach>
				</div>
				<div id="pagination" data-current-page="${currentPage}" data-total-pages="${totalPages}" data-product-id="${productId}">
				    <button id="prevPage" ${currentPage == 1 ? 'disabled' : ''}>⬅️</button>
				    <span>Page ${currentPage} of ${totalPages}</span>
				    <button id="nextPage" ${currentPage == totalPages ? 'disabled' : ''}>➡️</button>
				</div>
			</div>
			
			<div id="bottomBox">
				<h2>반품/교환정보</h2>
				<div id="returnBox">
					<table>
						<tr>
							<th colspan="4">
								<strong>아이브리드 반품/교환 안내</strong>
								<p>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
							</th>
						</tr>
						<tr>
							<th>판매자 지정택배사</th>
							<td colspan="3">롯데택배</td>
						</tr>
						<tr>
							<th>반품배송비</th>
							<td>편도 3,000원 (최초 배송비 무료인 경우 5,000원 부과)</td>
							<th>교환배송비</th>
							<td>6,000원</td>
						</tr>
						<tr>
							<th>보내실 곳</th>
							<td colspan="3">경기도 안양시 동안구 엘에스로 142 (호계 금정역 SK V1 center) 401호 (우 : 14118) </td>
						</tr>
						<tr>
							<th rowspan="2">반품/교환 사유에 따른 요청 가능 기간</th>
							<td colspan="3">구매자 단순 변심은 상품 수령 후 7일 이내<span class="gray_font">(구매자 반품배송비 부담)</span></td>
						</tr>
						<tr>
							<td colspan="3">표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내</td>
						</tr>
						<tr>
							<th>반품/교환 불가능 사유</th>
							<td colspan="3">
								<ul>
									<li>
										반품요청기간이 지난 경우
									</li>
									<li>
										구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우<span class="gray_font">(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span>
									</li>
									<li>
										구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우<span class="gray_font">(예: 식품, 화장품, 향수류, 음반 등)</span>
									</li>
									<li>
										구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<span class="gray_font">(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</span>
									</li>
									<li>
										시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우
									</li>
									<li>
										고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우<span class="gray_font">(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가하다는 사실을 서면 동의 받은 경우)</span>
									</li>
									<li>
										복제가 가능한 상품 등의 포장을 훼손한 경우<span class="gray_font">(CD/DVD/GAME/도서의 경우 포장 개봉 시)</span>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
				
				<div id="sellerInfo">
					<strong>판매자정보</strong>
					<div>
						<table>
							<tr>
								<th>상호명</th>
								<td>아이브리드(사업자)</td>
								<th>대표자</th>
								<td>김승우</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- main 박스 종료 -->
	
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>