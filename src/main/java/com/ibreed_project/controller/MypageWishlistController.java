package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageWishlistController {
	
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

	
}
