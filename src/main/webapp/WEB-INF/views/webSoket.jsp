<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Notification Page</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
    <script>
            console.log("웹소켓에 진입하였습니다");

            var stompClient = null;
            console.log("웹소켓 시스템 아이디 추적 기능 활성화 : " + userId);

            function connect() {
                if (userId) {  // userId가 존재할 때만 WebSocket 연결 시도
                    var socket = new SockJS('/ws');
                    stompClient = Stomp.over(socket);

                    stompClient.connect({}, function(frame) {
                        console.log('Connected: ' + frame);

                        // 사용자의 ID에 따라 구독
                        stompClient.subscribe('/topic/notifications/' + userId, function(notification) {
                            showNotification(notification.body);
                            showBrowserNotification(notification.body);
                        });
                    }, function(error) {
                        console.log('WebSocket 연결이 끊어졌습니다. 다시 연결 시도 중...');
                        setTimeout(connect, 5000);  // 5초 후 재연결 시도
                    });
                } else {
                    console.log("User is not logged in, skipping WebSocket connection.");
                }
            }

            function showNotification(message) {
                console.log("알림 발생");
                loadNotifications(userId);
                var notificationElement = document.getElementById("floating-notification");
                var notificationText = document.getElementById("notification-text");
                notificationText.textContent = message;

                // 'hidden' 클래스를 제거하여 알림을 표시
                notificationElement.classList.remove("hidden");
                notificationElement.style.display = "block"; // 이 줄을 추가해서 확실히 표시되도록

                setTimeout(closeNotification, 10000); // 10초 후 알림 자동 닫기
            }

            function showBrowserNotification(message) {
                if (Notification.permission === "granted") {
                    new Notification("새 알림", {
                        body: message,
                        icon: "/path/to/icon.png" // 알림 아이콘 경로 설정
                    });
                }
            }

            function closeNotification() {
                var notificationElement = document.getElementById("floating-notification");
                notificationElement.classList.add("hidden");
                notificationElement.style.display = "none"; // 이 줄을 추가하여 알림을 숨기도록 설정
            }

            function checkNotificationPermission() {
                if (Notification.permission === "granted") {
                    console.log("알림이 허용되었습니다.");
                } else if (Notification.permission === "denied") {
                    alert("알림이 차단되었습니다. 브라우저 설정에서 알림을 허용해주세요.");
                } else if (Notification.permission === "default") {
                    Notification.requestPermission().then(function(permission) {
                        if (permission === "granted") {
                            console.log("알림이 허용되었습니다.");
                        } else if (permission === "denied") {
                            alert("알림이 차단되었습니다. 브라우저 설정에서 알림을 허용해주세요.");
                        }
                    });
                }
            }

            checkNotificationPermission();  // 페이지가 로드될 때 알림 권한을 체크
            connect();  // 페이지가 로드될 때 웹소켓에 연결

    </script>
    <style>
        /* 알림 말풍선 스타일 */
        .floating-notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #333;
            color: #fff;
            border: 1px solid #444;
            padding: 20px;
            width: 400px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            z-index: 1000;
            display: none;
            font-size: 16px;
        }

        .floating-notification.hidden {
            display: none;
        }

        .close-btn {
            background: #f44336;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 5px;
            margin-left: 10px;
        }

        #notification-text {
            font-size: 18px;
            font-weight: bold;
        }

        /* 브라우저 설정 안내 메시지 스타일 */
        #permission-alert {
            display: none;
            background-color: #ff9800;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1001;
        }
    </style>
</head>
<body>

<div id="floating-notification" class="floating-notification hidden">
    <span id="notification-text">알림 내용</span>
    <button class="close-btn" onclick="closeNotification()">닫기</button>
</div>

<div id="permission-alert">
    알림이 차단되었습니다. 브라우저 설정에서 알림을 허용해주세요.
</div>

</body>
</html>
