<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>쪽지 내용</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            color: #444;
            line-height: 1.6;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .message-detail {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .message-item {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .message-item strong {
            color: #007bff;
            display: block;
            margin-bottom: 5px;
        }
        form {
            margin-top: 20px;
        }
        button {
            padding: 12px 20px;
            color: #fff;
            background-color: #d9534f;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #c9302c;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
            padding: 12px 20px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
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
<div class="message-detail">
    <div class="message-item">
        <strong>보낸 사람 (닉네임):</strong> ${message.senderNickname}
    </div>
    <div class="message-item">
        <strong>제목:</strong> ${message.msgSubject}
    </div>
    <div class="message-item">
        <strong>내용:</strong> ${message.msgContent}
    </div>
    <div class="message-item">
        <strong>날짜:</strong> ${message.msgTimestamp}
    </div>
</div>

<div class="action-buttons">
    <form name="deleteForm" action="${pageContext.request.contextPath}/messenger/deleteMessage" method="post">
        <input type="hidden" name="msgId" value="${message.msgId}">
        <button type="button" onclick="confirmDelete()">삭제</button>
    </form>

    <a href="${pageContext.request.contextPath}/messenger" class="btn-secondary">뒤로</a>
</div>
</body>
</html>
