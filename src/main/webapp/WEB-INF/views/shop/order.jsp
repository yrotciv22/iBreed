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
	href="<c:url value='/css/shop/order.css'/>" />
<script src="<c:url value='/js/order.js'/>" defer></script>
</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />


		<!-- 본문 -->
		<div class="shopping_title">
			<span> 01 SHOPPING BAG </span> <span> > </span>
			<div>02 ORDER</div>
			<span> > </span> <span> 03 ORDER CONFIRMED </span>
		</div>


		<form class="order_form_wrap">

			<div class="left_box">
				<div class="order_info content_wrap">
					<div class="form_title">배송지</div>
					<div class="input_wrap">

						<label> <input type="radio" name="address"
							value="existing_address" required>기존 배송지
						</label> <label> <input type="radio" name="address"
							value="new_address"> 새로운 배송지
						</label>
					</div>
					<div class="input_wrap">
						<label class="input_label" for="name">주문자 <span>*</span>
						</label> <input type="text" id="name" name="name" class="custom-input"
							required />
					</div>
					<div class="input_wrap">
						<label class="input_label" for="email">이메일 <span>*</span></label>
						<input type="text" id="email_username" name="email_username"
							class="custom-input" required /> &nbsp;@&nbsp;<input type="text"
							id="email_domain" name="email_domain" class="custom-input"
							required />
					</div>
					<div class="input_wrap">
						<label class="input_label" for="phone">연락처 1 <span>*</span></label>
						<input type="tel" id="phone1" name="phone1" class="custom-input"
							required maxlength="3" size="3" /> &nbsp;-&nbsp; <input
							type="tel" id="phone2" name="phone2" class="custom-input"
							required maxlength="4" size="4" /> &nbsp;-&nbsp; <input
							type="tel" id="phone3" name="phone3" class="custom-input"
							required maxlength="4" size="4" />
					</div>
					<div class="input_wrap">
						<label class="input_label" for="tel">연락처 2</label> <input
							type="tel" id="tel1" name="tel1" class="custom-input"
							maxlength="3" size="3" /> &nbsp;-&nbsp; <input type="tel"
							id="tel2" name="tel2" class="custom-input" maxlength="4" size="4" />
						&nbsp;-&nbsp; <input type="tel" id="tel3" name="tel3"
							class="custom-input" maxlength="4" size="4" />
					</div>
					<div class="input_wrap">
						<label class="input_label" for="address">주소 <span>*</span></label><input
							type="text" id="postal_code" name="postal_code"
							class="custom-input" placeholder="우편번호" required />
						<div class="search_zipcode">우편번호 검색</div>
					</div>
					<div class="address_wrap">
						<input type="text" id="address_line1" name="address_line1"
							class="custom-input long-input" placeholder="주소" required />
					</div>

					<div class="address_wrap">
						<input type="text" id="address_line2" name="address_line2"
							class="custom-input long-input" placeholder="상세 주소" />
					</div>
					<div class="input_wrap">

						<label class="custom-checkbox"> <input type="checkbox"
							id="default_address" name="default_address" /> <span
							class="checkmark"></span>
						</label> <label for="default_address">기본배송지로 등록</label>


					</div>
					<div class="input_wrap">
						<select id="requirement" name="country" required
							class="custom-select">
							<option value="">배송시 요청사항을 선택해주세요.</option>
							<option value="">부재시 문앞에 놓아주세요.</option>
							<option value="">부재시 경비실에 맡겨주세요.</option>
							<option value="">부재시 전화 또는 문자주세요.</option>
							<option value="">택배함에 넣어주세요.</option>
							<option value="">직접 입력</option>
						</select>
					</div>
				</div>



				<!-- 주문상품 -->
				<div class="order_product content_wrap">
					<div class="form_title">주문 상품</div>

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
								<div class="coupon">쿠폰적용가 : 9,000원</div>
							</div>
						</div>

					</div>
					<!-- 아이템 한개 끝 -->

				</div>


				<!-- 결제수단 -->
				<div class="payment_option content_wrap">
					<div class="form_title">결제수단</div>
					<div class="payment_btn_wrap">
						<div id="credit_cart">신용카드</div>
						<div id="kakaopay">카카오페이</div>
						<div id="account_transfer">계좌이체</div>
						<div id="">신용카드</div>
						<div id="">카카오페이</div>
						<div id="">삼성페이</div>
						<div id="">네이버페이</div>
						<div id="">페이코</div>
						<div id="">무통장입금</div>
					</div>
					<div class="payment_notice">
						<ul>
							<li>카카오톡 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.</li>
							<li>인터넷 익스플로러는 8 이상에서만 결제 가능합니다.</li>
							<li>카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.</li>
						</ul>
					</div>
				</div>

			</div>
			<!-- left_box 끝 -->

			<div class="right_box">
				<div class="payment_box">

					<div class="payment_box_title">결제 금액</div>
					<div class="total_prd_amount">
						<div>총 상품금액</div>
						<div>
							<span>30,000</span><span>원</span>
						</div>
					</div>
					<div class="total_shipping_fee">
						<div>배송비</div>
						<div>
							<span>+</span></span><span>3.000</span><span>원</span>
						</div>
					</div>
					<div class="total_discount coupon">
						<div>쿠폰할인 금액</div>
						<div>
							<span>-</span></span><span>5.000</span><span>원</span>
						</div>

					</div>
					<div class="point_discount">

						<div>마일리지 사용</div>
						<div>
							<span>-</span></span><span>0</span><span>원</span>
						</div>
					</div>
					<div class="final_payment_amount">
						<div>최종 결제 금액</div>
						<div>
							<span>10,000</span><span>원</span>
						</div>
					</div>

					<div class="final_pay_agreement">
						<div>
							<label class="custom-checkbox"> <input type="checkbox"
								id="" name="" /> <span class="checkmark"></span>
							</label> <label for="">주문 내용을 확인했으며, 아래 내용에 모두 동의합니다.</label>
						</div>

						<div>
							<label class="custom-checkbox"> <input type="checkbox"
								id="" name="" /> <span class="checkmark"></span>
							</label> <label for="">(필수) 개인정보 수집/이용 동의보기</label>

						</div>


						<div>
							<label class="custom-checkbox"> <input type="checkbox"
								id="" name="" /> <span class="checkmark"></span>
							</label> <label for="">(필수) 개인정보 제3자 제공 동의보기</label>
						</div>

						<div>
							<label class="custom-checkbox"> <input type="checkbox"
								id="" name="" /> <span class="checkmark"></span>
							</label> <label for="">(필수) 결제대행 서비스 이용약관(주)KG이니시스</label>
						</div>
					</div>

					<div class="pay_noti">결제 및 계좌 안내 시 상호명은 (주)아이브리드로 표기되니 참고
						부탁드립니다.</div>
					<a href="<c:url value='/shop/order_confirm'/>">
						<div id="order_all_btn">결제하기</div>
					</a>
				</div>
			</div>
		</form>













		<!-- 본문 끝 -->


		<!-- 공통 layout: botton.jsp -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />


	</div>
</body>
</html>