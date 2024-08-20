package com.ibreed_project.controller;

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

    // 다이어리 작성 페이지로 이동
    @RequestMapping("/mydiary/diarywrite")
    public String view_mydiary_diarywrite() {
        return "diary/mydiary_diarywrite";
    }

    // 일기 데이터를 저장하는 메서드 (POST 요청 처리)
    @PostMapping("/mydiary/diarywrite")
    public String saveDiary(@RequestParam("title") String title,
                            @RequestParam("category") String category,
                            @RequestParam("content") String content,
                            @RequestParam("privacy") String privacy,
                            @RequestParam(value = "diary_upload_status", required = false, defaultValue = "false") boolean isFinal,
                            @RequestParam(value = "id", required = false) Integer diaryPostId,
                            HttpSession session, // 세션을 파라미터로 추가
                            Model model) {

        // 세션에서 userId 가져오기
        Integer userId = (Integer) session.getAttribute("userId");

        // userId가 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/login";
        }

        // userId를 이용해 diaryId 가져오기
        int diaryId = mydiary_diaryService.getDiaryIdByUserId(userId);

        Mydiary_diaryVO diary = new Mydiary_diaryVO();
        
        // diaryId 설정
        diary.setDiaryId(diaryId);

        // 일기 ID가 있으면 수정, 없으면 새로 생성
        if (diaryPostId != null && diaryPostId > 0) {
            diary.setDiaryPostId(diaryPostId);
        }

        diary.setDiaryTitle(title);
        diary.setDiaryCategory(category);
        diary.setDiaryContent(content);
        diary.setDiaryPublic(privacy);
        diary.setDiaryUploadStatus(isFinal);

        mydiary_diaryService.saveDiary(diary);

        return "redirect:/mydiary/diary"; // 일기 목록 페이지로 리다이렉트
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
