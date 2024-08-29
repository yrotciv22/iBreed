package com.ibreed_project.controller;

import com.ibreed_project.model.NotificationVO;
import com.ibreed_project.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NotificationController {

    @Autowired
    NotificationService notificationService;

    @PostMapping("/notification")
    public ResponseEntity<List<Map<String, Object>>> notification(@RequestParam("user_id") String user_id) {
        List<NotificationVO> notifications = notificationService.getNotifications(user_id);
        List<Map<String, Object>> responseList = new ArrayList<>();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (NotificationVO notification : notifications) {
            Map<String, Object> notificationData = new HashMap<>();
            String message = "";

            if (notification.isNotice_shop()) {
                message = "샵에서 알림이 도착하였습니다.";
            } else if (notification.isNotice_calender()) {
                message = "캘린더에서 알림이 도착하였습니다.";
            } else if (notification.isNotice_message()) {
                message = "메세지가 도착하였습니다.";
            } else if (notification.isNotice_diary()) {
                message = "다이어리에서 알림이 도착하였습니다.";
            }

            if (!message.isEmpty()) {
                notificationData.put("message", message);
                notificationData.put("timestamp", formatter.format(notification.getNoti_time()));
                notificationData.put("noti_id", notification.getNoti_id());
                responseList.add(notificationData);
            }
        }

        return ResponseEntity.ok(responseList);
    }






    @PostMapping("/notificationAllDelete")
    public ResponseEntity<Integer> notificationAllDelete(@RequestParam("user_id") String user_id) {
        try{
            notificationService.deleteAllNotification(user_id);
        }catch (NullPointerException e){
            return ResponseEntity.ok(100); //이미 삭제되었을때
        }

        return ResponseEntity.ok(200); //삭제 완료
    }




    @MessageMapping("/notify")
    @SendTo("/topic/notifications")
    public String sendNotification(String message) {
        return message;
    }
}
