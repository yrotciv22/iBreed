package com.ibreed_project.dao;

import com.ibreed_project.model.OrderHistoryVO;
import com.ibreed_project.model.ReviewVO;

import java.util.List;

public interface IMyReviewDAO {
    List<ReviewVO> getReview(String user_id);
    List<OrderHistoryVO> getHistory(String user_id);
    void setReview(ReviewVO reviewVO);
    void deleteReview(int review_id);
    int checkReview(int product_id, String user_id);
}
