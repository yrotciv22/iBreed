<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>쪽지함</title>
    <script type="text/javascript">
        // 전송 성공 메시지 처리
        window.onload = function() {
            var message = '${message}';
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
<h1>받은 쪽지함</h1>
<table border="1">
    <tr>
        <th>보낸 사람</th>
        <th>제목</th>
        <th>날짜</th>
        <th>삭제</th>
    </tr>
    <c:forEach var="message" items="${receivedMessages}">
        <tr>
            <td>${message.senderNickname}</td>
            <td><a href="${pageContext.request.contextPath}/messenger/read?msgId=${message.msgId}">${message.msgSubject}</a></td>
            <td>${message.msgTimestamp}</td>
            <td>
                <button type="button" onclick="confirmDelete(${message.msgId})">삭제</button>
            </td>
        </tr>
    </c:forEach>
</table>

<form name="deleteForm" action="${pageContext.request.contextPath}/messenger/deleteMessage" method="post" style="display:none;">
    <input type="hidden" name="msgId" value="">
</form>

<a href="messenger/send">쪽지 보내기</a>

</body>
</html>
