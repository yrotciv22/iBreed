package com.ibreed_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.Mydiary_diaryVO;
import com.ibreed_project.service.Mydiary_diaryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MydiaryDiaryController {

	@Autowired
	private Mydiary_diaryService mydiary_diaryService;

	// 다이어리 작성 페이지로 이동
	@RequestMapping("/mydiary/diarywrite")
	public String view_mydiary_diarywrite() {
		return "diary/mydiary_diarywrite";
	}
	
	/* <일기> 규현 */
	@RequestMapping("/mydiary/{user_id}/diary")
	public String view_mydiary_diary(@PathVariable("user_id") String user_id,
															Model model) {
		
		 // 서비스에서 일기 목록을 가져옴
	    List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(user_id);

	    // 모델에 일기 목록을 추가하여 JSP로 전달
	    model.addAttribute("diaryList", diaryList);

		return "diary/mydiary_diary";
	}
	
	 
//	// 일기 데이터를 저장
//	@PostMapping("/mydiary/diarywrite")
//	public String saveDiary(@RequestParam("title") String title, 
//	                        @RequestParam("category") String category,
//	                        @RequestParam("content") String content, 
//	                        @RequestParam("privacy") String privacy,
//	                        @RequestParam(value = "diary_upload_status", required = false, defaultValue = "false") boolean isFinal,
//	                        @RequestParam(value = "id", required = false) Integer diaryPostId,
//	                        
//	                        HttpSession session,  
//	                        Model model) {
//
//	    Mydiary_diaryVO diary = new Mydiary_diaryVO();
//	    
//	    // 세션에서 userId를 가져옴
//	    String userId = (String) session.getAttribute("userId");
//	    diary.setUserId(userId);  
//
//	    // diaryId 설정 (임시로 1로 설정해두었으나, 실제 구현에서는 동적으로 설정해야 합니다)
//	    diary.setDiaryId(1);
//	    
//	    // 일기 ID가 있으면 수정, 없으면 새로 생성
//	    if (diaryPostId != null && diaryPostId > 0) {
//	        diary.setDiaryPostId(diaryPostId);
//	    }
//
//	    diary.setDiaryTitle(title);
//	    diary.setDiaryCategory(category);
//	    diary.setDiaryContent(content);
//	    diary.setDiaryPublic(privacy);
//	    diary.setDiaryUploadStatus(isFinal);
//
//	    mydiary_diaryService.saveDiary(diary);
//
//	    return "diary/mydiary_diary";
//	}
	
	
	// 일기 데이터를 저장
	@PostMapping("/mydiary/diarywrite")
	public String saveDiary(Mydiary_diaryVO vo,
	//		@RequestParam("image-upload") MultipartFile file,
		
			
	                        HttpSession session,  
	                        Model model) throws Exception, Exception  {
		
//
//		// 1. 파일 저장 경로 설정
//		// 맨 마지막에 / 있어야 함
//		String uploadPath = "D:/projectWorkspace/Upload/";
//		
//		// 2. 원본 파일 이름 저장
//		String originalFileName = file.getOriginalFilename();
//		
//				
//		
//		// 3. 파일 (객체) 생성
//		File sendFile = new File(uploadPath + originalFileName);
//		
//		
//		// 4. 서버로 전송 
//		file.transferTo(sendFile);
//		
//		
		
		String userId = (String) session.getAttribute("user_id");
	    vo.setUserId(userId); 
		mydiary_diaryService.saveDiary(vo) ;
		

	    return "diary/mydiary_diary";
	}
	
	// 특정 일기 데이터를 가져와 수정 폼에 표시하는 메서드 (GET 요청 처리)
	@GetMapping("/mydiary/diaryedit/{id}")
	public String editDiary(@PathVariable("id") int diaryPostId, Model model) {
		Mydiary_diaryVO diary = mydiary_diaryService.getDiary(diaryPostId);

		if (diary == null) {
			return "redirect:/mydiary/diary"; // 일기가 없으면 목록으로 리다이렉트
		}

		model.addAttribute("diary", diary);
		return "mydiary_diarywrite"; // 일기 작성 JSP 페이지로 이동 (수정 모드)
	}
	
}
