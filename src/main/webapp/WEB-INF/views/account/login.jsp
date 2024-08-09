<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>iBreed</title>

    <!-- 공통 layout: head.jsp -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>" />
    <script src="<c:url value='/js/index.js'/>"></script>

</head>

<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <!-- 메인 -->
    <main class="container">
        <section>
            <form id="loginForm" class="login-form" action="<%= request.getContextPath() %>/login" method="post">
                <div class="input-group">
                    <label for="id"></label>
                    <input type="text" id="id" name="id" placeholder="아이디를 입력해 주세요." required>
                    <span class="error-message" id="idError" style="display: none;"></span>
                </div>

                <div class="input-group">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요." required>
                    <span class="error-message" id="passwordError" style="display: none;"></span>
                </div>
                <button type="submit">로그인</button>
                <div class="options">
                    <input type="checkbox" id="save-id" checked> <label for="save-id">아이디 저장</label>
                    <nav class="links">
                        <a href="#">아이디 찾기</a> <span> | </span> <a href="#">비밀번호 찾기</a>
                    </nav>
                </div>
            </form>
        </section>

        <section class="sns-login">
            <p>개인정보 보호를 위해 공용 PC에서 사용 시 SNS계정의 로그아웃 상태를 꼭 확인해 주세요.</p>
            <div class="sns-icons">
                <a href="#"><img src="<%= request.getContextPath() %>/img/login/naver.png"></a>
                <a href="#"><img src="<%= request.getContextPath() %>/img/login/kakao.png"></a>
                <a href="#"><img src="<%= request.getContextPath() %>/img/login/google.png"></a>
            </div>
        </section>
        <section class="buttons">
            <button type="button" onclick="location.href='<%= request.getContextPath() %>/join.jsp'">회원가입</button>
            <button type="button" onclick="location.href='#'">비회원 주문조회</button>
        </section>
    </main>
    <!-- 메인 끝 -->


    <!-- 공통 layout: botton.jsp -->
    <c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>