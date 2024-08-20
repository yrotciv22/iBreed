package com.ibreed_project.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IMydiary_diaryDAO;
import com.ibreed_project.model.Mydiary_diaryVO;
@Service
public class Mydiary_diaryService implements IMydiary_diaryService {
	 @Autowired
	    private IMydiary_diaryDAO mydiary_diaryDAO;

	@Override
	public void saveDiary(Mydiary_diaryVO diary) {
		 if (diary.getDiaryPostId() == 0) {
	            mydiary_diaryDAO.insertDiary(diary);
	        } else {
	            mydiary_diaryDAO.updateDiary(diary);
	        }
	}

	@Override
	public Mydiary_diaryVO getDiary(int diaryPostId) {
		 return mydiary_diaryDAO.getDiaryById(diaryPostId);
	}
	   @Override
	   public int getDiaryIdByUserId(String userId) {
		    return mydiary_diaryDAO.findDiaryIdByUserId(userId);
		}
}
