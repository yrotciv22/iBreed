package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.PostVO;

public interface IPostDAO {
	
	
	// 게시글 검색
	public ArrayList<PostVO> postSearch(String keyword);
	
	// 검색 결과수
	public int postSearchCount(String keyword);

}
