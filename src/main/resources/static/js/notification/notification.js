function toggleNotification() {
    var dropdown = document.getElementById("notificationDropdown");
    if (dropdown.style.display === "none" || dropdown.style.display === "") {
        dropdown.style.display = "block";
    } else {
        dropdown.style.display = "none";
    }
}

function loadNotifications() {
    console.log("알람 전송 전 user_id : " + userId);
    $.ajax({
        type: "post",
        url: "/notification",
        data: { user_id: userId },
        dataType: "json", // 서버에서 JSON 형식으로 응답받기 위해 설정
        success: function(result) {
            console.log("응답 결과: ", result);
            console.log("길이 측정 시작 : " + result.length);
            // 리스트의 길이를 bell_circle 요소에 표시
            $('#bell_value').text(result.length);

            var notificationBody = $('.notification-body');
            notificationBody.empty();  // 기존 알림 제거

            result.forEach(function(notification) {
                // 전달된 timestamp는 이미 문자열로 변환된 상태이므로 추가 변환이 필요 없습니다.
                var formattedDate = notification.timestamp;

                var itemHtml = `
                    <div class="notification-item" onclick="handleNotificationClick(${notification.noti_id})">
                        <p class="notification-text">${notification.message}</p>
                        <span class="timestamp">${formattedDate}</span>
                        <button class="delete-btn" onclick="deleteNotification(${notification.noti_id}, event)">삭제</button>
                    </div>
                `;
                notificationBody.append(itemHtml);
            });
        },
        error: function() {
            alert("실패");
        }
    });
}

// 별도의 함수를 만들어서 두 가지 작업을 처리
function handleNotificationClick(noti_id) {
    // deleteNotification 호출
    deleteNotification(noti_id, null);

    // 페이지 이동
    window.location.href = '/link_based_on_message/' + noti_id;
}


function deleteNotification(noti_id, event) {
    if(event){
        event.stopPropagation(); // 클릭 이벤트가 부모 요소로 전파되지 않도록 방지
    }
    // 삭제 기능 구현 (AJAX 호출 등)
    $.ajax({
        type: "post",
        url: "/notificationDelete",
        data: { user_id: userId,
                noti_id: noti_id},
        dataType: "json", // 서버에서 JSON 형식으로 응답받기 위해 설정
        success: function(result) {
            if(result == 100){
                loadNotifications(userId);
                console.log("이미 삭제되어서 문제가발생 할 수 있음.");
            }
            else{
                loadNotifications(userId);
                console.log("정상 삭제 완료");

            }

        },
        error: function() {
            alert("실패");
        }
    });
    console.log("삭제할 알림 ID:", noti_id);
}

function deleteAllNotifications() {
    $.ajax({
        type: "post",
        url: "/notificationAllDelete",
        data: { user_id: userId },
        dataType: "json", // 서버에서 JSON 형식으로 응답받기 위해 설정
        success: function(result) {
            if(result == 100){
                loadNotifications(userId);
                console.log("이미 삭제되어서 문제가발생 할 수 있음.");
            }
            else{
                loadNotifications(userId);
                console.log("정상 삭제 완료");

            }

        },
        error: function() {
            alert("실패");
        }
    });

}



// 페이지를 클릭했을 때, 알림 창을 닫도록 설정
window.onclick = function(event) {
    if (!event.target.matches('.bell') && !event.target.matches('.bell_circle')) {
        var dropdown = document.getElementById("notificationDropdown");
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        }
    }
}
