package com.ibreed_project.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.BoardVO;
import com.ibreed_project.model.CommentVO;
import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.BoardService;
import com.ibreed_project.service.CommentService;
import com.ibreed_project.service.CommunityMainService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/community")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommunityMainService communityMainService;
	@Autowired
	private CommentService commentService;
	
	
	//게시판 탭별 이동

	  @GetMapping("/board/{boardId}")
	    public String viewBoard(@PathVariable("boardId") int boardId, 
	    											Model model,
	    										
	    											@RequestParam(value = "page", defaultValue = "1") int page,
	 				                               @RequestParam(value = "size", defaultValue = "15") int size) {
	        // 특정 게시판 정보 가져오기
	        BoardVO board = boardService.getBoardById(boardId);
	        model.addAttribute("board", board);
	        // 공통 공지사항 가져오기 (모든 게시판에서 동일하게 출력)
	        List<PostVO> notices = communityMainService.getAllNotices();
	        model.addAttribute("notices", notices);
	        // 페이지네이션 처리된 게시글 가져오기
	        int offset = (page - 1) * size;
	        List<PostVO> posts = communityMainService.getPostsByBoardIdWithPagination(boardId, offset, size);
	        
	        // 총 페이지 수 계산
	        int totalPages = communityMainService.getTotalPages(boardId, size);
	        	
	        	
	        
	        model.addAttribute("posts", posts);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);
	        model.addAttribute("pageSize", size);
	        

	        // boardId에 따라 해당 JSP로 이동:임신출산만 만들어놨음...0813
	        if (boardId == 1) {
	            return "community/pregnancyBoard";  // 임신/출산 게시판
	        } else if (boardId == 2) {
	            return "community/parentingBoard";  // 육아정보 게시판
	        } else if (boardId == 3) {
	            return "community/reviewBoard";  // 후기정보 게시판
	        } else if (boardId == 4) {
	            return "community/usedmarketBoard";  // 중고마켓 게시판
	        } else if (boardId == 5) {
	            return "community/jobBoard";  // 구인구직 게시판
	        } else {
	            return "error/404";  // 잘못된 boardId인 경우 404 페이지로
	        }
	        
	    }
	/////////////////////////검색기능 추가해야함 게시판구현다되고 추가하자
	 //메인페이지에서의 글쓰기 폼열기
	  @GetMapping("/communityWrite")
	    public String showCommunityWriteForm() {
	        return "community/communityWrite"; 
	    }
	  //각 게시판글쓰기폼
	  @GetMapping("/board/{boardId}/communityWrite")
	    public String communityWrite(@PathVariable("boardId") int boardId, 
	    													Model model) {
	        // 필요한 데이터를 모델에 추가
	        model.addAttribute("boardId", boardId);
	        System.out.println("Controller에서 전달된 boardId: " + boardId); 
	        return "community/communityWrite"; 
	    }
	  //글 저장(게시판에서 글쓰기시)
	  @PostMapping("/board/{boardId}/save")
	  public String savePost(@PathVariable("boardId") int  boardId,
					                         PostVO postVO,
					                         HttpSession session,
					                     	Model model) {
		  
		  
	      // 세션에서 사용자 정보 가져오기
	      String userId = (String) session.getAttribute("user_id");
	 
	      model.addAttribute("boardId", boardId);
	      System.out.println("글저장boardId: " + boardId);
	 //     System.out.println("Post title: " + postVO.getPostTitle()); 
	      // 글 작성자 ID 세팅
	      postVO.setUserId(userId);
	      postVO.setBoardId2(boardId); 
	      
	      // 서비스로 저장 호출
	      communityMainService.savePost(postVO);

	      // 메시지 없이 글 목록으로 리다이렉트
	      return "redirect:/community/board/" + boardId;
	  }
	  
	  
	  //글저장(사이드바에서 글쓰기 선택시)
	  @PostMapping("/board/save")
	  public String saveSidebarPost(@RequestParam("boardId") Integer boardId, 
	                                PostVO postVO, HttpSession session, Model model) {
		  
		
		 
	      // 세션에서 사용자 정보 가져오기
	      String userId = (String) session.getAttribute("user_id");
	      	
	      // 게시판 ID 확인
	      System.out.println("사이드바에서 글쓰기 - boardId: " + boardId);

	      // 글 작성자 ID 세팅
	      postVO.setUserId(userId);
	      postVO.setBoardId2(boardId);

	      // 서비스로 저장 호출
	      communityMainService.savePost(postVO);

	      // 게시판으로 리다이렉트
	      return "redirect:/community/board/" + boardId;
	  }

	// 게시글 상세보기
	  @GetMapping("/board/{boardId}/postdetail/{postId}")
	  public String viewPostDetail(@PathVariable("boardId") int boardId,
	                               @PathVariable("postId") int postId,
	                               HttpSession session,
	                               Model model) {
		  
		  String currentUserId = (String) session.getAttribute("user_id");  
		  
	      // 게시글 정보 가져오기
	      PostVO post = communityMainService.getPostById(postId);
	      model.addAttribute("post", post);

	      // 게시판 정보 가져오기
	      BoardVO board = boardService.getBoardById(boardId);
	      model.addAttribute("board", board);

	      // 게시글에 달린 댓글 가져오기
	      List<CommentVO> comments = commentService.selectCommentsByPostId(postId);
	      System.out.println("Before reverse: " + comments.size());
	      Collections.reverse(comments);
	      System.out.println("After reverse: " + comments.size());
	      model.addAttribute("comments", comments);
	      int commentCount = commentService.getCommentCountByPostId(postId);  // 댓글 수 가져오기
	      model.addAttribute("commentCount", commentCount);  // 댓글 수 모델에 추가	
	      
	      
	        // userId를 통해 작성자의 닉네임 조회
	    
	        String authorUserId = post.getUserId();
	        String authorNickname = communityMainService.getAuthorNicknameByUserId(authorUserId);
	        model.addAttribute("authorNickname", authorNickname);
	        // 작성자의 프로필 이미지 조회
	        String profileImage = communityMainService.getAuthorProfileImage(postId);
	        model.addAttribute("profileImage", profileImage);
	        
	        // 조회수 증가
	        // 게시글 작성자와 현재 사용자가 다를 때만 조회수 증가
	        if (!post.getUserId().equals(currentUserId)) {
	            communityMainService.increasePostViewCount(postId);  // 조회수 증가 서비스 호출
	        }

	   
	        


	      return "community/communitydetail";
	  }
	  
	  //게시글수정 폼 열기
	  @GetMapping("/post/edit/{postId}")
		public String showEditPostForm(
		                               @PathVariable("postId") int postId, 
		                               Model model) {
		    PostVO post = communityMainService.getPostById(postId);
		    model.addAttribute("post", post);
		    return "community/communityEdit";
		}
	  
	  @PostMapping("/post/update/{postId}")
	  public String updatePost(@PathVariable("postId") int postId, 
	                            PostVO postVO,
	                            @RequestParam("boardId")int boardId) {
		  postVO.setPostId(postId); // 수정할 게시글의 ID 설정
		  postVO.setBoardId2(boardId);

	      communityMainService.updatePost(postVO); // 게시글 수정
	      return "redirect:/community/board/"+boardId; // 수정 후 리다이렉트
	  }

	// 게시글 삭제 처리
	  @ResponseBody
	  @PostMapping("/post/delete/{postId}")
	  public String deletePost(
	                           @PathVariable("postId") int postId,
	                           @RequestParam("boardId") int boardId) {
	      // 게시글 삭제 서비스 호출
	      communityMainService.deletePost(postId);
	      
	      // 삭제 후 게시판으로 리다이렉트
	      return "redirect:/community/board/" + boardId;
	  }


	  
	// 좋아요 상태 확인
	  @ResponseBody
	  @GetMapping("/like/status")
	  public HashMap<String, Object> checkLikeStatus(
	      @RequestParam("userId") String userId, 
	      @RequestParam("postId") int postId) {
	      
	      boolean isLiked = communityMainService.isPostLikedByUser(postId, userId);
	      int likeCount = communityMainService.getLikeCount(postId);
	      
	      HashMap<String, Object> response = new HashMap<>();
	      response.put("isLiked", isLiked);
	      response.put("likeCount", likeCount);

	      return response;
	  }

	// 좋아요 토글
	  @ResponseBody
	  @PostMapping("/like/post/{postId}")
	  public HashMap<String, Object> toggleLike(
	      @RequestParam("userId") String userId, 
	      @PathVariable("postId") int postId) {
	      
	      boolean isLiked = communityMainService.isPostLikedByUser(postId, userId);
	      
	      if (isLiked) {
	          communityMainService.unlikePost(postId, userId);  // 좋아요 취소
	      } else {
	          communityMainService.likePost(postId, userId);   // 좋아요 추가
	      }
	      
	      // 변경된 좋아요 수 반환
	      int likeCount = communityMainService.getLikeCount(postId);
	      
	      HashMap<String, Object> response = new HashMap<>();
	      response.put("status", isLiked ? "unliked" : "liked");
	      response.put("likeCount", likeCount);
	      
	      return response;
	  }
		
	  @GetMapping("/search")
	  public String searchPosts(@RequestParam("keyword") String keyword, 
			  								Model model) {
		  
		  
		  List<PostVO> searchResults = communityMainService.searchPostsByKeyword(keyword);
		    model.addAttribute("posts", searchResults);
		    model.addAttribute("keyword", keyword);
		    System.out.println("검색어: " + keyword);
		    System.out.println("검색 결과: " + searchResults);
		      
	      return "community/communitysearchResult";  // 검색 결과를 보여줄 JSP 페이지
	  }
		
}
	

