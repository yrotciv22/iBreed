package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.CartVO;
import com.ibreed_project.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	

	@RequestMapping("/shop/insertCart")
	@ResponseBody 
	public String insertCart(CartVO vo, HttpSession session) {
		
		
		// 로그인 성공 시 세션 sid 값 설정한 것을 가져와서 사용
		String user_id = (String)session.getAttribute("user_id");
		System.out.println("[CartController] user_id = " + user_id);

		vo.setUser_id(user_id);		
		System.out.println("vo.getProduct_id() = " + vo.getProduct_id());
		
		// (1) 동일 상품이 존재하는 지 확인 (회원id, 상품번호 전달) : 동일 상품 개수 반환
		int count = cartService.checkItemInCart(vo.getProduct_id(), user_id);
		System.out.print("[CartController] count= " + count);


		String result = "";
		if(count == 0) { // (2) 동일 상품이 존재하지 않으면 장바구니에 추가
			cartService.insertCart(vo);
			result="장바구니에 상품이 담겼습니다.";
			
		} else { // (3) 동일 상품이 존재하면 주문수량만 변경
			cartService.updateQtyInCart(vo);
			result="장바구니에 이미 상품이 존재합니다.";
		}
		
		// 장바구니에 저장/수정한 후 장바구니 목록 출력 요청 포워딩
		//return "redirect:/shop/{user_id}/cart";
		return result; 
	}
	
	   
	// 장바구니 페이지
	@RequestMapping("/shop/{user_id}/cart")
	public String listAllCart(@PathVariable("user_id") String user_id, Model model) {

		// 장바구니 목록을 가져옴
		ArrayList<CartVO> cartList = cartService.listAllCart(user_id);

		// 재고가 없는 상품을 제외한 총 상품 가격 계산
	    //Integer totalCartPrice = cartService.getTotalCartPrice(user_id);

	   
	    int totalCartPrice = 0;
	    int shippingFee = 0;

		// 총 상품 금액이 3000원 이하일 경우 배송비 3000원 추가
		//if (totalCartPrice <= 30000 && totalCartPrice != 0) {
		//	shippingFee = 3000;
		//}

		// 최종 결제 금액
		// int finalPaymentAmount = totalCartPrice + shippingFee;

	    
		model.addAttribute("cartList", cartList);
		// model.addAttribute("totalCartPrice", totalCartPrice);
		// model.addAttribute("shippingFee", shippingFee);
		// model.addAttribute("finalPaymentAmount", finalPaymentAmount);

		return "/shop/shopping_cart";
	}

	// 장바구니 상품 수량 변경
//	@RequestMapping("/shop/{user_id}/cart/{product_id}/{quantity}")
//	public String plusCartQuantity(
//			@PathVariable("user_id") String user_id, 
//			@PathVariable("product_id") int product_id,
//			@PathVariable("quantity") int quantity) {
//
//		cartService.updateCartQuantity(user_id, product_id, quantity);
//
//		return "redirect:/shop/" + user_id + "/cart";
//	}
	
	@GetMapping("/shop/{user_id}/cart/{product_id}/{quantity}")
	@ResponseBody
	public Map<String, Object> updateCartQuantity(
	        @PathVariable("user_id") String user_id,
	        @PathVariable("product_id") int product_id,
	        @PathVariable("quantity") int quantity,
	        Model model,
	        HttpSession session) {
		
	    System.out.println("quantity"+quantity);

	    // 수량 업데이트 로직
   int newQuantity = cartService.updateCartQuantity(user_id, product_id, quantity);
    System.out.println("newQuantity"+newQuantity);
//
//
//	    // 새로운 수량을 세션에 반영
//	    List<CartVO> updatedCart = cartService.listAllCart(userId);
//	    session.setAttribute("cartList", updatedCart);  // 세션에 장바구니 데이터 갱신
//	    
	    
	    // 새로운 수량을 응답으로 반환
	//    Map<String, Object> response = new HashMap<>();
	//    response.put("newQuantity", newQuantity);
	 //   return response;
	//    
	    // 수량 업데이트 로직
//	    
//	    cartService.updateCartQuantity(user_id, product_id, quantity);
//
//	    // 최신 장바구니 데이터를 다시 조회하여 모델에 추가
	    List<CartVO> updatedCart = cartService.listAllCart(user_id);
	    session.setAttribute("cartList", updatedCart); 
	    
	   // model.addAttribute("cartList", updatedCart);
//
//	    // 최신 데이터를 가진 상태로 페이지로 리다이렉트
//	    return "redirect:/shop/order";  // 리다이렉트 방식으로 페이지 이동
	    // 새로운 수량을 응답으로 반환
	    Map<String, Object> response = new HashMap<>();
	    response.put("newQuantity", newQuantity);  // 새로운 수량을 응답 데이터로 반환
	    return response;  // JSON 형식으로 응답 반환
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


	// 선택 상품 삭제
    @RequestMapping(value = "/cart/delete_selected_item", method = RequestMethod.POST)

	public String deleteSelectedItem(@RequestParam("chkArr") ArrayList<String> chkArr, HttpSession session) {

    	 System.out.println("chkArr"+chkArr);
    	 
    	String user_id = (String)session.getAttribute("user_id");
    	  // 선택된 상품 삭제
        cartService.deleteCart(chkArr);
       
        
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
