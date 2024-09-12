
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value="/js/recent.js"/>"></script>
</head>

<div class="mypage_title">My Page</div>

<div class="top_wrap">
	<div class="mypage_user_id">
		<span>${nickName}</span> 님
	</div>
	<div class="top_box_wrap">
		<div class="top_box">회원 등급<br>${rating}</div>
		<div class="top_box">
			총 작성한 <br />다이어리 <br>${diaryCount}
		</div>
	
		<div class="top_box">총 주문 횟수 <br>${payCount}</div>
		<div class="top_box">
			사용가능 <br /> 쿠폰 >
		</div>
		<div class="top_box">마일리지 ></div>
	</div>
</div>

	<div class="row_wrap">
			<div class="left_sidebar">

				<div class="nav_label">나의 쇼핑 활동</div>
				<a href="<c:url value='/mypage/orderList'/>"><div class="nav_menu">주문/배송 조회</div></a>
				<a href="<c:url value='/mypage/cancelList'/>"><div class="nav_menu">취소/교환/반품
						내역</div></a> <a href="<c:url value='/mypage/wishlist'/>"><div class="nav_menu">찜리스트</div></a>
				<a href="" id="recentProducts"><div class="nav_menu">최근 본 상품</div></a>
				<a href="<c:url value='/mypage/review'/>"><div class="nav_menu">리뷰 내역</div></a>

				<div class="nav_label">나의 정보 관리</div>

				<a href="<c:url value=''/>"><div class="nav_menu">회원정보 수정</div></a>
				<a href="<c:url value=''/>"><div class="nav_menu">알림 설정</div></a>

				<div class="nav_label">고객센터</div>
			</div>

		
			
			