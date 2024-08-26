package com.ibreed_project.service;

import com.ibreed_project.dao.IChatbotDAO;
import com.ibreed_project.model.ChatbotVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatbotService implements  IChatbotService{

    @Autowired
    IChatbotDAO chatbotDAO;


    @Override
    public ChatbotVO getUserData(String user_id) {
        return chatbotDAO.getUserData(user_id);
    }
}
