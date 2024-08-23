package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibreed_project.model.Mydiary_diaryVO;
import com.ibreed_project.service.Mydiary_diaryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MydiaryDiaryController {

	@Autowired
	private Mydiary_diaryService mydiary_diaryService;

	// 다이어리 작성 페이지로 이동 (GET 요청)
	@GetMapping("/mydiary/{user_id}/diarywrite")
	public String view_mydiary_diarywrite(@PathVariable("user_id") String userId) {
		return "diary/mydiary_diarywrite";
	}

	// 일기 리스트 페이지를 조회 (GET 요청 추가)
	@GetMapping("/mydiary/{user_id}/diary")
	public String getDiaryList(@PathVariable("user_id") String userId,
							   @RequestParam(value = "page", defaultValue = "1") int page,
							   @RequestParam(value = "size", defaultValue = "7") int size,
							   Model model) {
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("offset", offset);
		params.put("size", size);

		// 일기 목록을 가져옴
		List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(params);
		model.addAttribute("diaryList", diaryList);

		// 전체 일기 수를 가져오기 (페이지 수 계산을 위해 필요)
		int totalDiaryCount = mydiary_diaryService.getTotalDiaryCountByUserId(userId);
		int totalPages = (int) Math.ceil((double) totalDiaryCount / size);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "diary/mydiary_diary";
	}

	// 일기 리스트 페이지를 조회 (POST 요청)
	@PostMapping("/mydiary/{user_id}/diary")
	public String view_mydiary_diary(@PathVariable("user_id") String userId,
									 @RequestParam(value = "page", defaultValue = "1") int page,
									 @RequestParam(value = "size", defaultValue = "7") int size,
									 Model model) {
		int offset = (page - 1) * size;
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("offset", offset);
		params.put("size", size);

		// 일기 목록을 가져옴
		List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(params);
		model.addAttribute("diaryList", diaryList);

		// 전체 일기 수를 가져오기 (페이지 수 계산을 위해 필요)
		int totalDiaryCount = mydiary_diaryService.getTotalDiaryCountByUserId(userId);
		int totalPages = (int) Math.ceil((double) totalDiaryCount / size);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "diary/mydiary_diary";
	}

	// 일기 작성하고 데이터를 저장 (POST 요청)
	@PostMapping("/mydiary/{user_id}/save")
	public String saveDiary(@PathVariable("user_id") String userId,
							Mydiary_diaryVO vo,
							HttpSession session,
							Model model) throws Exception {

		System.out.println("제대로 일기 작성 데이터로 진입했는지 확인");

		// 사용자 ID 설정
		vo.setUserId(userId);
		mydiary_diaryService.saveDiary(vo);

		return "redirect:/mydiary/" + userId + "/diary";
	}

	// 다이어리 상세보기 (GET 요청)
	@GetMapping("/mydiary/{userId}/diarydetail/{diaryPostId}")
	public String viewDiaryDetail(@PathVariable("userId") String userId,
								  @PathVariable("diaryPostId") int diaryPostId,
								  HttpSession session,
								  Model model) {
		Mydiary_diaryVO diary = mydiary_diaryService.getDiary(diaryPostId);

		// 모델에 다이어리 정보를 추가
		model.addAttribute("diary", diary);
		model.addAttribute("userId", userId);

		return "diary/mydiary_diarydetail";
	}

	// 특정 일기 데이터를 가져와 수정 폼에 표시하는 메서드 (GET 요청 처리)
	@GetMapping("/mydiary/diaryedit/{diaryPostId}")
	public String editDiary(@PathVariable("diaryPostId") int diaryPostId,
							Model model) {
		Mydiary_diaryVO diary = mydiary_diaryService.getDiary(diaryPostId);

		if (diary == null) {
			return "redirect:/mydiary/diary"; // 일기가 없으면 목록으로 리다이렉트
		}

		model.addAttribute("diary", diary);
		return "diary/mydiary_diarywrite"; // 일기 작성 JSP 페이지로 이동 (수정 모드)
	}

}
