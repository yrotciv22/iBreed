package com.ibreed_project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.CartService;
import com.ibreed_project.service.CommunityMainService;

import jakarta.servlet.http.HttpSession;


@Controller
public class MainController {
	
	@Autowired
	CommunityMainService communityMainService;
	
	@Autowired
	CartService cartService;

	// 장바구니 개수
	 @ModelAttribute("cartItemCount") 
	 public void getCartItemCount(HttpSession session) { 
		 String userId = (String) session.getAttribute("user_id");
	 
		 int totalCount = 0; 
		 if (userId != null) { 
			 totalCount = cartService.getTotalCartCount(userId); 
		 }
	     session.setAttribute("totalCount", totalCount);	 
	 }
	
	@RequestMapping("/")
	public String viewIndex(Model model) {
		
		
	    // 인기글 및 최신글 가져오기
		List<PostVO> popularPosts = communityMainService.getPopularPostsWithLimit();
		List<PostVO> recentPosts = communityMainService.getRecentPostsWithLimit();

	  // 각 게시판별로 10개의 게시글을 가져오는 메서드를 호출합니다.
		List<PostVO> pregnancyPosts = communityMainService.getPostsByBoardIdWithLimit(1); // 임신/출산 게시판
		List<PostVO> parentingPosts = communityMainService.getPostsByBoardIdWithLimit(2); // 육아정보 게시판
		List<PostVO> reviewPosts = communityMainService.getPostsByBoardIdWithLimit(3); // 후기정보 게시판
		List<PostVO> marketPosts = communityMainService.getPostsByBoardIdWithLimit(4); // 중고마켓 게시판
		List<PostVO> jobPosts = communityMainService.getPostsByBoardIdWithLimit(5); // 구인구직 게시판
        	
        model.addAttribute("popularPosts", popularPosts);
        model.addAttribute("recentPosts", recentPosts);
        model.addAttribute("pregnancyPosts", pregnancyPosts);
        model.addAttribute("parentingPosts", parentingPosts);
        model.addAttribute("reviewPosts", reviewPosts);
        model.addAttribute("marketPosts", marketPosts);
        model.addAttribute("jobPosts", jobPosts);
	        
		return "index";
	}

	
	
	
	// 검색
	
}
