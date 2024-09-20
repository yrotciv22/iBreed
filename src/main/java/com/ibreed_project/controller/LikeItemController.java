package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.LikeItemVO;
import com.ibreed_project.service.LikeItemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LikeItemController {
	
	@Autowired
	LikeItemService likeService;
	
	@RequestMapping("/insertLike/{product_id}")
	public String insertLike(@PathVariable("product_id") int product_id,
							 HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		Map<String, Object> map = new HashMap<> ();
		
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		
		likeService.insertLike(map);
	    System.out.println("찜하기 성공: product_id = " + product_id);


		return "redirect:/shop_detail/" + product_id;
	}
	
	@RequestMapping("/deleteLike/{product_id}")
	public String deleteLike(@PathVariable("product_id") int product_id,
							 HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		Map<String, Object> map = new HashMap<> ();
		
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		
		likeService.deleteLike(map);
		
		return "redirect:/shop_detail/" + product_id;
	}
}
