package com.ibreed_project.service;

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
		return dao.likeCheck(vo);
	}
}
