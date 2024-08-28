package com.ibreed_project.dao;

import com.ibreed_project.model.NotificationVO;

import java.util.List;

public interface INotificationDAO {
    List<NotificationVO> getNotifications(String userId);
}
