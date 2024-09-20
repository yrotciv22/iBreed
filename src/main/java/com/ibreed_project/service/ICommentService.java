package com.ibreed_project.service;

import java.util.HashMap;
import java.util.List;

import com.ibreed_project.model.CommentVO;

public interface ICommentService {
	// 댓글 저장
    void addComment(HashMap<String, Object> map);

    // 특정 게시글의 댓글 가져오기
    List<CommentVO> selectCommentsByPostId(int postId);

    // 댓글 수정
    void updateComment(CommentVO commentVO);

    // 댓글 삭제
    void deleteComment(int commentId);
    //댓글 수
    int getCommentCountByPostId(int postId);

}
