<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your ID</title>
</head>
<body>
<h2>Your ID</h2>
<p>Your ID is: ${username}</p>
<a href="${pageContext.request.contextPath}/login">Login</a>
</body>
</html>
