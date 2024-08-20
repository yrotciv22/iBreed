package com.ibreed_project.service;

import com.ibreed_project.model.Mydiary_diaryVO;

public interface IMydiary_diaryService {
	 	void saveDiary(Mydiary_diaryVO diary);
	    Mydiary_diaryVO getDiary(int diaryPostId);
	    int getDiaryIdByUserId(String userId);
	 
}
