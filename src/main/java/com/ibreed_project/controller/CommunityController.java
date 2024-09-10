package com.ibreed_project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.CommunityMainService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	private CommunityMainService communityMainService;
	
	//메인에서 커뮤니티 탭 클릭시 열리는거
	  @RequestMapping("/community") 
	  public String viewCommunity(){
	
	    return "redirect:/communityMain"; 
	  }
		/*
		 * //로그인버트누르면 열리는거 ->js,백엔드 작업하고 없앨것
		 * 
		 * @RequestMapping("/communityAfterlogin") public String
		 * viewcommunityAfterlogin() {
		 * 
		 * return "community/communityAfterlogin"; }
		 */
	  //서버에서글가져오기
	  @GetMapping("/communityMain")
	    public String communityMain(Model model) {
		  model.addAttribute("boardName", "IBREED 커뮤니티");
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

	        return "community/communityMain"; 
	  }

	@GetMapping("/checkLoginStatus")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getUserInfo(HttpSession session) {
		String userId = (String) session.getAttribute("user_id");
		String userNickname = (String) session.getAttribute("user_nickname");
		String userRate = (String) session.getAttribute("user_rate");
		Date userTimestamp = (Date) session.getAttribute("user_timestamp");
		String profileImageUrl = (String) session.getAttribute("profile_image_url");


		if (userId != null && userNickname != null) {
	        Map<String, Object> userInfo = new HashMap<>();
	        userInfo.put("user_id", userId);
	        userInfo.put("user_nickname", userNickname);
	        userInfo.put("user_rate", userRate);
	        userInfo.put("profileImageUrl", profileImageUrl);

	        // Date를 String으로 변환
	        if (userTimestamp != null) {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            String formattedTimestamp = dateFormat.format(userTimestamp);
	            userInfo.put("user_timestamp", formattedTimestamp);  // 변환된 String을 저장
	        } else {
	            userInfo.put("user_timestamp", null);  // null 처리
	        }

	        return ResponseEntity.ok(userInfo);
	    } else {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
	    }
	}

/////////////////각 게시판
		
}