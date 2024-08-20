package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.DiaryCommentVO;

public interface IDiaryCommentDAO {
		
		void insertComment(DiaryCommentVO comment);
	    void updateComment(DiaryCommentVO comment);
	    void deleteComment(int id);
	    ArrayList<DiaryCommentVO> getCommentsByDiaryId(int diaryPostId);

}
