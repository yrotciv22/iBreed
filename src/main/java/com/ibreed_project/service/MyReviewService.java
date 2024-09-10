package com.ibreed_project.service;

import com.ibreed_project.dao.IMemberDAO;
import com.ibreed_project.dao.IMyReviewDAO;
import com.ibreed_project.model.OrderHistoryVO;
import com.ibreed_project.model.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyReviewService implements IMyReviewService {

    @Autowired
    @Qualifier("IMyReviewDAO")
    IMyReviewDAO myReviewDAO;

    @Override
    public List<ReviewVO> getReview(String user_id) {
        return myReviewDAO.getReview(user_id);
    }

    @Override
    public List<OrderHistoryVO> getHistory(String user_id) {
        return myReviewDAO.getHistory(user_id);
    }

    @Override
    public void setReview(ReviewVO reviewVO) {
        myReviewDAO.setReview(reviewVO);
    }

    @Override
    public void deleteReview(int review_id) {
        myReviewDAO.deleteReview(review_id);
    }

    @Override
    public boolean checkReview(int product_id, String user_id) {
        // DAO에서 반환된 값이 1 이상이면 리뷰가 존재하므로 true를 반환
        return myReviewDAO.checkReview(product_id, user_id) > 0;
    }
}
