<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary TEST</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_test.css' />" />

<!-- Slick  -->


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/slick.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/slick-theme.css'/>" />

<style type="text/css">
.slider {
	display: flex;
	align-items: center;
	width: 50%;
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}
.slick-current img{
	width: 120%;
}
</style>


</head>
<body>

	<div class="all">
		<div class="diary_wrap">

			<div class="diary_content">

				<!-- 각 페이지 작업 구간  -->

<%-- 	<img src="<c:url value='/image/pencil_color.png'/>" /> --%>
				<section class="center slider">
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					<div>
						<img src="<c:url value='https://images.unsplash.com/photo-1605713288610-00c1c630ca1e?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'/>" />
					</div>
					
				</section>

				<!-- 각 페이지 작업 구간 끝  -->


			</div>
		</div>


		<!-- 공통 layout 다이어리 우측 탭 -->
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script charset="utf-8" type="text/javascript"
		src="<c:url value='/js/slick.js'/>"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {

			$('.center').slick({
				centerMode : true,
				centerPadding : '60px',
				slidesToShow : 3,
				responsive : [ {
					breakpoint : 768,
					settings : {
						arrows : false,
						centerMode : true,
						centerPadding : '40px',
						slidesToShow : 3
					}
				}, {
					breakpoint : 480,
					settings : {
						arrows : false,
						centerMode : true,
						centerPadding : '40px',
						slidesToShow : 1
					}
				} ]
			});

		});
	</script>
</body>
</html>
