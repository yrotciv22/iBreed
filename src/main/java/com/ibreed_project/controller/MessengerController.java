package com.ibreed_project.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ibreed_project.model.MessengerVO;
import com.ibreed_project.service.IMessengerService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.time.Instant;

@Controller
@RequestMapping("/messenger")
public class MessengerController {

    @Autowired
    private IMessengerService messengerService;

    ///////////////////알림 전송용 템플릿/////////////////
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @GetMapping("")
    public String messenger(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("user_id");
        if (userId != null) {
            model.addAttribute("receivedMessages", messengerService.getReceivedMessages(userId));
        }
        return "messenger/messenger";
    }

    @GetMapping("/read")
    public String read(Model model,@RequestParam("msgId") int msgId, HttpSession session) {
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
        System.out.println("리시버 id : " + message.getReceiverId());
        Timestamp currentTimestamp = Timestamp.from(Instant.now());
        message.setMsgTimestamp(currentTimestamp);  // 메시지 객체에 현재 시간을 설정
        messengerService.insertNoitification(message.getReceiverId(), currentTimestamp);
        redirectAttributes.addFlashAttribute("message", "전송되었습니다.");

        ///////////////////알림 전송용 템플릿/////////////////
        String notificationMessage = "새로운 메시지가 도착했습니다.";
        messagingTemplate.convertAndSend("/topic/notifications/" + message.getReceiverId(), notificationMessage);

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
        String exists = messengerService.checkNicknameExists(nickname);

        try{
            if (!exists.isEmpty()) {
                System.out.println("비어있는게 아님");
            }
        }catch (NullPointerException e){
            return ResponseEntity.ok("notExists");
        }

        return ResponseEntity.ok(exists);
    }




}
