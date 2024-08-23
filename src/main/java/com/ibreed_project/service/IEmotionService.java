package com.ibreed_project.service;

import com.ibreed_project.model.EmotionVO;

import java.util.HashMap;
import java.util.List;

public interface IEmotionService {
    EmotionVO diaryGetText(int diaryPostId, String userId);

    void emotionSave(HashMap<String, Object> hashMap);

    List<EmotionVO> getDiaryEntriesByPostIdAndUserId(String userId);

    EmotionVO getDiaryEntryByPostId(int postId);
}
