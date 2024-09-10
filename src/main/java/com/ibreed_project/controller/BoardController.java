package com.ibreed_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibreed_project.model.BoardVO;
import com.ibreed_project.model.PostVO;
import com.ibreed_project.service.BoardService;
import com.ibreed_project.service.CommunityMainService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/community")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommunityMainService communityMainService;
	
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
	 //메인페이지에서의 글쓰기 폼
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
	        System.out.println("boardId: " + boardId);
	        return "community/communityWrite"; 
	    }
	  //글 저장
	  @PostMapping("/board/{boardId}/save")
	  public String savePost(@PathVariable("boardId") int boardId,
	                         PostVO postVO,
	                         HttpSession session) {
	      // 세션에서 사용자 정보 가져오기
	      String userId = (String) session.getAttribute("user_id");

	      // 글 작성자 ID 세팅
	      postVO.setUserId(userId);
	      postVO.setBoardId2(boardId); 
	      
	      // 서비스로 저장 호출
	      communityMainService.savePost(postVO);

	      // 메시지 없이 글 목록으로 리다이렉트
	      return "redirect:/community/board/" + boardId;
	  }




}
	

