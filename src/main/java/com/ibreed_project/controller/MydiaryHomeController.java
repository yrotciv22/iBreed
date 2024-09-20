package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ibreed_project.model.MydiaryVO;
import com.ibreed_project.service.MydiaryService;
import com.ibreed_project.service.NaverObjectStorageService;

@Controller
public class MydiaryHomeController {

	@Autowired
	MydiaryService mydiaryService;

	@Autowired
	NaverObjectStorageService naverObjectStorageService;

	/* 마이다이어리 홈 (제목, 기분, 프로필) 수정 */

	@RequestMapping(value = "/mydiary/{user_id}/updateDiary/{category}", method = RequestMethod.POST)
	public String updateMydiary(@PathVariable("user_id") String user_id, @PathVariable("category") String category,
			@ModelAttribute MydiaryVO vo, Model model) {

		System.out.println("MydiaryHomeController user_id? " + user_id);
		System.out.println("MydiaryHomeController category? " + category);

		mydiaryService.updateMydiary(vo, category);

		System.out.println("getDiary_sentiment=?? " + vo.getDiary_sentiment());
		System.out.println("getUser_id" + vo.getUser_id());
		
		// 파일 업로드

		System.out.println("diary_profile_image_path=?? " + vo.getDiary_profile_image_path());
		System.out.println("getDiary_profile_image=?? " + vo.getDiary_profile_image());

		MultipartFile file = vo.getDiary_profile_image();
		
		
		if (file != null && !file.isEmpty()) {
			try {
				// String fileName = file.getOriginalFilename();
				// System.out.println("[HomeController] Received fileName: " + fileName);

				System.out.println("[HomeController] Received file: " + file);
				
				// 파일을 S3에 업로드합니다.
				String uploadedFileUrl = naverObjectStorageService.uploadFile(file);
				System.out.println("[HomeController] Uploaded file URL: " + uploadedFileUrl);

				vo.setDiary_profile_image_path(uploadedFileUrl); // URL을 새 필드에 설정
				
				mydiaryService.updateMydiary(vo, category);

			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", "파일 업로드 중 오류가 발생했습니다.");
			}
		}

		return "redirect:/mydiary/" + user_id + "/home";
	}

}