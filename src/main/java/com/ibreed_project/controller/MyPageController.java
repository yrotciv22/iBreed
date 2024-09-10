package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.MyPageVO;
import com.ibreed_project.service.LoginService;
import com.ibreed_project.service.MyPageService;
import com.ibreed_project.service.Mydiary_diaryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
    private Mydiary_diaryService mydiary_diaryService;
	
	@Autowired
    private LoginService loginService;
	
	@Autowired
	private MyPageService myPageService; 
	
	/* 마이페이지 */	
	
	
	/* 마이페이지 기본 양식 테스트*/	
	@RequestMapping("/mypage/basic")
	public String viewBasicMypage() {
		return "mypage/mypage_basic";
	}
	
	/* 찜리스트 페이지 예은 */	
	@RequestMapping("/mypage/wishlist")
	public String viewWishListPage() {
		return "mypage/wishlist";
	}

	/* 주문내역 페이지 승우 */	
	@RequestMapping("/mypage/orderList")
	public String viewOrderListPage(HttpSession session, 
									Model model) {
		
		
		String user_id = (String) session.getAttribute("user_id");
		
		ArrayList<MyPageVO> payList = myPageService.selectPayment(user_id);
		Map<Integer, ArrayList<MyPageVO>> orderMap = new HashMap<>();
		
		for(MyPageVO payment : payList) {
			int pay_number = payment.getPay_number();
			ArrayList<MyPageVO> orderList = myPageService.selectOrder(pay_number);
			orderMap.put(pay_number, orderList);
		}
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);
		
		model.addAttribute("orderMap", orderMap);
		model.addAttribute("payList", payList);
		
		return "mypage/mypage_orderHistory";
	}
	
	/* 취소내역 페이지 승우 */	
	@RequestMapping("/mypage/cancelList")
	public String viewCancelListPage() {
		return "mypage/mypage_cancelList";
	}
	
	/* 최근본상품 페이지 승우 */	
	@RequestMapping("/mypage/recentPrdList")
	public String viewRecentPrdListPage() {
		return "mypage/mypage_recentPrdList";
	}
	
}
