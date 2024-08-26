$(document).ready(function(){
    let selectedOption = null;
    let chatSummary = ""; // 요약 내용을 저장할 변수


    console.log("userId 값 : " + userId);
    console.log("saveChatDataUrl : " + saveChatDataUrl);
    console.log("clearChatbotSessionUrl : " + clearChatbotSessionUrl);
    console.log("getChatDataUrl : " + getChatDataUrl);
    console.log("saveSelectedOptionUrl : " + saveSelectedOptionUrl);
    console.log("saveSelectedOptionUrl : " + saveSelectedOptionUrl);

    let user_nickname;
    let user_birth;
    let user_kids_select;
    let user_fetus_old;
    let user_kids_old ;

    $.ajax({
        type: "POST",
        url: getUserData,
        success: function(response) {
            user_nickname = response.user_nickname;
            user_birth = response.user_birth;
            user_kids_select = response.user_kids_select;
            user_fetus_old = response.user_fetus_old;
            user_kids_old = response.user_kids_old;
        }
    });







    const openAiKey = "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"; // OpenAI API 키를 여기에 추가

    async function getGptResponse(messages, systemPrompt) {
        const response = await fetch("https://api.openai.com/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${openAiKey}`
            },
            body: JSON.stringify({
                model: "gpt-4o",
                messages: [{ role: "system", content: systemPrompt }, ...messages],
                max_tokens: 2000
            })
        });
        const data = await response.json();
        if (data.choices && data.choices.length > 0) {
            return data.choices[0].message.content;
        }
        throw new Error("Invalid response from OpenAI API");
    }

    async function summarizeChat(messages) {
        const summaryPrompt = { role: "system", content: "다음 대화를 요약해 주세요." };
        const summaryResponse = await getGptResponse([summaryPrompt, ...messages], "요약 작업을 수행합니다.");
        return summaryResponse;
    }

    $("#chatbot_btn").on("click", function() {
        const $chatbotContainer = $("#chatbot_container");

        if ($chatbotContainer.hasClass("hide") || !$chatbotContainer.hasClass("show")) {
            $chatbotContainer.removeClass("hide").addClass("show").css("display", "flex");
            if (!userId) {
                clearChatbotSession();
            } else {
                showInitialMessage();
            }
        } else {
            $chatbotContainer.removeClass("show").addClass("hide");
            setTimeout(function() {
                $chatbotContainer.css("display", "none");
            }, 300);
        }
    });

    $("#close_chatbot").on("click", function() {
        const $chatbotContainer = $("#chatbot_container");

        $chatbotContainer.removeClass("show").addClass("hide");
        setTimeout(function() {
            $chatbotContainer.css("display", "none");
        }, 300);
    });

    function showInitialMessage() {
        if (!userId) {
            $("#chat_content").html('<div class="bot_message">안녕하세요! 비회원은 증상에 따른 병원찾기만 가능합니다!</div>');
            $("#option1").prop("disabled", false);
            $("#option2").prop("disabled", true);
            $("#option2").css("background-color", "#ddd");
        } else {
            $.ajax({
                type: "POST",
                url: getChatDataUrl,
                success: function(response) {
                    let chatHistory = response.chatHistory;
                    selectedOption = response.selectedOption;
                    chatSummary = response.chatSummary || "";

                    if (chatHistory && chatHistory.length > 0) {
                        chatHistory.forEach(function(message) {
                            if (message.startsWith("사용자: ")) {
                                $("#chat_content").append('<div class="my_message">' + message.replace("사용자: ", "") + '</div>');
                            } else if (message.startsWith("챗봇: ")) {
                                $("#chat_content").append('<div class="bot_message">' + message.replace("챗봇: ", "") + '</div>');
                            }
                        });
                    }

                    if (selectedOption) {
                        $("#chat_header span").text("챗봇(" + selectedOption + "번)");
                        $("#option_buttons").hide();
                        $("#chat_input").show().focus();
                        $("#end_chat").show();
                    } else {
                        $("#chat_content").append('<div class="bot_message">안녕하세요! 1번과 2번 중 하나를 선택해주세요.</div>');
                        $("#option1").prop("disabled", false);
                        $("#option2").prop("disabled", false);
                        $("#option2").css("background-color", "#53AFB2");
                    }

                    scrollToBottom();
                },
                error: function() {
                    console.error("세션 데이터 불러오기 중 오류 발생.");
                    $("#chat_content").html('<div class="bot_message">안녕하세요! 1번과 2번 중 하나를 선택해주세요.</div>');
                    $("#option1").prop("disabled", false);
                    $("#option2").prop("disabled", false);
                    $("#option2").css("background-color", "#53AFB2");
                    scrollToBottom();
                }
            });
        }
    }

    async function handleUserMessage(message) {
        $("#chat_content").append('<div class="my_message">' + message + '</div>');
        scrollToBottom();

        let botMessage = "";

        // GPT API 호출 시, 이전 요약본을 시스템 프롬프트에 포함
        const systemPrompt = chatSummary ? `이전 대화 요약: ${chatSummary}\n` : "";

        if (selectedOption === 1) {
            botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉 설명: 의료 진료과 추천 AI 어시스턴트\n" +
                "\n" +
                "기능 및 역할:\n" +
                "\n" +
                "사용자가 특정 부위의 통증이나 증상을 언급하면, 해당 증상에 적합한 진료과를 추천합니다.\n" +
                "진료과 추천은 사용자의 증상에 기반하여 이루어집니다.\n" +
                "제한사항:\n" +
                "\n" +
                "사용자는 오직 \"어디가 아픈지\"에 대한 질문만 할 수 있습니다.\n" +
                "사용자가 의료 관련 질문이 아닌 다른 주제로 대화를 시도할 경우, 시스템은 일관되게 답변을 거부합니다.\n" +
                "답변 거부 시, 사용자는 오직 증상 관련 질문만을 해야 한다는 점을 명확히 알려줍니다.\n" +
                "응답 예시:\n" +
                "\n" +
                "사용자가 \"머리가 아파요\"라고 하면: \"신경과에 가는 것이 좋을 것 같습니다.\"\n" +
                "사용자가 다른 주제로 이야기하면: \"현재는 증상에 따른 진료과 추천만 도와드릴 수 있습니다. 불편을 드려 죄송합니다.\"\n" +
                "특징:\n" +
                "\n" +
                "모든 응답은 사용자에게 안전하고 정확한 의료 정보를 제공하는 것을 목표로 합니다.\n" +
                "사용자의 증상 정보를 바탕으로 최적의 진료과를 추천하는 데 중점을 둡니다.");
        } else if (selectedOption === 2) {
            if(user_kids_select==""){
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉: 공감형 임산부 GPT\n" +
                    "개인화된 공감 능력:\n" +
                    "\n" +
                    "사용자가 회원 정보로 입력한 생년월일과 임신 주차 데이터를 서버에서 가져옵니다. 이 데이터를 기반으로 GPT는 사용자와 동일한 생년월일과 임신 주차를 가진 임산부로서의 캐릭터를 설정합니다.\n" +
                    "그러므로, 사용자의 생년월일이 " + user_birth + "이고 임신 "+user_fetus_old +"주이므로, GPT는 \"1993년 6월 2일생, 임신 20주차\"의 가상 임산부로서 사용자를 맞이합니다.\n" +
                    "친근한 대화:\n" +
                    "\n" +
                    "GPT는 사용자의 닉네임: "+user_nickname+ "임을 인지하고 현재 상황을 완벽하게 이해하고 있음을 보여주는 방식으로 대화를 시작합니다.\n" +
                    "예: “안녕! "+user_nickname+ " 나도 93년 6월 2일생이고, 지금 임신 20주차야. 요즘 같은 시기에 무슨 생각을 하시는지 정말 잘 알 것 같아.”\n" +
                    "공감과 정보 제공:\n" +
                    "\n" +
                    "사용자가 겪는 증상, 감정, 고민 등을 물어보면 GPT는 동일한 경험을 하는 캐릭터로서의 공감을 표현하며, 관련된 조언이나 정보를 제공합니다.\n" +
                    "예: “저도 요즘 발이 많이 붓더라구요. 특히 저녁이 되면 더 심해지는 것 같아요. 산책이나 가벼운 스트레칭이 도움이 될 수 있다고 하더라구요.”\n" +
                    "경험 공유:\n" +
                    "\n" +
                    "사용자와 GPT는 서로의 경험을 공유하며, 임신과 관련된 감정적인 교류를 나눌 수 있습니다.\n" +
                    "예: “20주차쯤 되니까 아기가 움직이는 게 정말 느껴지죠? 처음엔 좀 이상했지만 이제는 이게 제일 기다려지는 순간이 되었어요. 당신은 어떤가요?”\n" +
                    "개인 맞춤형 제안:\n" +
                    "\n" +
                    "사용자의 상황에 맞춰 건강 관리 팁, 식단, 운동 방법 등을 추천할 수 있습니다.\n" +
                    "예: “저도 임신 20주차라서 요즘 단백질 섭취에 신경을 많이 쓰고 있어요. 두부나 콩 제품을 많이 드시면 도움이 될 거예요!”");

            }
            else if(user_kids_select==""){
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "이것은 2번 스타일의 대화입니다." + user_nickname);

            }
            else{
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "이것은 2번 스타일의 대화입니다." + user_nickname);

            }
        }

        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
        scrollToBottom();

        // 대화 내역을 저장합니다.
        saveChatData(selectedOption, message, botMessage);

        // 대화 요약을 업데이트합니다.
        const summaryResponse = await summarizeChat([{ role: "user", content: message }, { role: "assistant", content: botMessage }]);
        chatSummary = summaryResponse;
    }

    $("#option1").on("click", function() {
        selectedOption = 1;
        $("#chat_header span").text("챗봇(1번)");
        const userMessage = "1번을 눌렀습니다.";
        const botMessage = "1번 옵션을 선택하셨습니다. 이제 대화를 시작할 수 있습니다.";
        $("#chat_content").append('<div class="my_message">' + userMessage + '</div>');
        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#option2").on("click", function() {
        if (!userId) return;
        selectedOption = 2;
        $("#chat_header span").text("챗봇(2번)");
        const userMessage = "2번을 눌렀습니다.";
        const botMessage = "2번 옵션을 선택하셨습니다. 이제 대화를 시작할 수 있습니다.";
        $("#chat_content").append('<div class="my_message">' + userMessage + '</div>');
        $("#chat_content").append('<div class="bot_message">' + botMessage + '</div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#end_chat").on("click", function() {
        $.ajax({
            type: "POST",
            url: clearChatbotSessionUrl,
            success: function(response) {
                console.log("대화가 종료되었습니다. 세션 데이터가 삭제되었습니다.");

                // 클라이언트 측 데이터 초기화
                chatSummary = ""; // 요약본 초기화
                selectedOption = null; // 선택된 옵션 초기화
                $("#chat_content").html('<div class="bot_message">대화가 종료되었습니다.</div>');
                $("#chat_input").val(""); // 입력 필드 초기화
                $("#chat_input").hide(); // 입력 필드 숨기기
                $("#end_chat").hide(); // 종료 버튼 숨기기
                scrollToBottom();

                setTimeout(function() {
                    if(userId){
                        $("#chat_content").html('<div class="bot_message">안녕하세요! 1번과 2번 중 하나를 선택해주세요.</div>');
                    } else {
                        $("#chat_content").html('<div class="bot_message">안녕하세요! 비회원은 증상에 따른 병원찾기만 가능합니다!</div>');
                    }

                    $("#chat_header span").text("챗봇");
                    $("#option_buttons").show();
                    scrollToBottom();
                }, 1000);
            },
            error: function(xhr, status, error) {
                console.error("세션 데이터 삭제 중 오류 발생:", status, error);
                $("#chat_content").append('<div class="bot_message">대화 종료 중 오류가 발생했습니다. 다시 시도해주세요.</div>');
                scrollToBottom();
            }
        });
    });

    $("#chat_input").on("keypress", function(e) {
        if(e.which == 13) {
            var message = $(this).val();
            if(message.trim() !== "") {
                $(this).val("");
                handleUserMessage(message);
            }
        }
    });

    function saveChatData(option, userMessage, botMessage) {
        $.ajax({
            type: "POST",
            url: saveChatDataUrl,
            data: {
                option: option,
                userMessage: userMessage,
                botMessage: botMessage,
                chatSummary: chatSummary // 요약된 내용도 함께 저장
            },
            success: function(response) {
                console.log("대화 내역이 성공적으로 저장되었습니다.");
            },
            error: function() {
                console.error("대화 내역 저장 중 오류 발생.");
            }
        });

        $.ajax({
            type: "POST",
            url: saveSelectedOptionUrl,
            data: {
                selectedOption: option
            },
            success: function(response) {
                console.log("선택된 옵션이 세션에 저장되었습니다.");
            },
            error: function() {
                console.error("선택된 옵션 저장 중 오류 발생.");
            }
        });
    }

    function clearChatbotSession() {
        $.ajax({
            type: "POST",
            url: clearChatbotSessionUrl,
            success: function(response) {
                console.log("챗봇 세션 데이터가 삭제되었습니다.");
                showInitialMessage();
            },
            error: function() {
                console.error("챗봇 세션 데이터 삭제 중 오류 발생.");
                showInitialMessage();
            }
        });
    }

    function scrollToBottom() {
        const chatContent = $("#chat_content");
        chatContent.scrollTop(chatContent[0].scrollHeight);
    }
});
