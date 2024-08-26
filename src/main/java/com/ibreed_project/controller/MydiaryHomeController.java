package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ibreed_project.model.MydiaryVO;
import com.ibreed_project.service.MydiaryService;


@Controller
public class MydiaryHomeController {

	@Autowired
	MydiaryService mydiaryService;
	

	/* 마이다이어리 홈 (제목, 기분, 프로필) 수정 */

	@RequestMapping("/mydiary/{user_id}/updateDiary/{category}")
	public String updateMydiary(@PathVariable("user_id") String user_id,
								@PathVariable("category") String category,
								MydiaryVO vo) {

		System.out.println("MydiaryHomeController user_id? "+user_id);
		System.out.println("MydiaryHomeController category? "+category);
		mydiaryService.updateMydiary(vo, category);
		
		return "redirect:/mydiary/{user_id}/home";
	} 

}