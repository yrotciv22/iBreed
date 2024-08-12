package com.ibreed_project.controller;

import java.util.List;

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
        List<PostVO> popularPosts = communityMainService.getPopularPosts();
        List<PostVO> recentPosts = communityMainService.getRecentPosts();
        
		// 게시판 리스트 불러오기 
		
		  List<PostVO> pregnancyPosts = communityMainService.getPostsByBoardId(1); // 임신/출산
	        List<PostVO> parentingPosts = communityMainService.getPostsByBoardId(2); // 육아정보
	        List<PostVO> reviewPosts = communityMainService.getPostsByBoardId(3); // 후기정보
	        List<PostVO> marketPosts = communityMainService.getPostsByBoardId(4); // 중고장터
	        List<PostVO> jobPosts = communityMainService.getPostsByBoardId(5); // 구인구직
		
		
	        model.addAttribute("popularPosts", popularPosts);
	        model.addAttribute("recentPosts", recentPosts);
	        model.addAttribute("pregnancyPosts", pregnancyPosts);
	        model.addAttribute("parentingPosts", parentingPosts);
	        model.addAttribute("reviewPosts", reviewPosts);
	        model.addAttribute("marketPosts", marketPosts);
	        model.addAttribute("jobPosts", jobPosts);

	        
		return "index";
	}

	// 임시 로그인 완료 페이지
	@RequestMapping("/loggedin")
	public String viewIndex2() {
		return "index2";
	}
	
	
	
	// 검색
	
}
