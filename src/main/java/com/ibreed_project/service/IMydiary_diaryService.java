package com.ibreed_project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibreed_project.model.Mydiary_diaryVO;

public interface IMydiary_diaryService {
	 	//일기저장하기
		void saveDiary(Mydiary_diaryVO vo);
	    //다이어리포스트아이디로 다이어리불러오기(상세보기)
	 	Mydiary_diaryVO getDiary(int diaryPostId);
	   //유저아이디로 다이어리아이디 조회하기
	    int getDiaryIdByUserId(String userId);
	   
	    // 일기 목록 가져오기
	    List<Mydiary_diaryVO> getDiaryListByUserId(Map<String, Object> params);

	    // 전체 일기 개수 가져오기:페이지네이션해야해서필요허ㅏㅁ
	    int getTotalDiaryCountByUserId(String userId);
	    
	    //공개여부+일기목록가져오기
	    List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(HashMap<String, Object> params );
	 
	    // 일기 삭제 
	    void deleteDiary(int diaryPostId);

	    // 일기 수정 
	    void updateDiary(Mydiary_diaryVO vo);
	 
	    //다이어리 조회수증가
  		public void incrementViewCount(int diaryPostId);
	
	 		//좋아요했는지안했는지
		boolean checkIfLiked(String userId, int diaryPostId);
  
		//좋아요 수 증가
		 void incrementLike(int diaryPostId, String userId);
  
		 //좋아요수 감소

		 void decrementLike(int diaryPostId, String userId);

		 //좋아요 수 받아옥;
  		 int getLikeCount(int diaryPostId);

 	    // 다이어리 작성 수 조회
 	    public int getDiaryCount(String userId);
		
}
