package com.ibreed_project.controller;

import com.ibreed_project.model.ChatbotVO;
import com.ibreed_project.service.ChatbotService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChatbotController {

    @PostMapping("/saveChatData")
    public ResponseEntity<Void> saveChatData(@RequestParam("option") int option,
                                             @RequestParam("userMessage") String userMessage,
                                             @RequestParam("botMessage") String botMessage,
                                             @RequestParam(value = "chatSummary", required = false) String chatSummary,
                                             HttpSession session) {
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

        // 요약된 내용을 세션에 저장
        if (chatSummary != null) {
            session.setAttribute("chatSummary", chatSummary);
        }

        // 200 OK 응답 반환
        return ResponseEntity.ok().build();
    }

    @PostMapping("/clearChatbotSession")
    public ResponseEntity<Void> clearChatbotSession(HttpSession session) {
        if (session != null) {
            session.removeAttribute("selectedOption");
            session.removeAttribute("chatHistory");
            session.removeAttribute("chatSummary"); // 요약 내용 제거
        }
        return ResponseEntity.ok().build();
    }

    @PostMapping("/getChatData")
    public ResponseEntity<Map<String, Object>> getChatData(HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        List<String> chatHistory = (List<String>) session.getAttribute("chatHistory");
        Integer selectedOption = (Integer) session.getAttribute("selectedOption");
        String chatSummary = (String) session.getAttribute("chatSummary");

        if (chatHistory == null) {
            chatHistory = new ArrayList<>();
        }

        response.put("chatHistory", chatHistory);
        response.put("selectedOption", selectedOption);
        response.put("chatSummary", chatSummary); // 요약 내용 추가

        return ResponseEntity.ok(response);
    }

    @PostMapping("/saveSelectedOption")
    public ResponseEntity<Void> saveSelectedOption(@RequestParam("selectedOption") int selectedOption, HttpSession session) {
        session.setAttribute("selectedOption", selectedOption);
        return ResponseEntity.ok().build();
    }

    @Autowired
    ChatbotService chatbotService;


    @PostMapping("/getUserData")
    public ResponseEntity<Map<String, Object>> getUserData(HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        if(session.getAttribute("user_id") == null){
            response.put("user_birth", null);
            response.put("user_nickname", null);
            response.put("user_kids_select", null);
            response.put("user_fetus_old", null);
            response.put("user_kids_old", null);
        }
        else{
            System.out.println("user id 값 : " + session.getAttribute("user_id"));

            ChatbotVO vo = chatbotService.getUserData((String) session.getAttribute("user_id"));

            System.out.println(vo.getUser_birth());
            System.out.println(vo.getUser_fetus_old());
            System.out.println(vo.getUser_kids_old());
            System.out.println(vo.getUser_nickname());
            System.out.println(vo.getUser_kids_select());

            response.put("user_birth", vo.getUser_birth());
            response.put("user_nickname", vo.getUser_nickname());
            response.put("user_kids_select", vo.getUser_kids_select());
            response.put("user_fetus_old", vo.getUser_fetus_old());
            response.put("user_kids_old", vo.getUser_kids_old());


        }


        return ResponseEntity.ok(response);
    }


}
