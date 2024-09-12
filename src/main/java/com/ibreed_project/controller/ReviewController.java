package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibreed_project.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
}
