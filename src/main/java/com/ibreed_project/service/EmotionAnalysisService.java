package com.ibreed_project.service;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.natural_language_understanding.v1.NaturalLanguageUnderstanding;
import com.ibm.watson.natural_language_understanding.v1.model.AnalysisResults;
import com.ibm.watson.natural_language_understanding.v1.model.AnalyzeOptions;
import com.ibm.watson.natural_language_understanding.v1.model.EmotionOptions;
import com.ibm.watson.natural_language_understanding.v1.model.Features;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Service
public class EmotionAnalysisService {

    private final NaturalLanguageUnderstanding naturalLanguageUnderstanding;
    private final OkHttpClient httpClient;

    public EmotionAnalysisService(@Value("${ibm.watson.api_key}") String apiKey,
                                  @Value("${ibm.watson.url}") String url) {
        IamAuthenticator authenticator = new IamAuthenticator(apiKey);
        naturalLanguageUnderstanding = new NaturalLanguageUnderstanding("2021-08-01", authenticator);
        naturalLanguageUnderstanding.setServiceUrl(url);
        this.httpClient = new OkHttpClient();
    }

    public String translateText(String text, String targetLang) throws IOException {
        String encodedText = URLEncoder.encode(text, StandardCharsets.UTF_8.toString());
        String apiUrl = String.format("https://api.mymemory.translated.net/get?q=%s&langpair=ko|%s", encodedText, targetLang);
        System.out.println("번역 url : " + apiUrl);
        Request request = new Request.Builder()
                .url(apiUrl)
                .get()
                .build();

        try (Response response = httpClient.newCall(request).execute()) {
            if (response.isSuccessful()) {
                String jsonResponse = response.body().string();
                JSONObject jsonObject = new JSONObject(jsonResponse);
                String translatedText = jsonObject.getJSONObject("responseData").getString("translatedText");
                System.out.println("Translated Text: " + translatedText); // 번역된 텍스트 출력
                return translatedText;
            } else {
                throw new IOException("Failed to translate text");
            }
        }
    }

    public AnalysisResults analyzeEmotion(String text) throws IOException {
        String translatedText = translateText(text, "en");

        EmotionOptions emotion = new EmotionOptions.Builder().build();
        Features features = new Features.Builder().emotion(emotion).build();
        AnalyzeOptions analyzeOptions = new AnalyzeOptions.Builder()
                .text(translatedText)
                .features(features)
                .language("en")
                .build();

        return naturalLanguageUnderstanding.analyze(analyzeOptions).execute().getResult();
    }
}
