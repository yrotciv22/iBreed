<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>iBreed</title>

    <!-- 공통 layout: head.jsp -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />

    <!-- 여기에 css, js 파일 링크를 작성하세요. -->
    <style>
        .reset-password-container {
            background-color: #f5f5f5;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 50px auto;  /* 페이지 중앙에 위치 */
            text-align: center;
        }

        .section-title {
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
        }

        .reset-password-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
            width: 100%;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-size: 0.9em;
        }

        .success-message {
            color: green;
            margin-top: 10px;
            font-size: 0.9em;
        }

    </style>

</head>


<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <div class="reset-password-container">
        <h2 class="section-title">비밀번호 리셋 하기</h2>
        <form action="${pageContext.request.contextPath}/reset-password" method="post" class="reset-password-form">
            <div class="form-group">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-input" required>
            </div>
            <button type="submit" class="btn btn-primary">이메일 전송</button>
        </form>
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if>
    </div>


    <!-- 공통 layout: bottom.jsp -->
    <c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>
