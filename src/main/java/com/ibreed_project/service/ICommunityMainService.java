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
    
   //게시글상세보기 
    PostVO getPostById(int postId);
        
    //닉네임 조회
    String getAuthorNicknameByUserId(String userId);
    //프로필이미지 가져오기
	String getAuthorProfileImage(int postId);
	
	 // 게시글 수정
    void updatePost(PostVO postVO);

    // 게시글 삭제
    void deletePost(int postId);
    
    // 게시글 좋아요 여부 확인
    boolean isPostLikedByUser(int postId, String userId);
    int getLikeCount(int postId);
    // 게시글 좋아요
    void likePost(int postId, String userId);

    // 게시글 좋아요 취소
    void unlikePost(int postId, String userId);
	
	//조회수
    void increasePostViewCount(int postId);

	
	
	

    }