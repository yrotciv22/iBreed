package com.ibreed_project.service;

import com.ibreed_project.model.OrderHistoryVO;
import com.ibreed_project.model.ReviewVO;

import java.util.List;

public interface IMyReviewService {
    List<ReviewVO> getReview(String user_id);
    List<OrderHistoryVO> getHistory(String user_id);
    void setReview(ReviewVO reviewVO);
    void deleteReview(int review_id);
    boolean checkReview(int product_id, String user_id);
}
