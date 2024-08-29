package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.ReviewVO;

public interface IReviewDAO {
	public ArrayList<ReviewVO> selectReview(int product_id);
}
