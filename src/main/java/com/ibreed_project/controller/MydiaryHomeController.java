package com.ibreed_project.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	/*
	 * @Autowired NaverObjectStorageService naverObjectStorageService;
	 */

	/* 마이다이어리 홈 (제목, 기분, 프로필) 수정 */

	@RequestMapping(value = "/mydiary/{user_id}/updateDiary/{category}", method = RequestMethod.POST)
	public String updateMydiary(@PathVariable("user_id") String user_id, @PathVariable("category") String category,
			MydiaryVO vo, Model model) {

		// System.out.println("MydiaryHomeController user_id? " + user_id);
		System.out.println("MydiaryHomeController category? " + category);

		// String localFilePath = "C:/Users/BOK/Desktop/images.png";

		// naverObjectStorageService.uploadFile(localFilePath);

		// 파일 업로드 처리
		MultipartFile file = vo.getDiary_profile_image();

		if (file != null && !file.isEmpty()) {

			/// (1)
			String fileName = file.getOriginalFilename();
			System.out.println("MydiaryHomeController file? " + file);
			System.out.println("MydiaryHomeController fileName? " + fileName);
			
			String localFilePath = "C:/Users/BOK/Desktop/test/baby.png";
			// naverObjectStorageService.uploadFile(localFilePath);

			String uloadedFileUrl = naverObjectStorageService.uploadFile(localFilePath);
			System.out.println("MydiaryHomeController uloadedFileUrl? " + uloadedFileUrl);

			if (uloadedFileUrl != null) {
				return "File uploaded successfully! Access it at: " + uloadedFileUrl;
			} else {
				return "File upload failed.";
			}

		}
		/*
		 * MultipartFile file = vo.getDiary_profile_image(); // VO에서 MultipartFile 가져오기
		 * if (file != null && !file.isEmpty()) { try { // 사용자 홈 디렉토리와 바탕화면 경로 가져오기
		 * String userHome = System.getProperty("user.home"); String desktopPath =
		 * userHome + File.separator + "Desktop";
		 * 
		 * String fileName = file.getOriginalFilename(); String filePath = desktopPath +
		 * File.separator + fileName;
		 * 
		 * file.transferTo(new File(filePath)); // 파일을 바탕화면에 저장
		 * 
		 * vo.setDiary_profile_image_path(filePath); // 파일 경로를 설정하여 MyBatis 매퍼에 사용
		 * 
		 * } catch (IOException e) { e.printStackTrace(); } }
		 */
		mydiaryService.updateMydiary(vo, category);

		return "redirect:/mydiary/" + user_id + "/home"; // user_id 변수 사용

	}

}