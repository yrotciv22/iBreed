package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.CalendarVO;
import com.ibreed_project.model.MydiaryVO;
import com.ibreed_project.model.Mydiary_diaryVO;
import com.ibreed_project.service.CalendarService;
import com.ibreed_project.service.MydiaryService;
import com.ibreed_project.service.Mydiary_diaryService;

@Controller
public class MyDiaryController {

	@Autowired
	MydiaryService mydiaryService;

	@Autowired
	Mydiary_diaryService mydiary_diaryService;

	@Autowired
	CalendarService calendarService;
	
	/* 마이 다이어리 <홈>(메인) 예은 */
	@RequestMapping("/mydiary/{user_id}/home")
	public String view_mydiary_home(@PathVariable("user_id") String user_id, Model model) {

		MydiaryVO mydiary = mydiaryService.viewMydiary(user_id);
		model.addAttribute("mydiary", mydiary);
		/* model.addAttribute("user_id", user_id); */

		Map<String, Object> params = new HashMap<>();
		params.put("userId", user_id);
		params.put("offset", 1);
		params.put("size", 4);
		
		List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(params);
		model.addAttribute("diaryList", diaryList);

		if (diaryList == null) {
			System.out.println("diaryList가 null입니다.");
		} 
		else {
			
		}
		
		return "diary/mydiary_home";
	}

	@RequestMapping("/mydiary/{currentUserId}/test")
	public String view_mydiary_test(@PathVariable("currentUserId") String currentUserId, Model model) {

		model.addAttribute("currentUserId", currentUserId);

		return "diary/mydiary_test";
	}

	/* 마이 다이어리 탭별 이동 */

	/* <감정분석> 성목 */
	@RequestMapping("/mydiary/{user_id}/emotion")
	public String viewMydiaryEmotion(@PathVariable("user_id") String userId, Model model) {
		// 필요시 model에 추가 데이터 전달 가능
		return "forward:/diary/mydiary_emotion_result?user_id=" + userId;
	}

	/* <캘린더> 승우 */
	/*
	 * @RequestMapping("/mydiary/{user_id}/calendar") public String
	 * view_mydiary_calendar(@PathVariable("user_id") String user_id) { return
	 * "diary/mydiary_calendar"; }
	 */
	@RequestMapping("/mydiary/{user_id}/calendar")
	public String view_mydiary_calendar(@PathVariable("user_id") String user_id,
			Model model) {
		
		List<CalendarVO> calList = calendarService.getAllEvents(user_id);
		model.addAttribute("calList", calList);
		
		return "diary/mydiary_calendar";
	}
	
	

	/*
	 * <친구> 예은
	 * 
	 * @RequestMapping("/mydiary/{user_id}/friends") public String
	 * view_mydiary_friends(@PathVariable("user_id") String user_id) { return
	 * "diary/mydiary_friends"; }
	 */
}
