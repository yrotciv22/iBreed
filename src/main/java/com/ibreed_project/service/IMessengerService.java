package com.ibreed_project.service;

import java.sql.Timestamp;
import java.util.List;
import com.ibreed_project.model.MessengerVO;

public interface IMessengerService {
    void sendMessage(MessengerVO message);
    List<MessengerVO> getReceivedMessages(String receiverId);
    MessengerVO readMessage(int msgId);
    void deleteMessage(int msgId);
    String checkNicknameExists(String nickname);
    void insertNoitification(String receiverId, Timestamp msgTimestamp);
}
