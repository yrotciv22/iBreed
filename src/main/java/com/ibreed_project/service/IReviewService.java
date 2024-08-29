package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.ReviewVO;

public interface IReviewService {
	
	// 상품상세 리뷰 조회
	public ArrayList<ReviewVO> selectReview(int product_id);
}
