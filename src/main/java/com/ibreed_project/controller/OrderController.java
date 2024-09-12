package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.model.CartVO;
import com.ibreed_project.service.MemberService;


@Controller
public class OrderController {
	
	@Autowired
	MemberService memberservice;
	/*
	 * @RequestMapping("/shop/{user_id}/order/cart_all") public String
	 * viewOrderPage(@PathVariable("user_id") String user_id,Model model) {
	 * 
	 * AccountVO user = memberservice.getMemberData(user_id);
	 * model.addAttribute("user", user);
	 * 
	 * return "/shop/order"; }
	 */
		
	// 전체 상품 주문하기
	@PostMapping("/shop/{user_id}/order/cart_all")
	public String processOrder(
			@PathVariable("user_id") String user_id,
			Model model,
			@RequestParam("product_id") List<Integer> product_id,
			@RequestParam("cart_quantity") List<Integer> cart_quantity,
			@RequestParam("product_name") List<String> product_name,
			@RequestParam("product_img") List<String> product_img,
			@RequestParam("product_price") List<Integer> product_price,
			@RequestParam("product_discount") List<Integer> product_discount
			/*
			 * @RequestParam("finalPaymentAmount") List<Integer> finalPaymentAmount,
			 */
			) {
	     
		// 주문 페이지에 넘길 주문 데이터 구성
		List<CartVO> orderItems = new ArrayList<>();
		for (int i = 0; i < product_id.size(); i++) {
			CartVO item = new CartVO();

			item.setProduct_id(product_id.get(i));
			item.setCart_quantity(cart_quantity.get(i));
			item.setProduct_name(product_name.get(i));
			item.setProduct_price(product_price.get(i));
			item.setProduct_discount(product_discount.get(i));
			item.setProduct_img(product_img.get(i));
			
			orderItems.add(item);
		}

		model.addAttribute("orderItems", orderItems);

		AccountVO user = memberservice.getMemberData(user_id);
	    model.addAttribute("user", user);
		
		return "/shop/order";
	}
	
}
