package com.ibreed_project.dao;

import java.util.List;

import com.ibreed_project.model.CommentVO;

public interface ICommentDAO {
	// 댓글 추가
    void insertComment(CommentVO commentVO);

    // 특정 게시글의 댓글 목록 가져오기
    List<CommentVO> selectCommentsByPostId(int postId);

    // 댓글 수정
    void updateComment(CommentVO commentVO);

    // 댓글 삭제
    void deleteComment(int commentId);

}
