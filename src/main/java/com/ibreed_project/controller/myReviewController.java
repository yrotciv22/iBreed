package com.ibreed_project.controller;

import com.ibreed_project.model.OrderHistoryVO;
import com.ibreed_project.model.ReviewVO;
import com.ibreed_project.service.MyReviewService;
import com.ibreed_project.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class myReviewController {

    @Autowired
    MyReviewService myreviewService;

    @RequestMapping("mypage/review")
    public String myReview(HttpSession session, Model model){

        String user_id = (String) session.getAttribute("user_id");
        System.out.println("세션 값 : " + user_id);

        List<OrderHistoryVO> historyVOS = myreviewService.getHistory(user_id);
        List<ReviewVO> list = myreviewService.getReview(user_id);

        for (OrderHistoryVO vo : historyVOS) {
            System.out.println("히스토리 불러오기 : " + vo.toString());
        }


        model.addAttribute("list", list);
        model.addAttribute("historyVOS", historyVOS);

        return "mypage/mypage_review";
    }


    // 리뷰 작성 데이터를 처리하는 메서드
    @PostMapping("/mypage/submitReview")
    public String submitReview(@ModelAttribute ReviewVO reviewVO, HttpSession session, RedirectAttributes redirectAttributes) {
        // 현재 시간 구하기
        LocalDateTime now = LocalDateTime.now();

        // 서비스로 리뷰 데이터 전송하여 저장
        reviewVO.setUser_id((String) session.getAttribute("user_id"));
        reviewVO.setReview_time(now);  // 리뷰 시간 설정 (LocalDateTime)


            boolean result = myreviewService.checkReview(reviewVO.getProduct_id(), reviewVO.getUser_id());
            if (result) {
                redirectAttributes.addFlashAttribute("message", "리뷰가 이미 등록되어 있습니다.");
            }
            else{
                myreviewService.setReview(reviewVO);
                System.out.println(reviewVO.toString());
                redirectAttributes.addFlashAttribute("message", "리뷰가 등록되었습니다.");
            }









        // 리뷰 작성 완료 후 리다이렉트할 페이지 설정 (예: 리뷰 목록 페이지)
        return "redirect:/mypage/review";
    }


    // 리뷰 작성 데이터를 처리하는 메서드
    @PostMapping("/mypage/deleteReview")
    public String deleteReview(@RequestParam("delete") int reviewId, RedirectAttributes redirectAttributes) {

        System.out.println("리뷰 id : " + reviewId);

        myreviewService.deleteReview(reviewId);


        redirectAttributes.addFlashAttribute("message", "리뷰가 삭제되었습니다.");
        // 리뷰 작성 완료 후 리다이렉트할 페이지 설정 (예: 리뷰 목록 페이지)
        return "redirect:/mypage/review";
    }

}
