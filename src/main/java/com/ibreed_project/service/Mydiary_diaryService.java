package com.ibreed_project.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IFriendDAO;
import com.ibreed_project.dao.IMydiary_diaryDAO;
import com.ibreed_project.model.Mydiary_diaryVO;


@Service
public class Mydiary_diaryService implements IMydiary_diaryService {
	
	@Autowired
	    private IMydiary_diaryDAO mydiary_diaryDAO;
    @Autowired
    	private IFriendDAO friendDAO;
	  
    //일기작성후저장
	@Override
	public void saveDiary(Mydiary_diaryVO diary) {
		if (diary.getDiaryPostId() > 0) {
	        mydiary_diaryDAO.updateDiary(diary);
	    } else {
	  

	        mydiary_diaryDAO.insertDiary(diary);
	    }
	}
	//일기포스트번호로 
	@Override
	public Mydiary_diaryVO getDiary(int diaryPostId) {
		 return mydiary_diaryDAO.getDiaryById(diaryPostId);
	}
		//일기유저아이디조회로 
	   @Override
	   public int getDiaryIdByUserId(String userId) {
		    return mydiary_diaryDAO.findDiaryIdByUserId(userId);
		}

	
	
	   @Override
	   public List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(HashMap<String, Object> params ) {
	       System.out.println("getDiaryListByUserIdAndVisibility 메서드 진입");


	       // 최종적으로 전달되는 파라미터를 확인하는 로그 추가
	       System.out.println("파라미터 맵: " + params.get("diary_id"));

	       // DAO 호출
	       //return mydiary_diaryDAO.getDiaryListByUserIdAndVisibility(params);
	       return mydiary_diaryDAO.getDiaryListByUserIdAndVisibility(params);
	   }
	   //일기리스트
	 @Override
	    public List<Mydiary_diaryVO> getDiaryListByUserId(Map<String, Object> params) {
	    	
	        return mydiary_diaryDAO.getDiaryListByUserId(params);
	    }
	    //일기총갯수(페이지네이션)
	@Override
	public int getTotalDiaryCountByUserId(String userId) {
		// TODO Auto-generated method stub
		return mydiary_diaryDAO.getTotalDiaryCountByUserId(userId);
	}
	//삭제
	@Override
	public void deleteDiary(int diaryPostId) {
		// TODO Auto-generated method stub
		 mydiary_diaryDAO.deleteDiary(diaryPostId);
		
	}
	//수정
	@Override
	public void updateDiary(Mydiary_diaryVO vo) {
		// TODO Auto-generated method stub
		mydiary_diaryDAO.updateDiary(vo);
		
	}
	//조회수 
	@Override
	public void incrementViewCount(int diaryPostId) {
		// TODO Auto-generated method stub
	    mydiary_diaryDAO.incrementViewCount(diaryPostId);
	}
	
	//likes
	@Override
	public void likePost(String userId, int diaryPostId) {
		mydiary_diaryDAO.likePost(userId, diaryPostId);
		mydiary_diaryDAO.incrementLikeCount(diaryPostId);		
	}
	@Override
	public void unlikePost(String userId, int diaryPostId) {
		mydiary_diaryDAO.unlikePost(userId, diaryPostId);
		mydiary_diaryDAO.decrementLikeCount(diaryPostId);		
	}
	@Override
	public boolean isAlreadyLiked(String userId, int diaryPostId) {
		   return mydiary_diaryDAO.isAlreadyLiked(userId, diaryPostId);
	}
	@Override
	public int getLikeCount(int diaryPostId) {
		return mydiary_diaryDAO.getLikeCount(diaryPostId);
	}
	

	

}
