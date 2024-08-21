package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ibreed_project.model.MessengerVO;
import com.ibreed_project.service.IMessengerService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/messenger")
public class MessengerController {

    @Autowired
    private IMessengerService messengerService;

    @GetMapping("")
    public String messenger(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("user_id");
        if (userId != null) {
            model.addAttribute("receivedMessages", messengerService.getReceivedMessages(userId));
        }
        return "messenger/messenger";
    }

    @GetMapping("/read")
    public String read(Model model, int msgId, HttpSession session) {
        String userId = (String) session.getAttribute("user_id");
        if (userId != null) {
            model.addAttribute("message", messengerService.readMessage(msgId));
        }
        return "messenger/read";
    }

    @GetMapping("/send")
    public String send() {
        return "messenger/send";
    }

    @PostMapping("/send")
    public String sendMessage(MessengerVO message, HttpSession session, RedirectAttributes redirectAttributes) {
        String senderId = (String) session.getAttribute("user_id");
        message.setSenderId(senderId);
        messengerService.sendMessage(message);
        redirectAttributes.addFlashAttribute("message", "전송되었습니다.");
        return "redirect:/messenger";
    }


    @PostMapping("/deleteMessage")
    public String deleteMessage(@RequestParam("msgId") int msgId, RedirectAttributes redirectAttributes) {
        messengerService.deleteMessage(msgId);
        redirectAttributes.addFlashAttribute("message", "쪽지가 성공적으로 삭제되었습니다.");
        return "redirect:/messenger";
    }

    // 닉네임 확인 메서드 추가
    @GetMapping("/checkNickname")
    @ResponseBody
    public ResponseEntity<String> checkNickname(@RequestParam("nickname") String nickname) {
        boolean exists = messengerService.checkNicknameExists(nickname);
        if (exists) {
            return ResponseEntity.ok("닉네임이 존재합니다.");
        } else {
            return ResponseEntity.ok("존재하지 않는 닉네임입니다.");
        }
    }




}
