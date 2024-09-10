package com.ibreed_project.service;

import com.ibreed_project.model.ReviewVO;

import java.util.List;

public interface IMyReviewService {
    List<ReviewVO> getReview(String user_id);
}
