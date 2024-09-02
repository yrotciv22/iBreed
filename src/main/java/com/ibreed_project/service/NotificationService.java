package com.ibreed_project.service;

import com.ibreed_project.dao.INotificationDAO;
import com.ibreed_project.model.NotificationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationService implements INotificationService {

    @Autowired
    private INotificationDAO notificationDAO;

    @Override
    public List<NotificationVO> getNotifications(String userId) {
        return notificationDAO.getNotifications(userId);
    }

    @Override
    public void deleteAllNotification(String userId) {
        notificationDAO.deleteAllNotification(userId);
    }

    @Override
    public void deleteNotification(String userId, String notiId) {
        notificationDAO.deleteNotification(userId, notiId);

    }
}


