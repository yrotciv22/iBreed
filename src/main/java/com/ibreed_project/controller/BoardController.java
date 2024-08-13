package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.BoardVO;
import com.ibreed_project.service.BoardService;

@Controller
@RequestMapping("/community")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	//게시판 탭별 이동
	  @GetMapping("/board/{boardId}")
	    public String viewBoard(@PathVariable("boardId") int boardId, Model model) {
	        // 특정 게시판 정보 가져오기
	        BoardVO board = boardService.getBoardById(boardId);
	        model.addAttribute("board", board);

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
	 

}
	

