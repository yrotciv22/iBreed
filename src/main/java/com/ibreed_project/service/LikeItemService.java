package com.ibreed_project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ILikeItemDAO;
import com.ibreed_project.model.LikeItemVO;

@Service
public class LikeItemService implements ILikeItemService {

	@Autowired
	@Qualifier("ILikeItemDAO")
	ILikeItemDAO dao;

	@Override
	public String likeCheck(LikeItemVO vo) {
		
		String result = "available";
		
		if(dao.likeCheck(vo) == null) {
			result = "not_available";
		}
		
		return result;
	}
	
	@Override
	public void insertLike(Map map) {
		dao.insertLike(map);
	}
	
	@Override
	public void deleteLike(Map map) {
		dao.deleteLike(map);
	}
}
