package com.ibreed_project.service;

import java.util.List;

import com.ibreed_project.model.Mydiary_diaryVO;

public interface IMydiary_diaryService {
	 	void saveDiary(Mydiary_diaryVO vo);
	    Mydiary_diaryVO getDiary(int diaryPostId);
	    int getDiaryIdByUserId(String userId);
	    // 일기 목록 가져오기
	    List<Mydiary_diaryVO> getDiaryListByUserId(String userId);
	    //공갸ㅐ여부
	    List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(String userId, boolean isOwner, boolean isFriend);
	 
}
