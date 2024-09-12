package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibreed_project.model.MyPageVO;
import com.ibreed_project.service.LoginService;
import com.ibreed_project.service.MyPageService;
import com.ibreed_project.service.Mydiary_diaryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
    private Mydiary_diaryService mydiary_diaryService;
	
	@Autowired
    private LoginService loginService;
	
	@Autowired
	private MyPageService myPageService; 
	
	/* 마이페이지 */	
	
	
	/* 마이페이지 기본 양식 테스트*/	
	@RequestMapping("/mypage/basic")
	public String viewBasicMypage() {
		return "mypage/mypage_basic";
	}
	
	/* 찜리스트 페이지 승우 */	
	@RequestMapping("/mypage/wishlist")
	public String viewWishListPage(HttpSession session, 
								   Model model) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		ArrayList<MyPageVO> likeList= myPageService.selectLikeItemList(user_id);
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);
		
		model.addAttribute("likeList", likeList);
		
		return "mypage/wishlist";
	}
	
	/* 찜리스트 개별 삭제 버튼 클릭 */
	@PostMapping("/mypage/removeItem")
	@ResponseBody
	public Map<String, Object> removeItem(@RequestBody Map<String, Object> payload) {
		 try {
		        // productId를 Object로 받아서 Integer로 변환
		        Integer productId = Integer.parseInt(payload.get("productId").toString());
		        
		        System.out.println("ProductId: " + productId);  // 디버깅용 로그
		        
		        // DB에서 해당 productId를 삭제하는 로직
		        myPageService.deleteItem(productId);

		        // 성공 응답
		        Map<String, Object> response = new HashMap<>();
		        response.put("success", true);
		        return response;
		    } catch (Exception e) {
		        e.printStackTrace();  // 예외 출력
		        Map<String, Object> response = new HashMap<>();
		        response.put("success", false);
		        return response;
		    }
	}
	
	
	/* 주문내역 페이지 승우 */	
	@RequestMapping("/mypage/orderList")
	public String viewOrderListPage(HttpSession session, 
									Model model) {
		
		
		String user_id = (String) session.getAttribute("user_id");
		
		ArrayList<MyPageVO> payList = myPageService.selectPayment(user_id);
		Map<Integer, ArrayList<MyPageVO>> orderMap = new HashMap<>();
		
		for(MyPageVO payment : payList) {
			int pay_number = payment.getPay_number();
			ArrayList<MyPageVO> orderList = myPageService.selectOrder(pay_number);
			orderMap.put(pay_number, orderList);
		}
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);
		
		model.addAttribute("orderMap", orderMap);
		model.addAttribute("payList", payList);
		
		return "mypage/mypage_orderHistory";
	}
	
	/* 취소내역 페이지 승우 */	
	@RequestMapping("/mypage/cancelList")
	public String viewCancelListPage(HttpSession session, 
									 Model model) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);
		
		return "mypage/mypage_cancelList";
	}
	
	/* 최근본상품 페이지 승우 */	
	/*@RequestMapping("/mypage/recentPrdList")
	public String viewRecentPrdListPage(HttpSession session, 
										Model model,
										HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		
		String user_id = (String) session.getAttribute("user_id");
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);
		
		Cookie[] cookies = request.getCookies();
	    String viewedProducts = null;

	    System.out.println("쿠키값" + cookies);
	    
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	System.out.println(cookies.length);
	            if (cookie.getName().equals("viewedProducts")) {
	            	System.out.println("쿠키밸류"+cookie.getValue());
	                viewedProducts = cookie.getValue();
	                break;
	            }
	        }
	    }
	    
	    System.out.println("null 아니면 성공임 >>" + viewedProducts);
	    if (viewedProducts != null) {
	        // 쿠키에서 가져온 값(JSON)을 리스트로 변환
	        List<Integer> productIds = Arrays.asList(new ObjectMapper().readValue(viewedProducts, Integer[].class));

	        // DB에서 상품 정보를 가져옴
	        List<MyPageVO> recentProducts = myPageService.getProductsByIds(productIds);
	        model.addAttribute("recentProducts", recentProducts);
	        System.out.println("안녕하이헬로" + recentProducts);
	    }
	    
		return "mypage/mypage_recentPrdList";
	}*/
	
	@RequestMapping("/mypage/recentPrdList")
	public String viewRecentPrdListPage(Model model,
										HttpSession session,
										@RequestParam("viewedProducts") String viewedProducts)  
												throws JsonMappingException, JsonProcessingException {
	
		String user_id = (String) session.getAttribute("user_id");
		
		int diaryCount = mydiary_diaryService.getDiaryCount(user_id);
		String nickName = loginService.getNickName(user_id);
		String rating = loginService.getRating(user_id);
		int payCount = myPageService.countPayment(user_id);
		
		model.addAttribute("diaryCount", diaryCount);
		model.addAttribute("nickName", nickName);
		model.addAttribute("rating", rating);
		model.addAttribute("payCount", payCount);		
		 
		 
		
		if (viewedProducts != null) { 
			 List<Integer> productIds =
					  Arrays.asList(new ObjectMapper().readValue(viewedProducts, Integer[].class));
			
					  
					  // DB에서 상품 정보를 가져옴 
			 List<MyPageVO> recentProducts =
					  myPageService.getProductsByIds(productIds);
					 model.addAttribute("recentProducts", recentProducts);
		 };	
		 
		return "mypage/mypage_recentPrdList";
	}
}
