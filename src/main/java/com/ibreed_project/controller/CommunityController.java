package com.ibreed_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.CommunityMainService;

@Controller
public class CommunityController {
	@Autowired
	private CommunityMainService communityMainService;
	
	//메인에서 커뮤니티 탭 클릭시 열리는거
	  @RequestMapping("/community") 
	  public String viewCommunity(){
	
	    return "redirect:/communityMain"; 
	  }
	  //로그인버트누르면 열리는거 ->js,백엔드 작업하고 없앨것
	  @RequestMapping("/communityAfterlogin") 
	  public String viewcommunityAfterlogin() {
	
	    return "community/communityAfterlogin"; 
	  }
	  
	  @GetMapping("/communityMain")
	    public String communityMain(Model model) {
	        // 인기글 및 최신글 가져오기
		  System.out.println("communityMain 메서드가 호출되었습니다.");
	        List<PostVO> popularPosts = communityMainService.getPopularPosts();
	        List<PostVO> recentPosts = communityMainService.getRecentPosts();

	        // 각 게시판별 게시글 가져오기
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

	        return "community/communityMain"; 
	  
	  
	  
	  
	  
	  }
}