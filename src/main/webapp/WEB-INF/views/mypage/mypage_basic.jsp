<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />

<!-- 여기에 css, js 파일 링크를 작성하세요. -->

</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<!-- 공통 마이페이지 mypage_layout.jsp -->
		<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

		<div class="contents_wrap">
			<!-- 본문작성 -->
			
			
			
			


			이 안에서만 본문 작성 하세요!!








			<!-- 본문작성 끝 -->
		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>