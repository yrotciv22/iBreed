package com.ibreed_project.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IMessengerDAO;
import com.ibreed_project.model.MessengerVO;

@Service
public class MessengerService implements IMessengerService {

    @Autowired
    private IMessengerDAO messengerDAO;

    @Override
    public void sendMessage(MessengerVO message) {
        messengerDAO.insertMessage(message);
    }

    @Override
    public List<MessengerVO> getReceivedMessages(String receiverId) {
        return messengerDAO.getReceivedMessages(receiverId);
    }

    @Override
    public MessengerVO readMessage(int msgId) {
        messengerDAO.markAsRead(msgId);
        return messengerDAO.getMessageById(msgId);
    }

    @Override
    public void deleteMessage(int msgId) {
        messengerDAO.deleteMessage(msgId);
    }

    // 닉네임 확인 메서드 구현
    @Override
    public String checkNicknameExists(String nickname) {
        return messengerDAO.countByNickname(nickname);
    }

    @Override
    public void insertNoitification(String receiverId, Timestamp msgTimestamp) {
        System.out.println("reciverId: " + receiverId);
        messengerDAO.insertNoitification(receiverId, msgTimestamp);
    }
}
