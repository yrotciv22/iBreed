<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>

	<div class="header">

		<div class="top1">
			<h1 class="hd_logo">
				<a href="<c:url value='/'/>">iBREED</a>
			</h1>

			<div class="hd_icon_wrap">
			
				<div>
					<a href="<c:url value='/'/>"> 
					<img class="user"
						src="<c:url value='/image/user.png'/>">
					</a>
				</div>
				
				<div>
					<a href="<c:url value='/shop/cart'/>"> 
					<img class="cart"
						src="<c:url value='/image/cart.png'/>">
					</a>
				</div>

			<!-- 로그인 성공한 경우 추가 -->
			
			<c:if test="${not empty sessionScope.user_id}">
			<div>
					<a href="<c:url value='/'/>"> 
					<img class="bell"
						src="<c:url value='/image/bell.png'/>"/>
						<div class="bell_circle">11</div>
					</a>
			</div>
			
			<div>
					<a href="<c:url value='logout'/>"> 
					<img class="logout"
						src="<c:url value='/image/logout.png'/>">
					</a>
			</div>
			</c:if>
			

			</div>
		</div>


		<nav class="top2">
			<div>
				<a href="<c:url value='/'/>">i다이어리</a>
			</div>
			<div>
				<a href="<c:url value='/shop'/>">i마켓</a>
			</div>
			<div>
				<a href="<c:url value='/community'/>">커뮤니티</a>
			</div>
			<div>
				<a href="<c:url value='/map'/>">동네정보</a>
			</div>
			<%-- <div>
				<a href="<c:url value='/'/>">공지사항</a>
			</div> --%>
			<div>
				<a href="<c:url value='/'/>">고객센터</a>
			</div>

		</nav>



	</div>


</header>
