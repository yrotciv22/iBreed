package com.ibreed_project.service;

import com.ibreed_project.dao.IEmotionDAO;
import com.ibreed_project.dao.IMessengerDAO;
import com.ibreed_project.model.EmotionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class EmotionService implements IEmotionService {

    @Autowired
    private IEmotionDAO emotionDAO;

    @Override
    public EmotionVO diaryGetText(int diaryPostId, String userId) {
        return emotionDAO.diaryGetText(diaryPostId, userId);
    }

    @Override
    public void emotionSave(HashMap<String, Object> hashMap) {
        emotionDAO.emotionSave(hashMap);
    }

    @Override
    public List<EmotionVO> getDiaryEntriesByPostIdAndUserId(String userId) {
        return emotionDAO.getDiaryEntriesByPostIdAndUserId(userId);
    }

    @Override
    public EmotionVO getDiaryEntryByPostId(int postId) {
        return emotionDAO.getDiaryEntryByPostId(postId);
    }


}
