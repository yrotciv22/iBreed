<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>쪽지 보내기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 15px;
            color: #fff;
            background-color: #007bff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
            padding: 10px 15px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .nickname-check-result {
            color: #d9534f;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        var senderNickname = '${sessionScope.user_nickname}'; // 세션에서 보낸 사람 닉네임 가져오기

        function checkNickname() {
            var receiverNickname = $('#receiverNickname').val();

            if (senderNickname === receiverNickname) {
                $('#nicknameCheckResult').text('같은 사람에게는 보낼 수 없습니다.');
                return;
            }

            $.ajax({
                url: '${pageContext.request.contextPath}/messenger/checkNickname',
                type: 'GET',
                data: { nickname: receiverNickname },
                success: function(response) {
                    $('#nicknameCheckResult').text(response);
                },
                error: function() {
                    $('#nicknameCheckResult').text('오류가 발생했습니다.');
                }
            });
        }
    </script>
</head>
<body>
<h1>쪽지 보내기</h1>
<form action="${pageContext.request.contextPath}/messenger/send" method="post">
    <input type="text" id="receiverNickname" name="receiverNickname" placeholder="받는 사람 (닉네임)" required>
    <button type="button" onclick="checkNickname()">닉네임 확인</button>
    <span id="nicknameCheckResult" class="nickname-check-result"></span>
    <input type="text" name="msgSubject" placeholder="제목" required>
    <textarea name="msgContent" placeholder="내용" required></textarea>
    <button type="submit">쪽지 보내기</button>
</form>

<a href="${pageContext.request.contextPath}/messenger" class="btn-secondary">쪽지함으로 돌아가기</a>

</body>
</html>
