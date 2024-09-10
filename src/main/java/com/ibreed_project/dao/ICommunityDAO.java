package com.ibreed_project.dao;

import java.util.HashMap;
import java.util.List;

import com.ibreed_project.model.PostVO;

public interface ICommunityDAO {
	  // 인기 게시글 가져오기
    List<PostVO> selectPopularPosts();

    // 최근 게시글 가져오기
    List<PostVO> selectRecentPosts();

    // 특정 게시판의 게시글 가져오기
    List<PostVO> selectPostsByBoardId(int boardId);

    // 인기 게시글 10개 리밋으로 가져오기
    List<PostVO> selectPopularPostsWithLimit();

    // 최근 게시글 10개 리밋으로 가져오기
    List<PostVO> selectRecentPostsWithLimit();

    // 특정 게시판의 게시글 10개 리밋으로 가져오기
    List<PostVO> selectPostsByBoardIdWithLimit(int boardId);

    // 공지사항 가져오기
    List<PostVO> selectAllNotices();

    // 페이지네이션 처리를 위한 게시글 목록 가져오기
    List<PostVO> selectPostsByBoardIdWithPagination(HashMap<String, Object> params);

    // 특정 게시판의 총 게시글 수 계산
    int countPostsByBoardId(int boardId);
    //글 저장
    void insertPost(PostVO postVO);
}
