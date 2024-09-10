package com.ibreed_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ibreed_project.model.DiaryCommentVO;
@Mapper
public interface IDiaryCommentDAO {
		//댓글추가
		void addComment(HashMap<String, Object> map);
	    
	    // 특정 게시글의 댓글 조회
	    List<DiaryCommentVO> getCommentsByDiaryPostId(@Param("diaryPostId") int diaryPostId);

	    // 댓글 수정
	    void updateComment(DiaryCommentVO comment);

	    // 댓글 삭제
	    void deleteComment(@Param("id") int id);

	    //댓글 정렬
	    List<DiaryCommentVO> getCommentsByPostId(@Param("diaryPostId") int diaryPostId);
	    //댓글 수
	    int getCommentCountByDiaryPostId(int diaryPostId);


}
