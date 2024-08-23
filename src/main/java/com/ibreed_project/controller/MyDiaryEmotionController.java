package com.ibreed_project.controller;

import com.ibm.watson.natural_language_understanding.v1.model.EmotionScores;
import com.ibreed_project.model.EmotionVO;
import com.ibreed_project.service.EmotionAnalysisService;
import com.ibm.watson.natural_language_understanding.v1.model.AnalysisResults;
import com.ibreed_project.service.IEmotionService;
import com.ibreed_project.service.IMessengerService;
import okhttp3.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Controller
public class MyDiaryEmotionController {

    @Autowired
    private IEmotionService emotionService;

    @Autowired
    private EmotionAnalysisService emotionAnalysisService;

    @RequestMapping("/diary/emotialresult")
    public String resultEmotial(
            @RequestParam("diaryPostId") int diaryPostId,
            @RequestParam("user_id") String userId,
            Model model) {

        System.out.println("Diary Post ID: " + diaryPostId);
        System.out.println("user_id : " + userId);

        EmotionVO Vo = emotionService.diaryGetText(diaryPostId, userId);

        System.out.println("id 값 가져왔습니다 : " +Vo.getDiary_id());
        System.out.println("콘텐트 값 가져왔습니다 : " +Vo.getDiary_content());
        System.out.println("타이틀 값 가져왔습니다 : " +Vo.getDiary_title());
        System.out.println("생성 날짜 가져왔습니다 : " +Vo.getDiary_create());

        try {
            String text = Vo.getDiary_content(); // 분석할 텍스트를 여기에 추가
            AnalysisResults analysisResults = emotionAnalysisService.analyzeEmotion(text);

            double joy = 0;
            double sadness= 0;
            double anger= 0;
            double disgust= 0;
            double fear = 0;
            String gptResponse = null;


            // 감정 분석 결과 가져오기
            if (analysisResults.getEmotion() != null) {
                EmotionScores emotionScores = analysisResults.getEmotion().getDocument().getEmotion();
                joy = emotionScores.getJoy();
                sadness = emotionScores.getSadness();
                anger = emotionScores.getAnger();
                disgust = emotionScores.getDisgust();
                fear = emotionScores.getFear();

                // 감정 결과를 ChatGPT에게 전송하여 조언을 받기
                gptResponse = getAdviceFromChatGPT(joy, sadness, anger, disgust, fear);
                System.out.println("ChatGPT의 응답: " + gptResponse);

                model.addAttribute("gptResponse", gptResponse);
            } else {
                System.out.println("감정 분석 결과가 없습니다.");
                model.addAttribute("gptResponse", "감정 분석 결과가 없습니다.");
            }

            ///////////////////////////////////////////////////////////////////////////////////////
            //데이터베이스에 값 저장하기
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("diary_id", diaryPostId);
            hashMap.put("sentiment_subject", Vo.getDiary_title());
            hashMap.put("sentiment_content", Vo.getDiary_content());
            hashMap.put("sentiment_fear", fear);
            hashMap.put("sentiment_joy", joy);
            hashMap.put("sentiment_sorrow", sadness);
            hashMap.put("sentiment_disgusting", disgust);
            hashMap.put("sentiment_angry", anger);
            hashMap.put("sentiment_result", gptResponse);


            emotionService.emotionSave(hashMap);


            ///////////////////////////////////////////////////////////////////////////////////////

            model.addAttribute("diaryPostId", diaryPostId);
            model.addAttribute("inputText", text);
            model.addAttribute("analysisResults", analysisResults);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "감정 분석 중 오류가 발생했습니다.");
        }


        return "diary/mydiary_emotion";
    }

    private String getAdviceFromChatGPT(double joy, double sadness, double anger, double disgust, double fear) throws IOException {
        // ChatGPT API 엔드포인트
        String apiUrl = "https://api.openai.com/v1/chat/completions";
        String apiKey = "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"; // OpenAI API 키를 여기에 추가

        // 요청 본문 생성
        String prompt = String.format("주어진 감정 수치에 따라 다음과 같은 조언을 제공해주세요: Joy: %.2f, Sadness: %.2f, Anger: %.2f, Disgust: %.2f, Fear: %.2f. 각 감정의 수치를 바탕으로 현재 상황을 이해하고, 더 나은 선택이나 행동을 할 수 있도록 구체적이고 실질적인 조언을 해주세요.",
                joy, sadness, anger, disgust, fear);

        // JSON 요청 본문 설정
        String requestBody = String.format(
                "{\"model\": \"gpt-4\", \"messages\": [{\"role\": \"system\", \"content\": \"당신은 한국어로 대답하는 도움이 되는 비서입니다.\"}, {\"role\": \"user\", \"content\": \"%s\"}], \"max_tokens\": 2000}",
                prompt);

        // OKHttp 클라이언트 생성
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(60, TimeUnit.SECONDS)  // 연결 타임아웃
                .writeTimeout(60, TimeUnit.SECONDS)    // 쓰기 타임아웃
                .readTimeout(60, TimeUnit.SECONDS)     // 읽기 타임아웃
                .build();

        // 요청 객체 생성
        Request request = new Request.Builder()
                .url(apiUrl)
                .post(RequestBody.create(requestBody, MediaType.get("application/json")))
                .addHeader("Authorization", "Bearer " + apiKey)
                .build();

        // 요청 실행 및 응답 받기
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            // 응답 본문을 문자열로 변환
            String responseBody = response.body().string();

            // JSON 파싱하여 content 값 추출
            JSONObject jsonResponse = new JSONObject(responseBody);
            String content = jsonResponse.getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");

            // content 값 출력
            System.out.println("ChatGPT의 응답 내용: " + content);

            return content;
        }
    }


    @RequestMapping("diary/mydiary_emotion_result")
    public String emotionResult(
            @RequestParam("user_id") String userId,
            Model model) {

        // userId에 해당하는 감정 데이터를 가져옴
        List<EmotionVO> emotionList = emotionService.getDiaryEntriesByPostIdAndUserId(userId);

        // 로그 출력 (디버깅 용도로 사용)
        for (EmotionVO emotion : emotionList) {
            System.out.println("create: " + emotion.getDiary_create());
            System.out.println("title : " + emotion.getDiary_title());
            System.out.println("postId : " + emotion.getDiary_post_id());
        }

        // emotionList를 모델에 추가하여 JSP로 전달
        model.addAttribute("emotionList", emotionList);

        // diary/mydiary_emotion.jsp로 이동
        return "diary/mydiary_emotion";
    }


    @RequestMapping("/diary/detail")
    public String diaryDetail(@RequestParam("post_id") int postId, Model model) {
        // postId를 이용해 상세 정보를 가져옴
        EmotionVO emotion = emotionService.getDiaryEntryByPostId(postId);

        System.out.println(emotion.getSentiment_result());
        System.out.println(emotion.getSentiment_angry());
        System.out.println(emotion.getSentiment_disgusting());
        System.out.println(emotion.getSentiment_fear());
        System.out.println(emotion.getSentiment_joy());
        System.out.println(emotion.getSentiment_sorrow());


        // emotion 객체를 모델에 추가
        model.addAttribute("emotion", emotion);

        // 상세 페이지로 이동
        return "diary/diaryEmotiondetail";
    }


}