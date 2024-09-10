package com.ibreed_project.controller;

import com.ibreed_project.model.ReviewVO;
import com.ibreed_project.service.MyReviewService;
import com.ibreed_project.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class myReviewController {

    @Autowired
    MyReviewService myreviewService;

    @RequestMapping("mypage/review")
    public String myReview(HttpSession session, Model model){

        String user_id = (String) session.getAttribute("user_id");
        System.out.println("세션 값 : " + user_id);

        List<ReviewVO> list = myreviewService.getReview(user_id);

        model.addAttribute("list", list);

        return "mypage/mypage_review";
    }
}
