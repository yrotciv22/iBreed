package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.model.CartVO;
import com.ibreed_project.model.PaymentHistoryVO;
import com.ibreed_project.service.CartService;
import com.ibreed_project.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	MemberService memberservice;

	@Autowired
	CartService cartService;


	// 전체 상품 주문하기
	@RequestMapping("/shop/{user_id}/order/all_items")
	public ResponseEntity<String> orderAllItems(
			@PathVariable("user_id") String user_id,
			Model model,    HttpSession session,
			@RequestParam("product_id") List<Integer> productIds,
	        @RequestParam("cart_quantity") List<Integer> cartQuantities,
	        @RequestParam("product_name") List<String> productNames,
	        @RequestParam("product_img") List<String> productImages,
	        @RequestParam("product_price") List<Double> productPrices,
	        @RequestParam("product_discount") List<Double> productDiscounts
	/*
	 * ,
	 * 
	 * @RequestParam("totalCartPrice") int totalCartPrice,
	 * 
	 * @RequestParam("shippingFee") int shippingFee
	 */
	) {
		System.out.println("오더 컨드롤러 user_id=" +user_id);

		    System.out.println("Product IDs: " + productIds);
		    System.out.println("Cart Quantities: " + cartQuantities);
		    System.out.println("Product Names: " + productNames);
		    System.out.println("Product Images: " + productImages);
		    System.out.println("Product Prices: " + productPrices);
		    System.out.println("Product Discounts: " + productDiscounts);
		    
	    // 주문 페이지에 넘길 주문 데이터 구성
	    List<CartVO> orderItems = new ArrayList<>();
	    for (int i = 0; i < productIds.size(); i++) {
	        CartVO item = new CartVO();
	        item.setProduct_id(productIds.get(i));
	        item.setCart_quantity(cartQuantities.get(i));
	        item.setProduct_name(productNames.get(i));
	        item.setProduct_price((int) Math.floor(productPrices.get(i)));
	        item.setProduct_discount((int) Math.floor(productDiscounts.get(i)));
	        item.setProduct_img(productImages.get(i));

	        orderItems.add(item);
	    }
	    
	 	    
//	 // 사용자 정보 추가
//		AccountVO user = memberservice.getMemberData(user_id); // 회원 정보 가져오기
//	    
	//model.addAttribute("totalCartPrice", totalCartPrice); 
	//model.addAttribute("shippingFee", shippingFee); 
//		model.addAttribute("orderItems", orderItems);
//		model.addAttribute("user", user);
//
//		return "/shop/order";
	    // 세션에 orderItems 저장
	    session.setAttribute("orderItems", orderItems);

	    // 세션에 사용자 정보도 저장
	    AccountVO user = memberservice.getMemberData(user_id);
	    session.setAttribute("user", user);

	    
	    System.out.println("다시한번 user_id=" +user_id);
	    // 응답으로 페이지 이동 경로를 반환
	    return ResponseEntity.ok("/shop/{user_id}/order");  // 클라이언트에 이동할 URL을 응답
	}
	
	
	//////Order 페이지로 이동 /////////////////////// 
	
	@RequestMapping("/shop/{user_id}/order")
	public String viewOrderPage(@PathVariable("user_id") String user_id, Model model, HttpSession session) {
	
		
		//	String user_id = (String)session.getAttribute("user_id");

		// 세션에서 최신 장바구니  데이터를 다시 조회하여 반영
		  List<CartVO> cartList = cartService.listAllCart(user_id);
		    model.addAttribute("cartList", cartList);
		// List<CartVO> cartList = (List<CartVO>) model.getAttribute("cartList");
	    
		    // 주문서에 출력할 회원 정보를 조회
		    AccountVO user = cartService.getUserInfo(user_id);
		
		    if (user != null) {
		        // 사용자 정보를 모델에 추가하여 JSP 페이지로 전달
		    	System.out.println("user.toString()"+user.toString());

		    	
		        model.addAttribute("user", user);

		    } else {
		        System.out.println("사용자 정보를 찾을 수 없습니다.");
		        return "redirect:/login";  // 사용자 정보가 없으면 로그인 페이지로 리다이렉트
		    }
		    
	    return "/shop/order";  // 주문 페이지로 이동
	}
	

	// 주문 확인 페이지 
	
		@RequestMapping("/shop/order_confirm")
		public String viewOrderConfirmPage( Model model,HttpSession session,
				@RequestParam("product_id") List<Integer> productIds, // 주문 상품 ID들
			    @RequestParam("cart_quantity") List<Integer> quantities, // 주문 수량
			    @RequestParam("product_name") List<String> productNames,
			    @RequestParam("product_img") List<String> productImages,
			     @RequestParam("product_price") List<Integer> productPrices
			    // @RequestParam("finalPaymentAmount") int finalPaymentAmount,
			   // @RequestParam("product_price") List<String> productPrices, // 문자열로 받은 후 처리
			  /*  @RequestParam("finalPaymentAmount") String finalPaymentAmountStr, // 문자열로 받은 후 처리
			     @RequestParam("shippingFee") String shippingFeeStr, // 문자열로 받은 후 처리
					@RequestParam("name") String recipientName, // 주문자 이름
				    @RequestParam("postal_code") String postalCode, // 우편번호
				    @RequestParam("address_line1") String addressLine1, // 기본 주소
				    @RequestParam("address_line2") String addressLine2, // 상세 주소
				    @RequestParam("email_username") String emailUsername, // 이메일 사용자명
				    @RequestParam("email_domain") String emailDomain, // 이메일 도메인
				    @RequestParam("phone1") String phone1, 
				    @RequestParam("phone2") String phone2,
				    @RequestParam("phone3") String phone3*/
				        
				) {
			

//			// 주문 페이지에 넘길 주문 데이터 구성
//			List<CartVO> orderItems = new ArrayList<>();
//			for (int i = 0; i < product_id.size(); i++) {
//				CartVO item = new CartVO();
//
//				item.setProduct_id(product_id.get(i));
//				item.setCart_quantity(cart_quantity.get(i));
//				item.setProduct_name(product_name.get(i));
//				item.setProduct_price((int) Math.floor(product_price.get(i)));
//				item.setProduct_img(product_img.get(i));
//
//				orderItems.add(item);
//			}
//
//			
//			model.addAttribute("finalPaymentAmount", (int) Math.floor(finalPaymentAmount)); // 소수점 버림
//			model.addAttribute("orderItems", orderItems);

			// 사용자 ID는 세션에서 가져옴
		    String user_id = (String) session.getAttribute("user_id");

		 
		    
		    // 주문서 데이터 처리
			/*
			 * PaymentHistoryVO paymentHistory = new PaymentHistoryVO();
			 * paymentHistory.setUser_id(user_id);
			 * paymentHistory.setRecipient_name(recipientName);
			 * paymentHistory.setRecipient_address(postalCode + " " + addressLine1 + " " +
			 * addressLine2);
			 */
		    //paymentHistory.setTotal_order_amount(finalPaymentAmountStr);
		   // paymentHistory.setDelivery_charge(deliveryCharge);
		    //paymentHistory.setPayment_method(paymentMethod);

		    // 주문 번호 생성
			/*
			 * int orderNumber = (int) (Math.random() * 1000000000);
			 * paymentHistory.setPay_number(orderNumber);
			 * 
			 * // 주문 정보 DB 저장 cartService.insertOrderInfo(paymentHistory);
			 * 
			 * // 주문한 상품 정보 DB 저장 for (int i = 0; i < productIds.size(); i++) { int
			 * product_id = productIds.get(i); int quantity = quantities.get(i);
			 * cartService.insertOrderProduct(product_id, user_id); }
			 */

		 // 주문 정보 생성
		    List<CartVO> orderItems = new ArrayList<>();
		    for (int i = 0; i < productIds.size(); i++) {
		        CartVO item = new CartVO();
		        item.setProduct_id(productIds.get(i));
		        item.setCart_quantity(quantities.get(i));
		        item.setProduct_name(productNames.get(i));
		        item.setProduct_price(productPrices.get(i));
		        item.setProduct_img(productImages.get(i));
		        orderItems.add(item);
		    }

		    // 모델에 주문 정보 및 총 결제 금액, 배송비 추가
		    model.addAttribute("orderItems", orderItems);

		    // 장바구니 비우기
		    cartService.deleteCartAfterOrder(user_id);

		    // 주문 완료 페이지로 이동

			return "shop/order_confirm";
		}

	
		// 주문완료 

		// 선택 상품 주문하기
