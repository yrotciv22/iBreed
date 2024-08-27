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
	  
	@Override
	public void saveDiary(Mydiary_diaryVO diary) {
		if (diary.getDiaryPostId() > 0) {
	        mydiary_diaryDAO.updateDiary(diary);
	    } else {
	  

	        mydiary_diaryDAO.insertDiary(diary);
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

	
	
	   // 공개여부
	   @Override
	   public List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(String diaryOwnerId, String currentUserId, int offset, int size) {
		    boolean isOwner = diaryOwnerId.equals(currentUserId);
		    boolean isFriend = friendDAO.getFriendInfo(currentUserId, diaryOwnerId) != null;

		    Map<String, Object> params = new HashMap<>();
		    params.put("userId", diaryOwnerId);
		    params.put("isOwner", isOwner);
		    params.put("isFriend", isFriend);
		    params.put("offset", offset);
		    params.put("size", size);

		    return mydiary_diaryDAO.getDiaryListByUserIdAndVisibility(params);
		}

	 @Override
	    public List<Mydiary_diaryVO> getDiaryListByUserId(Map<String, Object> params) {
	        return mydiary_diaryDAO.getDiaryListByUserId(params);
	    }

	@Override
	public int getTotalDiaryCountByUserId(String userId) {
		// TODO Auto-generated method stub
		return mydiary_diaryDAO.getTotalDiaryCountByUserId(userId);
	}

	@Override
	public void deleteDiary(int diaryPostId) {
		// TODO Auto-generated method stub
		 mydiary_diaryDAO.deleteDiary(diaryPostId);
		
	}

	@Override
	public void updateDiary(Mydiary_diaryVO vo) {
		// TODO Auto-generated method stub
		mydiary_diaryDAO.updateDiary(vo);
		
	}
}
