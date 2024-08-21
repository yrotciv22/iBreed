package com.ibreed_project.dao;

import java.util.List;
import com.ibreed_project.model.MessengerVO;

public interface IMessengerDAO {
    void insertMessage(MessengerVO message);
    List<MessengerVO> getReceivedMessages(String receiverId);
    MessengerVO getMessageById(int msgId);
    void deleteMessage(int msgId);
    void markAsRead(int msgId);
    // 닉네임 확인 메서드
    int countByNickname(String nickname);

}
