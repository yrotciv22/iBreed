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
					<a href="<c:url value='/'/>"> 
					<img class="cart"
						src="<c:url value='/image/cart.png'/>">
					</a>
				</div>
				

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
			<div>
				<a href="<c:url value='/'/>">공지사항</a>
			</div>
			<div>
				<a href="<c:url value='/'/>">고객센터</a>
			</div>

		</nav>



	</div>


</header>