//		@RequestMapping("/shop/order/selected_item")
//		public String orderSelectedItem(
//				@RequestParam int[] cart_id,
//				  @RequestParam int[] cart_quantity,
//				  Model model,
//				  HttpSession session,
//				@RequestParam("product_id") List<Integer> product_id,
//				@RequestParam("product_name") List<String> product_name,
//				@RequestParam("product_img") List<String> product_img,
//				@RequestParam("product_price") List<Double> product_price,
//				@RequestParam("product_discount") List<Double> product_discount,
//				@RequestParam("finalPaymentAmount") int finalPaymentAmount,
//				@RequestParam("shippingFee") int shippingFee
//		) {
//			System.out.println("선택 상품 주문하기 "+ shippingFee);
	//
//			String user_id = (String)session.getAttribute("user_id");
	//
//			// (1) [주문하기] 버튼 누르면 변경된 주문수량을 장바구니 테이블에 적용 (update 수행)
//					// mapper에게 vo로 전달하기 위해 받아온 값으로 vo 설정
//					for(int i=0; i<cart_id.length; i++) {
//						CartVO vo = new CartVO();
//						vo.setCart_id(cart_id[i]);
//						vo.setCart_quantity(cart_quantity[i]);
//						cartService.updateCart(vo);
//										}
//					
//					// (2) 주문서에 출력할 회원 정보 가져오기
//					AccountVO accountVo = cartService.getUserInfo(user_id);
//					
//					// 주문서에 주문자/수령인 정보 기본으로 출력하기 위해 model 설정
//					model.addAttribute("accountVo", accountVo);
//					
//					// (3) 주문서에 장바구니 목록 출력 
//					ArrayList<CartVO> cartList = cartService.listAllCart(user_id);
//					model.addAttribute("cartList", cartList);
//					
	//
//			return "/shop/{user_id}/order";
//		}
		

}
