package com.ibreed_project.controller;

import com.ibreed_project.service.EmotionAnalysisService;
import com.ibm.watson.natural_language_understanding.v1.model.AnalysisResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.net.URISyntaxException;

@Controller
public class diaryController {

    @Autowired
    private EmotionAnalysisService emotionAnalysisService; // 인스턴스 변수


    @RequestMapping("/diary/emotialInput")
    public String emotialinput() {
        return "diary/emotial/emotialInput";
    }

    @RequestMapping("/diary/emotialresult")
    public String resultEmotial(@RequestParam("inputText") String text, Model model) {
        System.out.println("제대로 진입은 하였으나..");
        System.out.println(text);

        try {
            // 감정 분석
            AnalysisResults analysisResults = emotionAnalysisService.analyzeEmotion(text);
            model.addAttribute("inputText", text);
            model.addAttribute("analysisResults", analysisResults);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "감정 분석 중 오류가 발생했습니다.");
        }

        return "diary/emotial/emotialResult";
    }
}
