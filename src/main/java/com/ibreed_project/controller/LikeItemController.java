package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.LikeItemVO;
import com.ibreed_project.service.LikeItemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LikeItemController {
	
	@Autowired
	LikeItemService likeService;
	
	//@RequestMapping
	//public String likeCheck(LikeItemVO vo, HttpSession ssession) {
}
