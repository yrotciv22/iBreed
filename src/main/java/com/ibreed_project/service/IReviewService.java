package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.ReviewVO;

public interface IReviewService {
	
	// 상품상세 리뷰 조회
	public ArrayList<ReviewVO> selectReview(int product_id);
	
	// 상품당 리뷰 갯수 카운트
	public int countReview(int product_id);
	
	// 상품 리뷰 점수 평균값
	public double ratingAvg(int product_id);
}
