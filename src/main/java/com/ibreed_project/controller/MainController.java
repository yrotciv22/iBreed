package com.ibreed_project.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.CommunityMainService;


@Controller
public class MainController {
	
	@Autowired
	CommunityMainService communityMainService;
	
	@RequestMapping("/")
	public String viewIndex(Model model) {
		
		
	    // 인기글 및 최신글 가져오기
		ArrayList<PostVO> popularPosts = communityMainService.getPopularPostsWithLimit();
		ArrayList<PostVO> recentPosts = communityMainService.getRecentPostsWithLimit();

	  // 각 게시판별로 10개의 게시글을 가져오는 메서드를 호출합니다.
	  ArrayList<PostVO> pregnancyPosts = communityMainService.getPostsByBoardIdWithLimit(1); // 임신/출산 게시판
	  ArrayList<PostVO> parentingPosts = communityMainService.getPostsByBoardIdWithLimit(2); // 육아정보 게시판
	  ArrayList<PostVO> reviewPosts = communityMainService.getPostsByBoardIdWithLimit(3); // 후기정보 게시판
	  ArrayList<PostVO> marketPosts = communityMainService.getPostsByBoardIdWithLimit(4); // 중고마켓 게시판
	  ArrayList<PostVO> jobPosts = communityMainService.getPostsByBoardIdWithLimit(5); // 구인구직 게시판
        	
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
