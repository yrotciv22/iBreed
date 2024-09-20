package com.ibreed_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ibreed_project.model.CommentVO;
@Mapper
public interface ICommentDAO {
	// 댓글 추가
    void addComment(HashMap<String,Object> map);

    // 특정 게시글의 댓글 목록 가져오기
    List<CommentVO> selectCommentsByPostId(int postId);

    // 댓글 수정
    void updateComment(CommentVO commentVO);

    // 댓글 삭제
    void deleteComment(@Param("commentId") int commentId);
    //댓글 수
    int getCommentCountByPostId(int postId);

}
