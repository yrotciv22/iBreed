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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/account/login.css'/>" />

    <script src="<c:url value='/js/index.js'/>"></script>

</head>

<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <!-- 메인 -->
    <main class="container">
        <section>
            <h1>로그인</h1><br><br>


            <form id="loginForm" class="login-form" action="<c:url value="/login/check"/>" method="post">
                <div class="input-group">
                    <label for="user_id"></label>
                    <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해 주세요." required>
                </div>

                <div class="input-group">
                    <label for="user_password"></label>
                    <input type="password" id="user_password" name="user_password" placeholder="비밀번호를 입력해 주세요." required>
                </div>
                <button type="submit">로그인</button>
                <div class="options">
                    <input type="checkbox" id="save-id" checked> <label for="save-id">아이디 저장</label>
                    <nav class="links">
                        <a href="<c:url value='/find-id'/>">아이디 찾기</a>
                        | <a href="<c:url value='/reset-password'/>">비밀번호 찾기</a>

                    </nav>
                </div>
            </form>
        </section>

        <section class="buttons">
            <button type="button" onclick="location.href='<%= request.getContextPath() %>/join'">회원가입</button>
        </section>
    </main>
    <!-- 메인 끝 -->


    <!-- 공통 layout: botton.jsp -->
    <c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>