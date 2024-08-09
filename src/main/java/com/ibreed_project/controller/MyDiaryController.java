package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyDiaryController {
	
	/* 마이 다이어리 <홈>(메인) 예은 */
	@RequestMapping("/mydiary")
	public String view_mydiary_home() {
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
	
	/* <사진첩> 승우 */
	@RequestMapping("/mydiary/photos")
	public String view_mydiary_photos() {
		return "diary/mydiary_photos";
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
