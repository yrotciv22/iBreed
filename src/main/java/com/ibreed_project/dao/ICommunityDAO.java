package com.ibreed_project.dao;

import java.util.List;

import com.ibreed_project.model.PostVO;

public interface ICommunityDAO {
	//전체불러오기
	public List<PostVO> selectPopularPosts();
    public List<PostVO> selectRecentPosts();
    public List<PostVO> selectPostsByBoardId(int boardId);
    
    
 // 10개 불러오기
    public List<PostVO> selectPopularPostsWithLimit();
    public List<PostVO> selectRecentPostsWithLimit();
    public List<PostVO> selectPostsByBoardIdWithLimit(int boardId);


}
