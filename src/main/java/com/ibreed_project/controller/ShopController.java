package com.ibreed_project.controller;

import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibreed_project.model.LikeItemVO;
import com.ibreed_project.model.ProductVO;
import com.ibreed_project.model.ReviewVO;
import com.ibreed_project.service.LikeItemService;
import com.ibreed_project.service.ProductService;
import com.ibreed_project.service.ReviewService;

@Controller
public class ShopController {

	@Autowired
	ProductService prdService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	LikeItemService likeService;

	@RequestMapping("shop")
	public String viewIndex(Model model) {

		ArrayList<ProductVO> topTenList = prdService.selectTopTen();
		ArrayList<ProductVO> newItemList = prdService.selectNewItem();
		ArrayList<ProductVO> bestItemList = prdService.bestItem();
		ArrayList<ProductVO> soldOutItemList = prdService.soldOutItem();

		model.addAttribute("topTenList", topTenList);
		model.addAttribute("newItemList", newItemList);
		model.addAttribute("bestItemList", bestItemList);
		model.addAttribute("soldOutItemList", soldOutItemList);

		return "shop/shop_main";
	}

	// 장바구니 페이지 (예은)
	// @RequestMapping("/shop/cart")
	// public String viewShoppingCart() {
	//	return "shop/shopping_cart";
	// }

	// 주문 페이지 (예은)
	// @RequestMapping("/shop/order")
	// public String viewOrderPage() {
	//	return "shop/order";
	// }

	// 주문 확인 페이지 (예은)
	// @RequestMapping("/shop/order_confirm")
	// public String viewOrderConfirmPage() {
	//	return "shop/order_confirm";
	// }

	// 상품 상세 페이지 (승우)
	@RequestMapping("/shop_detail/{product_id}")
	public String detailView(@PathVariable("product_id") int product_id, 
										   @RequestParam(value = "page", defaultValue = "1") int page,
										   HttpSession session,
										   Model model) {

		ProductVO prd = prdService.detailViewPrd(product_id);
		ArrayList<ReviewVO> reviewList = reviewService.selectReview(product_id);
		int rCount = reviewService.countReview(product_id);
		double rAvg = reviewService.ratingAvg(product_id);
		

		
		// 이름 마스킹 처리
		for (ReviewVO vo : reviewList) {
			String name = vo.getUser_name();
			String fullName = "";

			String first = name.substring(0, 1);
			String last = name.substring(name.length() - 1, name.length());
			if (name.length() == 2) {
				fullName = first + "*";
			} else if (name.length() == 4) {
				fullName = first + "**" + last;
			} else {
				fullName = first + "*" + last;
			}

			vo.setUser_name(fullName);
		}
		
		
		// 찜버튼 확인
		LikeItemVO likeVo = new LikeItemVO();
		
		likeVo.setUser_id((String) session.getAttribute("user_id"));
		likeVo.setProduct_id(product_id);
		
		String likeResult = likeService.likeCheck(likeVo);
		
		model.addAttribute("likeResult", likeResult);
		
		//페이지네이션
		int itemsPerPage = 5;
		int totalItems = reviewService.countReview(product_id);
		int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		
		int startIndex = (page - 1) * itemsPerPage;
	    int endIndex = Math.min(startIndex + itemsPerPage - 1, totalItems - 1);
	    
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("startIndex", startIndex);
	    model.addAttribute("endIndex", endIndex);
		model.addAttribute("productId", product_id);
	    
		model.addAttribute("prd", prd);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("rCount", rCount);
		model.addAttribute("rAvg", rAvg);

		return "shop/shop_detail";
	}

	// 상품 전체 페이지 (승우)
	@RequestMapping("shop_list")
	public String listView(Model model) {

		ArrayList<ProductVO> viewAllPrd = prdService.viewAllPrd();

		model.addAttribute("viewAllPrd", viewAllPrd);

		return "shop/shop_list";
	}
}
