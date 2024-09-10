<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/orderHistory.css'/>" />
<script>const userId = "${sessionScope.user_id}"</script>

</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<!-- 공통 마이페이지 mypage_layout.jsp -->
		<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

		<div class="contents_wrap">
			<div class="sub_title">
					주문/배송 조회&nbsp; <span>(총 <span>10<span>개)</span>
				</div>

				<div class="wishlist">

					<!-- 아이템 한개 -->

					<div class="one_item_wrap">
						<!-- 좌 -->
						<div class="row_wrap">
							<table>
								<tr>
									<th>
										<label class="custom-checkbox"> <input type="checkbox" />
											<span class="checkmark"></span>
										</label>
										주문번호/시간
									</th>
									<th id="second">주문상품</th>
									<th id="third">상품금액</th>
									<th id="fourth">수량</th>
									<th>배송비</th>
									<th>배송정보</th>
									<th>결제내역</th>
								</tr>
								<c:forEach var="p" items="${payList}">
								<tr>
									<td>
										<label class="custom-checkbox"> <input type="checkbox" />
											<span class="checkmark"></span>
										</label>
										${p.pay_number}<br>
										<fmt:formatDate value="${p.pay_time}" pattern="yyyy-MM-dd hh:mm"/>
									</td>
									<td colspan="3">
										<table class="miniTable">
											<c:forEach var="o" items="${orderMap[p.pay_number]}">
												<tr>
													
													<td id="o_first"><input type="image" src="${o.product_img}" class="order_img"><br>${o.product_name}원</td>
													<td id="o_second">${o.product_price}원</td>
													<td id="o_third">${o.quantity}개</td>
												</tr>
											</c:forEach>
										</table>
									</td>
									<td>
										${p.delivery_charge}원
									</td>
									<td>
										${p.recipient_name}<br>
										${p.recipient_address}
									</td>
									<td class="breakDown">
										<span class="sub">총 결제금액</span> <span class="result">${p.total_order_amount}원</span><br>
										<span class="sub">결제방법</span> <span class="result">${p.payment_method}</span>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					</div>
					<!-- 아이템 한개 끝 -->


				</div>

		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>