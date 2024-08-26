$(document).ready(function(){
    let selectedOption = null;
    console.log("userId 값 : " + userId);

    // URL 변수는 JSP에서 설정됩니다
    console.log("saveChatDataUrl : " + saveChatDataUrl);
    console.log("clearChatbotSessionUrl : " + clearChatbotSessionUrl);

    $("#chatbot_btn").on("click", function() {
        const $chatbotContainer = $("#chatbot_container");

        if ($chatbotContainer.hasClass("hide") || !$chatbotContainer.hasClass("show")) {
            $chatbotContainer.removeClass("hide").addClass("show").css("display", "flex");
            // 로그아웃 상태라면 세션 데이터 삭제 요청 후 기본 메시지 표시
            if (!userId) {
                clearChatbotSession();
            } else {
                showInitialMessage();
            }
        } else {
            $chatbotContainer.removeClass("show").addClass("hide");
            setTimeout(function() {
                $chatbotContainer.css("display", "none");
            }, 300); // 애니메이션 지속 시간과 동일하게 설정
        }
    });

    $("#close_chatbot").on("click", function() {
        const $chatbotContainer = $("#chatbot_container");

        $chatbotContainer.removeClass("show").addClass("hide");
        setTimeout(function() {
            $chatbotContainer.css("display", "none");
        }, 300); // 애니메이션 지속 시간과 동일하게 설정
    });

    function showInitialMessage() {
        if (!userId) {
            $("#chat_content").html('<div class="bot_message">안녕하세요! 비회원은 1번만 선택 가능합니다!</div>');
            $("#option1").prop("disabled", false);
            $("#option2").prop("disabled", true);
            $("#option2").css("background-color", "#ddd"); // 비활성화 색상 변경
        } else {
            $("#chat_content").html('<div class="bot_message">안녕하세요! 1번과 2번 중 하나를 선택해주세요.</div>');
            $("#option1").prop("disabled", false);
            $("#option2").prop("disabled", false);
            $("#option2").css("background-color", "#53AFB2"); // 활성화 색상 변경
        }
        $("#option_buttons").show();
        $("#end_chat").hide();
        $("#chat_input").hide();
        $("#chat_header span").text("챗봇"); // 초기화할 때 제목도 초기화
        scrollToBottom();
    }

    // 서버로 챗봇 대화 데이터 전송
    function saveChatData(option, userMessage, botMessage) {
        $.ajax({
            type: "POST",
            url: saveChatDataUrl, // JSP에서 설정된 URL 변수 사용
            data: {
                option: option,
                userMessage: userMessage,
                botMessage: botMessage
            },
            success: function(response) {
                console.log("대화 내역이 성공적으로 저장되었습니다.");
            },
            error: function() {
                console.error("대화 내역 저장 중 오류 발생.");
            }
        });
    }

    // 서버에서 챗봇 세션 데이터를 삭제
    function clearChatbotSession() {
        $.ajax({
            type: "POST",
            url: clearChatbotSessionUrl, // JSP에서 설정된 URL 변수 사용
            success: function(response) {
                console.log("챗봇 세션 데이터가 삭제되었습니다.");
                showInitialMessage(); // 세션 삭제 후 초기 메시지 표시
            },
            error: function() {
                console.error("챗봇 세션 데이터 삭제 중 오류 발생.");
                showInitialMessage(); // 세션 데이터가 없더라도 기본 메시지 표시
            }
        });
    }

    $("#option1").on("click", function() {
        selectedOption = 1;
        $("#chat_header span").text("챗봇(1번)"); // 제목 변경
        const userMessage = "1번을 눌렀습니다.";
        const botMessage = "1번 옵션을 선택하셨습니다. 이제 대화를 시작할 수 있습니다.";
        $("#chat_content").append('<div class="my_message">' + userMessage + '</div>');
        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        // 서버로 데이터를 전송
        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#option2").on("click", function() {
        if (!userId) return; // userId가 없으면 아무 동작도 하지 않음
        selectedOption = 2;
        $("#chat_header span").text("챗봇(2번)"); // 제목 변경
        const userMessage = "2번을 눌렀습니다.";
        const botMessage = "2번 옵션을 선택하셨습니다. 이제 대화를 시작할 수 있습니다.";
        $("#chat_content").append('<div class="my_message">' + userMessage + '</div>');
        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        // 서버로 데이터를 전송
        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#end_chat").on("click", function() {
        $("#chat_content").append('<div class="bot_message">대화가 종료되었습니다.</div>');
        scrollToBottom();
        setTimeout(function() {
            if(userId){
                $("#chat_content").append('<div class="bot_message">안녕하세요! 1번과 2번 중 하나를 선택해주세요.</div>');
            }
            else{
                $("#chat_content").html('<div class="bot_message">안녕하세요! 비회원은 1번만 선택 가능합니다!</div>');
            }

            $("#chat_header span").text("챗봇"); // 종료 시 제목 초기화
            $("#option_buttons").show();
            $("#chat_input").hide();
            $("#end_chat").hide();
            scrollToBottom();
        }, 1000); // 1초 후 초기 메시지 표시
    });

    // 채팅 입력 처리
    $("#chat_input").on("keypress", function(e) {
        if(e.which == 13) { // Enter 키를 누르면
            var message = $(this).val();
            if(message.trim() !== "") {
                // 내 메시지 추가
                $("#chat_content").append('<div class="my_message">' + message + '</div>');
                scrollToBottom(); // 내 메시지를 추가한 후 스크롤 이동
                $(this).val(""); // 입력 필드 초기화

                // AI 메시지 응답
                if (selectedOption === 1) {
                    // 1번 옵션을 선택한 경우의 응답
                    setTimeout(function() {
                        const botMessage = '1번 응답: ' + message;
                        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
                        scrollToBottom();

                        // 서버로 데이터를 전송
                        saveChatData(selectedOption, message, botMessage);
                    }, 500);
                } else if (selectedOption === 2) {
                    // 2번 옵션을 선택한 경우의 응답
                    setTimeout(function() {
                        const botMessage = '2번 응답: ' + message;
                        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
                        scrollToBottom();

                        // 서버로 데이터를 전송
                        saveChatData(selectedOption, message, botMessage);
                    }, 500);
                }
            }
        }
    });

    // 스크롤을 맨 아래로 이동시키는 함수
    function scrollToBottom() {
        const chatContent = $("#chat_content");
        chatContent.scrollTop(chatContent[0].scrollHeight);
    }
});
