package com.ibreed_project.service;

import java.util.List;

import com.ibreed_project.model.PostVO;

public interface ICommunityMainService {
 
	// 인기 게시글 가져오기
    List<PostVO> getPopularPosts();

    // 최근 게시글 가져오기
    List<PostVO> getRecentPosts();

    // 특정 게시판의 게시글 가져오기
    List<PostVO> getPostsByBoardId(int boardId);

    // 인기 게시글 10개 리밋으로 가져오기
    List<PostVO> getPopularPostsWithLimit();

    // 최근 게시글 10개 리밋으로 가져오기
    List<PostVO> getRecentPostsWithLimit();

    // 특정 게시판의 게시글을 10개 리밋으로 가져오기
    List<PostVO> getPostsByBoardIdWithLimit(int boardId);

    // 공지사항을 가져오는 메서드
    List<PostVO> getAllNotices();

    // 특정 게시판의 게시글을 페이지네이션으로 가져오기
    List<PostVO> getPostsByBoardIdWithPagination(int boardId, int offset, int size);

    // 전체 페이지 수 계산 메서드
    int getTotalPages(int boardId, int size);
    void savePost(PostVO postVO);
        
    }