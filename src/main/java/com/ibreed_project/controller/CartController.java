package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibreed_project.model.CartVO;
import com.ibreed_project.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	CartService cartService;

	
	/*
	 * @ModelAttribute("cartItemCount") public int getCartItemCount(HttpSession
	 * session) { String userId = (String) session.getAttribute("user_id");
	 * 
	 * int totalCount = 0; if (userId != null) { totalCount =
	 * cartService.getTotalCartCount(userId); } session.setAttribute("totalCount",
	 * totalCount); System.out.println("totalCount="+totalCount); return totalCount;
	 * }
	 */
	   
	// 장바구니 페이지
	@RequestMapping("/shop/{user_id}/cart")
	public String listAllCart(@PathVariable("user_id") String user_id, Model model) {

		// 장바구니 목록을 가져옴
		ArrayList<CartVO> cartList = cartService.listAllCart(user_id);

		// 장바구니가 비어 있을 경우 총 가격을 0으로 설정
		Double totalCartPrice = cartService.getTotalCartPrice(user_id);
		if (totalCartPrice == null) {
			totalCartPrice = 0.0;
		}

		Double shippingFee = 0.0;

		// 총 상품 금액이 3000원 이하일 경우 배송비 3000원 추가
		if (totalCartPrice <= 30000 && totalCartPrice != 0) {
			shippingFee = 3000.0;
		}

		// 최종 결제 금액
		Double finalPaymentAmount = totalCartPrice + shippingFee;

		model.addAttribute("cartList", cartList);
		model.addAttribute("totalCartPrice", totalCartPrice);
		model.addAttribute("shippingFee", shippingFee);
		model.addAttribute("finalPaymentAmount", finalPaymentAmount);

		return "/shop/shopping_cart";
	}

	// 장바구니 상품 수량 변경
	@RequestMapping("/shop/{user_id}/cart/{product_id}/{quantity}")
	public String plusCartQuantity(

			@PathVariable("user_id") String user_id, @PathVariable("product_id") int product_id,
			@PathVariable("quantity") int quantity) {

		// System.out.println("[CartController] product_id = " + product_id);
		// System.out.println("[CartController] quantity = " + quantity);

		cartService.updateCartQuantity(user_id, product_id, quantity);

		return "redirect:/shop/" + user_id + "/cart";
	}

	// 장바구니 삭제
	@RequestMapping("/shop/{user_id}/cart_delete/{product_id}")
	public String deleteCartItem(@PathVariable("user_id") String user_id, @PathVariable("product_id") int product_id) {

		cartService.deleteCartItem(user_id, product_id);

		return "redirect:/shop/" + user_id + "/cart";
	}

	// 품절 상품 삭제
	@RequestMapping("/shop/{user_id}/cart_soldout_delete")
	public String deleteSoldoutItem(@PathVariable("user_id") String user_id, Model model) {

		cartService.deleteSoldoutItem(user_id);
		model.addAttribute("user_id", user_id);

		return "redirect:/shop/" + user_id + "/cart";
	}


	/*
	 * @RequestMapping("/shop/${user_id}/order/cart_all") public String
	 * orderAllCartItems(@PathVariable("user_id") String user_id, Model model) {
	 * 
	 * model.addAttribute("user_id", user_id);
	 * 
	 * 
	 * return "/shop/order"; }
	 */

}
