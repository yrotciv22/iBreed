package com.ibreed_project.service;

import com.ibreed_project.dao.IMemberDAO;
import com.ibreed_project.dao.IMyReviewDAO;
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
}
