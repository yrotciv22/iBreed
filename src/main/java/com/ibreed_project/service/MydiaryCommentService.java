package com.ibreed_project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IDiaryCommentDAO;
import com.ibreed_project.model.DiaryCommentVO;
@Service
public class MydiaryCommentService implements IMydiaryCommentService {
	 
		@Autowired
		private IDiaryCommentDAO diaryCommentDAO;

		
		@Override
		public void addComment(HashMap<String, Object> map) {
			       		diaryCommentDAO.addComment(map);
			
		}
		
	    @Override
	    public List<DiaryCommentVO> getCommentsByDiaryPostId(int diaryPostId) {
	        return diaryCommentDAO.getCommentsByDiaryPostId(diaryPostId);
	    }

	    @Override
	    public void updateComment(DiaryCommentVO comment) {
	        diaryCommentDAO.updateComment(comment);
	    }

	    @Override
	    public void deleteComment(int id) {
	        diaryCommentDAO.deleteComment(id);
	    }

		@Override
		public List<DiaryCommentVO> getCommentsByPostId(int diaryPostId) {
			   // 댓글을 오래된 순서로 가져오기 위해 정렬된 결과 반환
	        return diaryCommentDAO.getCommentsByPostId(diaryPostId);
		}

		@Override
		public int getCommentCount(int diaryPostId) {
			// TODO Auto-generated method stub
			return diaryCommentDAO.getCommentCountByDiaryPostId(diaryPostId);
		}
	    
	

}