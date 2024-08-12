package com.ibreed_project.service;

import com.ibreed_project.model.PostVO;

import java.util.ArrayList;

public interface ICommunityMainService {
 
     ArrayList<PostVO> getPopularPosts();
        ArrayList<PostVO> getRecentPosts();
        ArrayList<PostVO> getPostsByBoardId(int boardId);
        
        // 10개 리밋
        ArrayList<PostVO> getPopularPostsWithLimit();
        ArrayList<PostVO> getRecentPostsWithLimit();
        ArrayList<PostVO> getPostsByBoardIdWithLimit(int boardId);
    }