package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MydiaryDiaryController {
	
	//다이어리작성페이지로이동
	/* <일기> 규현 */
	@RequestMapping("/mydiary/diarywrite")
	public String view_mydiary_diarywrite() {
		return "diary/mydiary_diarywrite";
	}
		
}
