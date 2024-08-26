package com.ibreed_project.service;

import java.util.List;
import java.util.Map;

import com.ibreed_project.model.Mydiary_diaryVO;

public interface IMydiary_diaryService {
	 	void saveDiary(Mydiary_diaryVO vo);
	    Mydiary_diaryVO getDiary(int diaryPostId);
	    int getDiaryIdByUserId(String userId);
	    // 일기 목록 가져오기
	    List<Mydiary_diaryVO> getDiaryListByUserId(Map<String, Object> params);

	    // 전체 일기 개수 가져오기:페이지네이션해야해서필요허ㅏㅁ
	    int getTotalDiaryCountByUserId(String userId);
	    //공갸ㅐ여부
	    List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(String userId, boolean isOwner, boolean isFriend);
	 
	    // 일기 삭제 
	    void deleteDiary(int diaryPostId);

	    // 일기 수정 
	    void updateDiary(Mydiary_diaryVO vo);
}
