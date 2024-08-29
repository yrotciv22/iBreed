package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IReviewDAO;
import com.ibreed_project.model.ReviewVO;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	@Qualifier("IReviewDAO")
	IReviewDAO dao;
	
	@Override
	public ArrayList<ReviewVO> selectReview(int product_id) {
		return dao.selectReview(product_id);
	}

}
