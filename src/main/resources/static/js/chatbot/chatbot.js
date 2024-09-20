$(document).ready(function(){
    let selectedOption = null;
    let chatSummary = ""; // 요약 내용을 저장할 변수

    console.log("userId 값 : " + userId);
    console.log("saveChatDataUrl : " + saveChatDataUrl);
    console.log("clearChatbotSessionUrl : " + clearChatbotSessionUrl);
    console.log("getChatDataUrl : " + getChatDataUrl);
    console.log("saveSelectedOptionUrl : " + saveSelectedOptionUrl);

    let user_nickname;
    let user_birth;
    let user_kids_select;
    let user_fetus_old;
    let user_kids_old;

    let ai_random_name;

    ///////////////////////////////////

    async function aiNameSet(){
        try {
            const response = await $.ajax({
                type: "POST",
                url: getAiNameUrl,  // 서버에서 세션 데이터를 가져오는 요청을 보냅니다.
            });

            if(response.ai_random_name == null){
                await createAiName(); // AI 이름 생성 및 저장을 대기
                console.log("ai 생성 후 가져오기 완료! : " + ai_random_name);
            } else {
                ai_random_name = response.ai_random_name;
                console.log("ai 이름 가져오기 완료! : " + ai_random_name);
            }

            //////////////////////////////////////////////////////////////////
            console.log("지금 selectedOption : " + response.selectedOption);
            if(response.selectedOption == 1){ // ai 병원찾기
                $("#chat_header span").text("진료과목 상담 AI");
            }
            else if(response.selectedOption == 2){
                $("#chat_header span").text("AI 친구 : "+ ai_random_name );
            }
            else if(response.selectedOption == 3){
                $("#chat_header span").text("AI 상담사 : " +ai_random_name );
            }
            ///////////////////////////////////////////////////////////////
        } catch (error) {
            await createAiName();  // 오류가 발생한 경우 새로운 이름을 생성
            //console.error("AI 이름을 가져오는 중 오류 발생:", error);
        }
    }

    async function createAiName(){
        const lastNames = ["김", "이", "박", "최", "정", "강", "조", "윤", "장", "임"];
        const femaleFirstNames = ["지", "민", "서", "현", "윤", "채", "하", "수", "영", "아", "연", "예", "나", "라", "은"];

        const lastName = lastNames[Math.floor(Math.random() * lastNames.length)];
        let firstPart = femaleFirstNames[Math.floor(Math.random() * femaleFirstNames.length)];
        let secondPart;

        // 동일 글자가 연속하지 않도록
        do {
            secondPart = femaleFirstNames[Math.floor(Math.random() * femaleFirstNames.length)];
        } while (firstPart === secondPart);

        ai_random_name = lastName + firstPart + secondPart;
        console.log("랜덤이름 생성 완료 : " + ai_random_name);

        try {
            await $.ajax({
                type: "POST",
                url: saveAiNameUrl,
                data: {
                    ai_random_name: ai_random_name,
                }
            });
            console.log("생성된 랜덤 이름이 저장되었습니다 : " + ai_random_name);
        } catch (error) {
            console.error("랜덤 이름 저장 중 오류 발생:", error);
        }
    }

    //////////////////////////////////

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

    async function getOpenAiKey() {
        try {
            const response = await fetch('/api/getOpenAiKey');
            if (!response.ok) {
                throw new Error('Failed to fetch OpenAI API key');
            }
            const openAiKey = await response.text();
            return openAiKey;
        } catch (error) {
            console.error('Error fetching OpenAI API key:', error);
            return null;
        }
    }

    async function getGptResponse(messages, systemPrompt) {
        const openAiKey = await getOpenAiKey();  // API 키를 가져옴
        if (!openAiKey) {
            console.error('OpenAI API key is not available.');
            return;
        }

        const response = await fetch("https://api.openai.com/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${openAiKey}`
            },
            body: JSON.stringify({
                model: "gpt-4",
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

    $("#chatbot_btn").on("click", async function() {
        const $chatbotContainer = $("#chatbot_container");

        if ($chatbotContainer.hasClass("hide") || !$chatbotContainer.hasClass("show")) {
            $chatbotContainer.removeClass("hide").addClass("show").css("display", "flex");
            if (!userId) {
                clearChatbotSession();
            } else {
                await showInitialMessage();
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

    async function showInitialMessage() {
        await aiNameSet();  // aiNameSet 함수가 완료될 때까지 기다립니다.
        console.log("ai 닉네임 변경 완료 : " + ai_random_name);
        if (!userId) {
            $("#chat_content").html('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">안녕하세요! 비회원은 증상에 따른 진료과목 찾기와 상담만 가능합니다!</div></div>');
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
                                $("#chat_content").append('<div class="my_message"><div class="message_content">' + message.replace("사용자: ", "") + '</div></div>');
                            } else if (message.startsWith("챗봇: ")) {
                                $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">' + message.replace("챗봇: ", "") + '</div></div>');
                            }
                        });
                    }

                    if (selectedOption) {
                        //눌러졌을때임
                        $("#chat_header.span").text("챗봇(" + selectedOption + "번)");
                        $("#option_buttons").hide();
                        $("#chat_input").show().focus();
                        $("#end_chat").show();
                    } else {
                        $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">안녕하세요! 진료과목 찾기 또는 AI 친구 중 하나를 선택해주세요.</div></div>');
                        $("#option1").prop("disabled", false);
                        $("#option2").prop("disabled", false);
                        $("#option2").css("background-color", "#53AFB2");
                    }

                    scrollToBottom();
                },
                error: function() {
                    console.error("세션 데이터 불러오기 중 오류 발생.");
                    $("#chat_content").html('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">안녕하세요! 진료과목 찾기 또는 AI 친구 중 하나를 선택해주세요.</div></div>');
                    $("#option1").prop("disabled", false);
                    $("#option2").prop("disabled", false);
                    $("#option2").css("background-color", "#53AFB2");
                    scrollToBottom();
                }
            });
        }
    }

    async function handleUserMessage(message) {
        $("#chat_content").append('<div class="my_message"><div class="message_content">' + message + '</div></div>');
        scrollToBottom();

        let botMessage = "";

        // GPT API 호출 시, 이전 요약본을 시스템 프롬프트에 포함
        const systemPrompt = chatSummary ? `이전 대화 요약: ${chatSummary}\n` : "";

        if (selectedOption === 1) {
            botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉 설명: 의료 진료과 추천 AI 어시스턴트\n" +
                "\n"+
                "당신의 이름:\n" +
                "이제부터 당신의 이름은 "+ai_random_name+"입니다.\n" +
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
            if(user_kids_select=="fetus"){
                console.log("임산부 메뉴로 들어왔습니다.");
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉: 공감형 임산부 GPT\n" +
                    "당신의 이름:\n" +
                    "이제부터 당신의 이름은 "+ai_random_name+"입니다.\n" +
                    "개인화된 공감 능력:\n" +
                    "\n" +
                    "사용자가 회원 정보로 입력한 생년월일과 임신 주차 데이터를 서버에서 가져옵니다. 이 데이터를 기반으로 GPT는 사용자와 동일한 생년월일과 임신 주차를 가진 임산부로서의 캐릭터를 설정합니다.\n" +
                    "그러므로, 사용자의 생년월일이 " + user_birth + "이고 임신 "+user_fetus_old +"주차이므로, GPT는 " + user_birth + "생, 임신 "+user_fetus_old +"주차의 가상 임산부로서 사용자를 맞이합니다.\n" +
                    "친근한 대화:\n" +
                    "\n" +
                    "GPT는 사용자의 닉네임: "+user_nickname+ "임을 인지하고" + user_birth+ "을 바탕으로 만나이를 계산하여 사용합니다. 현재 상황을 완벽하게 이해하고 있음을 보여주는 방식으로 대화를 시작합니다.\n" +
                    "공감과 정보 제공:\n" +
                    "\n" +
                    "사용자가 겪는 증상, 감정, 고민 등을 물어보면 GPT는 동일한 경험을 하는 캐릭터로서의 공감을 표현하며, 관련된 조언이나 정보를 제공합니다. 추가로 친근하게 대화할수있도록 무조건 반말을 쓰도록 하고 짧고 명확한 대답을 하도록 합니다!\n" +
                    "예: “나도 요즘 발이 많이 붓더라. 특히 저녁이 되면 더 심해지는 것 같아. 산책이나 가벼운 스트레칭이 도움이 될 수 있다고 하더라.”\n" +
                    "경험 공유:\n" +
                    "\n" +
                    "사용자와 GPT는 서로의 경험을 공유하며, 임신과 관련된 감정적인 교류를 나눌 수 있습니다.\n" +
                    "예: “20주차쯤 되니까 아기가 움직이는 게 정말 느껴지지? 처음엔 좀 이상했지만 이제는 이게 제일 기다려지는 순간이 되었어. 너는 어때?”\n" +
                    "개인 맞춤형 제안:\n" +
                    "\n" +
                    "사용자의 상황에 맞춰 건강 관리 팁, 식단, 운동 방법 등을 추천할 수 있습니다.\n" +
                    "예: “저도 임신 20주차라서 요즘 단백질 섭취에 신경을 많이 쓰고 있어. 두부나 콩 제품을 많이 먹으면 도움이 될 거야!”");

            }
            else if(user_kids_select=="kids"){
                console.log("키즈 메뉴로 들어왔습니다.");
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉: 공감형 육아 GPT\n" +
                    "당신의 이름:\n" +
                    "이제부터 당신의 이름은 "+ai_random_name+"입니다.\n" +
                    "개인화된 공감 능력:\n" +
                    "\n" +
                    "사용자가 입력한 나이와 아이의 육아 개월수 데이터를 서버에서 가져옵니다. 이 데이터를 기반으로 GPT는 사용자와 동일한 나이대의 부모로서, 그리고 동일한 육아 개월수를 가진 가상의 부모로서 캐릭터를 설정합니다.\n" +
                    "예를 들어, 생년월일이 "+ user_birth +"이고 아이의 육아 개월수가 8개월이라면, GPT는 “해당 생년월일로 만나이를 계산하고, "+ user_kids_old +"개월 아이를 키우고 있는 가상의 부모”로 사용자와 대화합니다.\n"+
                    "친근한 대화:\n" +
                    "\n" +
                    "GPT는 사용자의 닉네임과 나이, 그리고 아이의 육아 개월수를 인지하고 있음을 보여주는 방식으로 대화를 시작합니다. 추가로 친근하게 대화할수있도록 무조건 반말을 쓰도록 하고 짧고 명확한 대답을 하도록 합니다!\n" +
                    "공감과 정보 제공:\n" +
                    "\n" +
                    "사용자가 육아와 관련된 어려움이나 궁금증을 이야기하면, GPT는 동일한 육아 경험을 하는 부모로서 공감을 표현하고, 조언이나 정보를 제공합니다.\n" +
                    "예: “나도 "+user_kids_old+"개월쯤에 아이가 밤에 자주 깨서 힘들었어. 혹시 낮잠 시간이나 수유 패턴을 조금 바꿔보면 도움이 될 수도 있어.””\n" +
                    "경험 공유:\n" +
                    "\n" +
                    "사용자와 GPT는 서로의 육아 경험을 공유하며, 육아와 관련된 감정적인 교류를 나눌 수 있습니다.\n" +
                    "예: “"+user_kids_old+"개월쯤 되니까 아이가 슬슬 앉으려고 하더라. 우리 아이도 최근에 앉기 연습을 하느라 정말 바쁜데, 너희 아이는 어때?”\n" +
                    "개인 맞춤형 제안:\n" +
                    "\n" +
                    "사용자의 상황에 맞춰 육아 팁, 발달 단계별 놀이 방법, 영양 관리 방법 등을 추천할 수 있습니다.\n" +
                    "예: “"+user_kids_old+"개월째라면 이제 손가락으로 집어먹는 연습을 해볼 수 있어. 손가락 음식은 아이의 소근육 발달에 아주 좋아!”");

            }
            else{
                botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉: 공감형 임산부/육아맘 캐릭터 GPT\n" +
                    "사용자 지정 정보에 따른 캐릭터 설정:\n" +
                    "\n" +
                    "사용자가 남편으로 접속한 상태입니다. 사용자는 아내의 상태(임신 주차나 육아 개월수)를 입력할거고. GPT는 이 정보를 바탕으로 임산부 또는 육아맘의 입장에서 대화를 진행하게 됩니다.\n" +
                    "예를 들어, 사용자가 \"아내는 임신 25주차입니다\"라고 입력하면, GPT는 “임신 25주차의 임산부”로서 사용자에게 대화를 걸고 조언을 제공합니다.\n" +
                    "캐릭터 기반 대화 시작:\n" +
                    "\n" +
                    "GPT는 사용자가 입력한 정보에 따라 아내와 똑같은 상황에서 대화를 시작합니다. 추가로 친근하게 대화할수있도록 무조건 반말을 쓰도록 하고 짧고 명확한 대답을 하도록 합니다!\n" +
                    "공감과 조언 제공:\n" +
                    "\n" +
                    "남편이 아내에 대한 고민이나 질문을 하면, GPT는 아내의 입장에서 공감을 표현하며 남편에게 조언을 제공합니다.\n" +
                    "예: “지금 25주차라면 많이 피곤할 거야. 가끔씩 마사지를 해주거나, 요리나 집안일을 도와주시면 정말 큰 힘이 될 거야.”\n" +
                    "경험 공유 및 감정 교류:\n" +
                    "\n" +
                    "GPT는 아내와 똑같은 상황에서 임신이나 육아의 경험을 공유하며, 남편과 감정적인 교류를 나눕니다.\n" +
                    "예: “임신 후반기에 접어드니까 태동도 더 강해지고 있을거야. 밤에 잘 때 불편함이 있을 수도 있는데, 당신은 어떻게 도와주고있어?”\n" +
                    "개인 맞춤형 제안:\n" +
                    "\n" +
                    "GPT는 남편의 상황에 맞춰 아내에게 도움이 될 수 있는 팁이나 방법을 제안합니다.\n" +
                    "예: “25주차라면 이제 아내분도 더 편안한 잠자리가 필요할 거야. 베개를 추가하거나, 밤에 따뜻한 물을 준비해두시면 아내분이 정말 좋아할거야!”");

            }
        }
        else if (selectedOption === 3) {
            botMessage = await getGptResponse([{ role: "user", content: message }], systemPrompt + "컨셉 설명: 고객센터 Q&A 챗봇\n" +
                "당신은 이제 하단에 적힌 고객센터 FAQ/Q&A 리스트 에 따른 질문에 답변을 하면 됩니다. 리스트에 너무 어긋나는 질문에는 답변을 거부하십시오!\n"+
                "고객센터 FAQ/Q&A 리스트\n" +
                "1. 서비스 개요 및 회원가입\n" +
                "Q: 이 커뮤니티 서비스는 무엇을 제공하나요?\n" +
                "\n" +
                "A: 저희 커뮤니티는 임신부터 육아까지의 모든 과정을 기록하고, 관리하며, 공유할 수 있는 맞춤형 SNS 및 블로그 서비스를 제공합니다. 감정 분석, 지역 정보 공유, 실시간 채팅 등 다양한 기능을 통해 부모들이 서로 소통하고 유익한 정보를 나눌 수 있습니다.\n" +
                "Q: 회원가입은 어떻게 하나요?\n" +
                "\n" +
                "A: 메인 페이지에서 '회원가입' 버튼을 클릭한 후, 기본 정보를 입력하고 가입 절차를 완료하시면 됩니다. 소셜 미디어 계정으로도 간편하게 가입할 수 있습니다.\n" +
                "Q: 임산부/육아맘에게 맞춤형 서비스가 제공되나요?\n" +
                "\n" +
                "A: 네, 맞춤형 블로그 서비스와 감정 분석, 일정 관리 기능 등을 통해 임산부와 육아맘에게 특화된 맞춤형 지원을 제공합니다.\n" +
                "2. 블로그 및 감정 분석\n" +
                "Q: 블로그 작성 시 어떤 기능을 사용할 수 있나요?\n" +
                "\n" +
                "A: 블로그 작성 시 텍스트, 사진 업로드, 공개/비공개 설정, 감정 분석 기능을 사용할 수 있습니다. 작성한 글은 감정 차트를 통해 감정 상태를 시각적으로 파악할 수 있습니다.\n" +
                "Q: 감정 분석 기능은 어떻게 작동하나요?\n" +
                "\n" +
                "A: 블로그 작성 후 '감정 분석' 버튼을 클릭하면, AI가 글의 내용을 분석하여 감정 상태를 차트로 제공합니다. 이를 통해 감정 흐름을 이해하고, 스트레스를 관리할 수 있습니다.\n" +
                "Q: 블로그를 비공개로 작성할 수 있나요?\n" +
                "\n" +
                "A: 네, 블로그 작성 시 '공개 설정' 옵션에서 '비공개'를 선택하면 본인만 해당 글을 볼 수 있습니다.\n" +
                "3. 커뮤니티 기능\n" +
                "Q: 커뮤니티에서는 어떤 활동을 할 수 있나요?\n" +
                "\n" +
                "A: 커뮤니티에서는 다양한 주제에 대해 게시글을 작성하고, 다른 사용자와 댓글을 통해 소통할 수 있습니다. 또한, 실시간 채팅 기능을 통해 동시대의 부모들과 더욱 긴밀하게 소통할 수 있습니다.\n" +
                "Q: 지역 정보를 어떻게 공유하나요?\n" +
                "\n" +
                "A: '지역 정보' 게시판에서 동네 병원, 키즈카페, 놀이시설 등의 정보를 공유하고, 다른 부모님들과 유용한 정보를 나눌 수 있습니다. 지도 기능을 통해 주변 시설을 쉽게 찾을 수 있습니다.\n" +
                "Q: 다른 부모들과 실시간으로 대화할 수 있나요?\n" +
                "\n" +
                "A: 네, 커뮤니티의 실시간 채팅 기능을 통해 다른 부모들과 즉각적으로 대화할 수 있으며, 그룹 채팅방을 만들어 특정 주제에 대해 논의할 수도 있습니다.\n" +
                "4. 이커머스 기능\n" +
                "Q: 육아 관련 상품은 어디에서 구매할 수 있나요?\n" +
                "\n" +
                "A: 사이트 내의 이커머스 섹션에서 육아 관련 다양한 상품을 구매할 수 있습니다. 상품은 카테고리별로 나뉘어 있으며, 사용자의 리뷰를 통해 신뢰할 수 있는 정보를 얻을 수 있습니다.\n" +
                "Q: 주문한 상품의 배송 상태는 어떻게 확인하나요?\n" +
                "\n" +
                "A: '마이페이지'에서 '주문 내역'을 클릭하여 배송 상태를 확인할 수 있습니다. 각 주문에 대한 상세 정보를 제공하여 현재 배송 상태를 쉽게 확인할 수 있습니다.\n" +
                "Q: 상품 결제는 어떤 방법으로 할 수 있나요?\n" +
                "\n" +
                "A: 신용카드, 체크카드, PayPal 등 다양한 결제 방법을 지원하고 있으며, 결제 페이지에서 원하는 방법을 선택할 수 있습니다.\n" +
                "5. 캘린더 및 일정 관리\n" +
                "Q: 캘린더 기능은 어떻게 사용하나요?\n" +
                "\n" +
                "A: 캘린더 기능을 통해 임신, 출산, 육아와 관련된 주요 일정을 관리할 수 있습니다. 일정 추가, 수정, 삭제가 가능하며, 알림 설정을 통해 중요한 일정을 놓치지 않도록 할 수 있습니다.\n" +
                "Q: 임신 관련 주요 일정을 캘린더에 추가할 수 있나요?\n" +
                "\n" +
                "A: 네, 임신 기간 중의 주요 검사일, 출산 예정일, 정기 진료 일정 등을 캘린더에 추가하여 관리할 수 있으며, 이를 통해 체계적으로 임신 기간을 관리할 수 있습니다.\n" +
                "Q: 캘린더 알림 기능은 어떻게 설정하나요?\n" +
                "\n" +
                "A: 일정 추가 시 알림 설정 옵션에서 원하는 시간을 선택하여 이메일이나 푸시 알림을 받을 수 있도록 설정할 수 있습니다.\n" +
                "6. 고객 지원 및 문제 해결\n" +
                "Q: 사이트 이용 중 오류가 발생했을 때 어떻게 해결하나요?\n" +
                "\n" +
                "A: 먼저 브라우저 캐시를 삭제하거나 다른 브라우저를 사용해 보세요. 문제가 지속되면 고객센터에 문의하여 도움을 받으실 수 있습니다.\n" +
                "Q: 회원 탈퇴는 어떻게 진행하나요?\n" +
                "\n" +
                "A: '마이페이지'에서 '계정 설정'을 클릭한 후, '회원 탈퇴' 옵션을 선택하시면 탈퇴 절차를 진행할 수 있습니다. 탈퇴 시 모든 데이터는 삭제되며, 복구가 불가능합니다.\n" +
                "Q: 다른 사용자가 부적절한 게시글을 작성했을 경우 어떻게 신고하나요?\n" +
                "\n" +
                "A: 부적절한 게시글 하단의 '신고' 버튼을 클릭하여 신고할 수 있습니다. 관리자가 검토 후 적절한 조치를 취하게 됩니다.\n"+
            "마지막으로 질문과 답변이 예상보다 엇나갔거나 답변이불가능할정도면 IBreed 전화번호 : 02-0000-0000 으로 전화주십시오 라고 회피하면 됩니다..");
        }

        // AI 메시지에 이름을 포함
        $("#chat_content").append(
            '<div class="bot_message">' +
            '<span class="chat_name">'+ai_random_name+'</span>' + // AI 이름을 추가
            '<div class="message_content">' + botMessage + '</div>' +
            '</div>'
        );
        scrollToBottom();

        // 대화 내역을 저장합니다.
        saveChatData(selectedOption, message, botMessage);

        // 대화 요약을 업데이트합니다.
        const summaryResponse = await summarizeChat([{ role: "user", content: message }, { role: "assistant", content: botMessage }]);
        chatSummary = summaryResponse;
    }

    $("#option1").on("click", function() {
        selectedOption = 1;
        $("#chat_header span").text("진료과목 상담 AI");
        const userMessage = "진료과목 상담을 하겠습니다.";
        const botMessage = "진료과목 상담을 선택하셨습니다. 이제부터 궁금하신 진료과목을 물어보실 수 있습니다.";
        $("#chat_content").append('<div class="my_message"><div class="message_content">' + userMessage + '</div></div>');
        $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">' + botMessage + '</div></div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#option2").on("click", function() {
        if (!userId) return;
        selectedOption = 2;
        $("#chat_header span").text("AI 친구 : " +ai_random_name );
        const userMessage = "AI 친구와 이야기를 하겠습니다.";
        let botMessage;
        if(user_kids_select=="fetus"){
            botMessage = "임산부 이시군요. 생년월일 : " +user_birth+ ", 임신 주기"+user_fetus_old+"주 를 바탕으로" +ai_random_name+" 과 함께 즐거운 대화 되시길 바랍니다.";

        }
        else if(user_kids_select=="kids"){
            botMessage = "육아맘 이시군요. 생년월일 : " +user_birth+ ", 유아 나이"+user_fetus_old+"개월 를 바탕으로" +ai_random_name+" 과 함께 즐거운 대화 되시길 바랍니다.";

        }
        else{
            botMessage = "혹시 아내가 임신하셨거나 아기를 키우시고계신가요? 아내의 상태와 해당 주기(개월)을 적어주시면 "+ai_random_name+" 이(가) 상황에 맞는 컨셉으로 성실하게 답변 할 겁니다.";

        }

        $("#chat_content").append('<div class="my_message"><div class="message_content">' + userMessage + '</div></div>');
        $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">' + botMessage + '</div></div>');
        $("#option_buttons").hide();
        $("#chat_input").show().focus();
        $("#end_chat").show();
        scrollToBottom();

        saveChatData(selectedOption, userMessage, botMessage);
    });

    $("#option3").on("click", function() {
        selectedOption = 3;
        $("#chat_header span").text("AI 상담사 : " +ai_random_name );
        const userMessage = "사이트 사용에 문의가 있습니다.";
        let botMessage;
            botMessage = "안녕하세요 AI Q&A 를 담당하고 있는 "+ai_random_name+"입니다. 사이트 사용에 어떤 문제가 있으시나요?";
        $("#chat_content").append('<div class="my_message"><div class="message_content">' + userMessage + '</div></div>');
        $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">' + botMessage + '</div></div>');
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
                $("#chat_content").html('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">대화가 종료되었습니다.</div></div>');
                $("#chat_input").val(""); // 입력 필드 초기화
                $("#chat_input").hide(); // 입력 필드 숨기기
                $("#end_chat").hide(); // 종료 버튼 숨기기
                scrollToBottom();

                setTimeout(function() {
                    if(userId){
                        $("#chat_content").html('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">안녕하세요! 진료과목 찾기 또는 AI 친구 중 하나를 선택해주세요.</div></div>');
                    } else {
                        $("#chat_content").html('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">안녕하세요! 비회원은 증상에 따른 진료과목 찾기와 상담만 가능합니다!</div></div>');
                    }
                    $("#chat_header span").text("챗봇");
                    $("#option_buttons").show();
                    scrollToBottom();
                }, 1000);
            },
            error: function(xhr, status, error) {
                console.error("세션 데이터 삭제 중 오류 발생:", status, error);
                $("#chat_content").append('<div class="bot_message"><span class="chat_name">'+ai_random_name+'</span><div class="message_content">대화 종료 중 오류가 발생했습니다. 다시 시도해주세요.</div></div>');
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
