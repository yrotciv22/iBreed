<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
    <script src="<c:url value="/js/notification/notification.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/notification/notification.css'/>" />

<%--    페이지 로드 후 알람 갯수 체크용 함수--%>
    <script>
        // 페이지 로드 후 실행
        window.onload = function() {
            loadNotifications('${sessionScope.user_id}');
        };
    </script>
<%--    페이지 로드 후 알람 갯수 체크용 함수 끝--%>

	<%--알림 시스템 추가--%>
	<%--해당 코드는 알림을 띄우기 위한 코드입니다. 반드시 모든페이지마다 추가해야 알림이갑니다.--%>
	<c:import url="/WEB-INF/views/webSoket.jsp" />
	<%--알림 시스템 추가 끝--%>


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
<%--                알람 작업 시작--%>


                <div style="position: relative;">
                    <a href="javascript:void(0);" onclick="toggleNotification('${sessionScope.user_id}')">
                        <img class="bell" src="<c:url value='/image/bell.png'/>"/>
                        <div class="bell_circle" id="bell_value">0</div>
                    </a>

                    <!-- 숨겨진 알림 영역 -->
                    <div id="notificationDropdown" class="notification-dropdown">
                        <!-- 여기에 알림 내용이 들어갑니다 -->
                        <div class="notification-header">
                            <h3>알림</h3>
                        </div>
                        <div class="notification-body">
                            <div class="notification-item">
                                <p class="notification-text">알림 내용 1</p>
                                <span class="timestamp">2024-08-28 10:45</span>
                            </div>
                            <div class="notification-item">
                                <p class="notification-text">알림 내용 2</p>
                                <span class="timestamp">2024-08-28 09:30</span>
                            </div>
                            <!-- 추가 알림 항목 -->
                        </div>
                    </div>
                </div>


                <%--                알람 작업 종료--%>


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
