<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 결과</title>
    <script type="text/javascript">
        window.onload = function () {
            if (${loginSuccess}) {
                alert("로그인 성공!");
                window.location.href = "/"; // index 페이지로 리다이렉트
            } else {
                alert("아이디와 비밀번호를 확인해주세요."); // 실패 알림
                window.location.href = "/login"; // 로그인 화면으로 리다이렉트
            }
        };
    </script>
</head>
<body>
</body>
</html>
