package com.ibreed_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICommunityDAO;
import com.ibreed_project.model.PostVO;

@Service
public class CommunityMainService {
	   @Autowired
	    private ICommunityDAO communityDAO;

	    public List<PostVO> getPopularPosts() {
	        //return communityDAO.selectPopularPosts();
	    	 System.out.println("getPopularPosts 메서드가 호출되었습니다.");
	    	List<PostVO> posts = communityDAO.selectPopularPosts();
	        System.out.println("조회된 인기 게시글 수: " + posts.size()); // 디버깅 출력
	        return posts;
	    }
	    public List<PostVO> getRecentPosts() {
	        return communityDAO.selectRecentPosts();
	    }

	    public List<PostVO> getPostsByBoardId(int boardId) {
	        return communityDAO.selectPostsByBoardId(boardId);
	    }
}
