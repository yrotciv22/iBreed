package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICommunityDAO;
import com.ibreed_project.model.PostVO;

@Service
public class CommunityMainService implements ICommunityMainService {

	  @Autowired
	  private ICommunityDAO communityDAO;
	  

	    // 전체 불러오기
	    @Override
	    public List<PostVO> getPopularPosts() {
	        return new ArrayList<>(communityDAO.selectPopularPosts());
	    }

	    @Override
	    public List<PostVO> getRecentPosts() {
	        return new ArrayList<>(communityDAO.selectRecentPosts());
	    }

	    @Override
	    public List<PostVO> getPostsByBoardId(int boardId) {
	        return new ArrayList<>(communityDAO.selectPostsByBoardId(boardId));
	    }

	    // 10개 리밋
	    @Override
	    public List<PostVO> getPopularPostsWithLimit() {
	        return new ArrayList<>(communityDAO.selectPopularPostsWithLimit());
	    }

	    @Override
	    public List<PostVO> getRecentPostsWithLimit() {
	        return new ArrayList<>(communityDAO.selectRecentPostsWithLimit());
	    }

	    @Override
	    public List<PostVO> getPostsByBoardIdWithLimit(int boardId) {
	        return new ArrayList<>(communityDAO.selectPostsByBoardIdWithLimit(boardId));
	    }

		@Override
		public List<PostVO> getAllNotices() {
			// TODO Auto-generated method stub
			   return communityDAO.selectAllNotices();		}

		@Override
		public List<PostVO> getPostsByBoardIdWithPagination(int boardId, int offset, int size) {
			HashMap<String, Object> params = new HashMap<>();
		    params.put("boardId", boardId);  // 이 부분이 매퍼 XML의 #{boardId}와 일치해야 함
		    params.put("offset", offset);
		    params.put("size", size);
			return communityDAO.selectPostsByBoardIdWithPagination(params);
		}

		@Override
		public int getTotalPages(int boardId, int size) {
			 // 전체 게시글 수 가져오기
		    int totalPosts = communityDAO.countPostsByBoardId(boardId);
		    // 페이지 수 계산 (총 게시글 수 / 페이지당 게시글 수)
		    return (int) Math.ceil((double) totalPosts / size);
		}
		//게시글저장
		@Override
		public void savePost(PostVO postVO) {
			// TODO Auto-generated method stub
			communityDAO.insertPost(postVO);
		}
		//게시글상세보기
		@Override
		public PostVO getPostById(int postId) {
			// TODO Auto-generated method stub
			 return communityDAO.selectPostById(postId);
		}
		//닉네임 조회
		@Override
		public String getAuthorNicknameByUserId(String userId) {
			// TODO Auto-generated method stub
			return communityDAO.findNicknameByUserId(userId);
		}
		@Override
		public String getAuthorProfileImage(int postId) {
		    return communityDAO.getAuthorProfileImage(postId);
		}

		@Override
		public void updatePost(PostVO postVO) {
		    communityDAO.updatePost(postVO);
			
		}

		@Override
		public void deletePost(int postId) {
			  communityDAO.deletePost(postId);
			
		}
		//좋아요 수 
		@Override
		public boolean isPostLikedByUser(int postId, String userId) {
			 return communityDAO.isPostLikedByUser(userId, postId)>0;
		}

		@Override
		public void likePost(int postId, String userId) {
			 // DAO를 통해 좋아요 추가
		    communityDAO.likePost(userId, postId);
		    // 좋아요 수 증가 처리
		    communityDAO.incrementPostLikeCount(postId);
		}

		@Override
		public void unlikePost(int postId, String userId) {
			  // DAO를 통해 좋아요 취소
		    communityDAO.unlikePost(userId, postId);
		    // 좋아요 수 감소 처리
		    communityDAO.decrementPostLikeCount(postId);
			
		}
		//조회수
		public void increasePostViewCount(int postId) {
			// TODO Auto-generated method stub
			communityDAO.increasePostViewCount(postId);
		}

		public int getLikeCount(int postId) {
			// TODO Auto-generated method stub
			  return communityDAO.getLikeCount(postId);
		}

		public List<PostVO> searchPostsByKeyword(String keyword) {
			// TODO Auto-generated method stub
		    return communityDAO.searchPostsByKeyword(keyword);
		}

	}