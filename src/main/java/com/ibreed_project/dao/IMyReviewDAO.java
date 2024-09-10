package com.ibreed_project.dao;

import com.ibreed_project.model.ReviewVO;

import java.util.List;

public interface IMyReviewDAO {
    List<ReviewVO> getReview(String user_id);
}
