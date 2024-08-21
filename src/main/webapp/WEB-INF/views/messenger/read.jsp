<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>쪽지 내용</title>
    <script type="text/javascript">
        function confirmDelete() {
            if (confirm("정말 이 쪽지를 삭제하시겠습니까?")) {
                document.deleteForm.submit();
            }
        }
    </script>
</head>
<body>
<h1>쪽지 내용</h1>
<p><strong>보낸 사람 (닉네임):</strong> ${message.senderNickname}</p>
<p><strong>제목:</strong> ${message.msgSubject}</p>
<p><strong>내용:</strong> ${message.msgContent}</p>
<p><strong>날짜:</strong> ${message.msgTimestamp}</p>

<form name="deleteForm" action="${pageContext.request.contextPath}/messenger/deleteMessage" method="post">
    <input type="hidden" name="msgId" value="${message.msgId}">
    <input type="button" value="삭제" onclick="confirmDelete()">
</form>

<a href="${pageContext.request.contextPath}/messenger">뒤로</a>

</body>
</html>
