package com.ibreed_project.service;

import java.util.ArrayList;

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
	    public ArrayList<PostVO> getPopularPosts() {
	        return new ArrayList<>(communityDAO.selectPopularPosts());
	    }

	    @Override
	    public ArrayList<PostVO> getRecentPosts() {
	        return new ArrayList<>(communityDAO.selectRecentPosts());
	    }

	    @Override
	    public ArrayList<PostVO> getPostsByBoardId(int boardId) {
	        return new ArrayList<>(communityDAO.selectPostsByBoardId(boardId));
	    }

	    // 10개 리밋
	    @Override
	    public ArrayList<PostVO> getPopularPostsWithLimit() {
	        return new ArrayList<>(communityDAO.selectPopularPostsWithLimit());
	    }

	    @Override
	    public ArrayList<PostVO> getRecentPostsWithLimit() {
	        return new ArrayList<>(communityDAO.selectRecentPostsWithLimit());
	    }

	    @Override
	    public ArrayList<PostVO> getPostsByBoardIdWithLimit(int boardId) {
	        return new ArrayList<>(communityDAO.selectPostsByBoardIdWithLimit(boardId));
	    }
	}