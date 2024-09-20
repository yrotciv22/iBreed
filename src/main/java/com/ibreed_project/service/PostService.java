package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IPostDAO;
import com.ibreed_project.model.PostVO;

@Service
public class PostService implements IPostService {

	
	@Autowired
	@Qualifier("IPostDAO")
	IPostDAO dao;
	
	@Override
	public ArrayList<PostVO> postSearch(String keyword) {
		return dao.postSearch(keyword);
	}

	@Override
	public int postSearchCount(String keyword) {
		return dao.postSearchCount(keyword);
	}

	

}
