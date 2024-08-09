package com.ibreed_project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.ProductVO;
import com.ibreed_project.service.ProductService;

@Controller
public class ShopController {

	@Autowired
	ProductService prdService;

	@RequestMapping("shop")
	public String viewIndex(Model model) {
		
		ArrayList<ProductVO> topTenList = prdService.selectTopTen();
		
		model.addAttribute("topTenList", topTenList);
		
		return "shop/shop_main";
	}
}
