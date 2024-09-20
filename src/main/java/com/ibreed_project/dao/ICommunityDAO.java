package com.ibreed_project.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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

    //글 저장
    void insertPost(PostVO postVO);
  
    // 게시글 수정
    void updatePost(PostVO postVO);
    
    // 게시글 삭제
    void deletePost(int postId);

    // 공지사항 가져오기
    List<PostVO> selectAllNotices();

    // 페이지네이션 처리를 위한 게시글 목록 가져오기
    List<PostVO> selectPostsByBoardIdWithPagination(HashMap<String, Object> params);

    // 특정 게시판의 총 게시글 수 계산
    int countPostsByBoardId(int boardId);

    // 특정 게시글 가져오기
    PostVO selectPostById(int postId);
  
    //닉네임 조회
    String findNicknameByUserId(String userId);
 
    //유저프로필이미지 가져오기
    public String getAuthorProfileImage(int postId);

    // 좋아요 관련 메서드
   int isPostLikedByUser(@Param("userId") String userId, @Param("postId") int postId);

    void likePost(@Param("userId") String userId, @Param("postId") int postId);

    void unlikePost(@Param("userId") String userId, @Param("postId") int postId);

	void incrementPostLikeCount(@Param("postId") int postId);

	void decrementPostLikeCount(@Param("postId") int postId);
	//조회수 증가
	void increasePostViewCount(int postId);

	int getLikeCount(@Param("postId") int postId);

	List<PostVO> searchPostsByKeyword(String keyword);


    
}
