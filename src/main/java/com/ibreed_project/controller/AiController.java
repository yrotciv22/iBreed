package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AiController {

    @Value("${openai.api.key}")
    private String openAiKey;

    @GetMapping("/api/getOpenAiKey")
    public String getOpenAiKey() {
        return openAiKey;
    }
}