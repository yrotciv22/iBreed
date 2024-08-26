package com.ibreed_project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ChatbotController {

    @PostMapping("/saveChatData")
    public ResponseEntity<Void> saveChatData(@RequestParam("option") int option,
                                             @RequestParam("userMessage") String userMessage,
                                             @RequestParam("botMessage") String botMessage,
                                             HttpSession session) {
        System.out.println("챗봇 컨트롤러 진입 성공");
        // 세션에서 대화 리스트를 가져옴, 없으면 새로 생성
        List<String> chatHistory = (List<String>) session.getAttribute("chatHistory");
        if (chatHistory == null) {
            chatHistory = new ArrayList<>();
        }

        // 대화 내용을 리스트에 추가
        chatHistory.add("사용자: " + userMessage);
        chatHistory.add("챗봇: " + botMessage);

        // 세션에 리스트 저장
        session.setAttribute("chatHistory", chatHistory);

        // 200 OK 응답 반환
        return ResponseEntity.ok().build();
    }

    @PostMapping("/clearChatbotSession")
    public void clearChatbotSession(HttpSession session) {
        session.removeAttribute("selectedOption");
        session.removeAttribute("chatHistory");
        System.out.println("챗봇 세션 데이터가 삭제되었습니다.");
    }
}