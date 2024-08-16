package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.MydiaryVO;
import com.ibreed_project.service.MydiaryService;

@Controller
public class MyDiaryController {

	@Autowired
	MydiaryService mydiaryService;


	/* 마이 다이어리 <홈>(메인) 예은 */
	@RequestMapping("/mydiary/{user_id}/home")
	public String view_mydiary_home(@PathVariable String user_id, Model model) {

		MydiaryVO mydiary = mydiaryService.viewMydiary(user_id);
		model.addAttribute("mydiary", mydiary);
		model.addAttribute("user_id", user_id);
		return "diary/mydiary_home";
	}

	/* 마이 다이어리 탭별 이동 */

	/* <일기> 규현 */
	@RequestMapping("/mydiary/diary")
	public String view_mydiary_diary() {
		return "diary/mydiary_diary";
	}

	/* <감정분석> 성목 */
	@RequestMapping("/mydiary/emotion")
	public String view_mydiary_emotion() {
		return "diary/mydiary_emotion";
	}

 
	/* <캘린더> 승우 */
	@RequestMapping("/mydiary/calendar")
	public String view_mydiary_calendar() {
		return "diary/mydiary_calendar";
	}

	/* <친구> 예은 */
	@RequestMapping("/mydiary/friends")
	public String view_mydiary_friends() {
		return "diary/mydiary_friends";
	}
}
