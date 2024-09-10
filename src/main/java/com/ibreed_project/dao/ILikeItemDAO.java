package com.ibreed_project.dao;

import java.util.Map;

import com.ibreed_project.model.LikeItemVO;

public interface ILikeItemDAO {
	
	public String likeCheck(LikeItemVO vo);
	
	
	public void insertLike(Map map);
	
	
	public void deleteLike(Map map);
}
