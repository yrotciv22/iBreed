<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>쪽지함</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        button {
            padding: 5px 10px;
            color: #fff;
            background-color: #d9534f;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #c9302c;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
    <script type="text/javascript">
        // 새 창에서 메신저 페이지 열기
        window.onload = function() {
            if (window.opener == null && !window.name) {
                window.name = "messengerWindow";
                window.open(location.href, "_blank", "width=800,height=600");
            }
        }

        function confirmDelete(msgId) {
            if (confirm("정말 이 쪽지를 삭제하시겠습니까?")) {
                document.forms['deleteForm'].msgId.value = msgId;
                document.forms['deleteForm'].submit();
            }
        }
    </script>
</head>
<body>
<h1>받은 쪽지함</h1>
<table>
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

<a href="messenger/send" class="btn-primary">쪽지 보내기</a>

</body>
</html>
