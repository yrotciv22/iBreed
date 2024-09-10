<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage Wishlist</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />

<!-- 여기에 css, js 파일 링크를 작성하세요. -->
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
					취소/교환/반품 내역&nbsp;
				</div>
				<div class="select_all_wrap">
				</div>



				<div class="wishlist">


				</div>


			<!-- 본문작성 끝 -->
		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>