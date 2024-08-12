<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Set New Password</title>
</head>
<body>
<h2>Set Your New Password</h2>
<form action="${pageContext.request.contextPath}/reset-password-form" method="post">
    <input type="hidden" name="token" value="${token}">
    <label for="password">New Password:</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Reset Password</button>
</form>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
<c:if test="${not empty message}">
    <p style="color: green;">${message}</p>
</c:if>
</body>
</html>
