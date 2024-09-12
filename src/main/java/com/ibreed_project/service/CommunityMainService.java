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

		@Override
		public void savePost(PostVO postVO) {
			// TODO Auto-generated method stub
			communityDAO.insertPost(postVO);
		}
	}