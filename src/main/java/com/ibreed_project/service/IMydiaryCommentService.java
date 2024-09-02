package com.ibreed_project.service;

import java.util.HashMap;
import java.util.List;

import com.ibreed_project.model.DiaryCommentVO;

public interface IMydiaryCommentService {
	 // 댓글 추가
    void addComment(HashMap<String, Object> map) ;

    // 특정 게시글의 댓글 조회
    List<DiaryCommentVO> getCommentsByDiaryPostId(int diaryPostId);

    // 댓글 수정
    void updateComment(DiaryCommentVO comment);

    // 댓글 삭제
    void deleteComment(int id);

}
