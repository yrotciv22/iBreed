package com.ibreed_project.service;

import com.ibreed_project.model.NotificationVO;

import java.util.List;

public interface INotificationService {
    List<NotificationVO> getNotifications(String userId);
    void deleteAllNotification(String userId);
}
