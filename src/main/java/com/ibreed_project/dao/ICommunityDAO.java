package com.ibreed_project.dao;

import java.util.List;

import com.ibreed_project.model.PostVO;

public interface ICommunityDAO {
	
	public List<PostVO> selectPopularPosts();
    public List<PostVO> selectRecentPosts();
    public List<PostVO> selectPostsByBoardId(int boardId);

}
