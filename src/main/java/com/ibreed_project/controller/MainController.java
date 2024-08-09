package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String viewIndex() {

		return "index";
	}
	
	@RequestMapping("/loggedin")
	public String viewIndex2() {

		return "index2";
	}
	@RequestMapping("/mydiary")
	public String viewMydiary() {

		return "diary/mydiaryMain";
	}
}
