package com.ibreed_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
@RequestMapping("/")
	public String viewIndex() {
		
	return "index";
}

@RequestMapping("/map")
	public String viewMap() {
	return "map/map";
}
}
