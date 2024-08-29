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

@Controller
public class MydiaryHomeController {

	@Autowired
	MydiaryService mydiaryService;
	
	/*
	 * @Autowired NaverObjectStorageService naverObjectStorageService;
	 */

	/* 마이다이어리 홈 (제목, 기분, 프로필) 수정 */

	@RequestMapping(value = "/mydiary/{user_id}/updateDiary/{category}", method = RequestMethod.POST)
	public String updateMydiary(
			@PathVariable("user_id") String user_id, 
			@PathVariable("category") String category,
			MydiaryVO vo, 
			Model model) {

		// System.out.println("MydiaryHomeController user_id? " + user_id);
		// System.out.println("MydiaryHomeController category? " + category);

		
		// 파일 업로드 처리
		 MultipartFile file = vo.getDiary_profile_image(); 
	        if (file != null && !file.isEmpty()) {
	            try {
	            	/// (1)
	                String fileName = file.getOriginalFilename();

	                // 이미지 저장 경로 설정
	                String savePath = new File("src/main/resources/static/image").getAbsolutePath();
	                System.out.println("MydiaryHomeController savePath? " + savePath);
	                
	                // 디렉토리가 존재하지 않으면 생성
	                File directory = new File(savePath);
	                if (!directory.exists()) {
	                    directory.mkdirs();
	                }

	                String filePath = savePath + File.separator + fileName;
	                file.transferTo(new File(filePath)); // 파일을 저장

	                // 저장된 파일 경로를 VO에 설정
	                vo.setDiary_profile_image_path("/image/" + fileName);

	                /// (2)
	                // 파일을 Naver Object Storage에 업로드
	               //  String imageUrl = naverObjectStorageService.uploadFile(file);
	               //  vo.setDiary_profile_image_path(imageUrl);  // 업로드된 이미지 URL을 설정
	                
	            } catch (IOException e) {
	                e.printStackTrace();
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