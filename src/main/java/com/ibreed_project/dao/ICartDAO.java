package com.ibreed_project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.model.CartVO;
import com.ibreed_project.model.PaymentHistoryVO;

public interface ICartDAO {
	
	// 재고정보 포함
	// public  ArrayList<CartVO> listAllCartWithStock(String user_id);
	
	// 장바구니 리스트 조회 
    public ArrayList<CartVO> listAllCart(String user_id);

    // 장바구니 상품 추가
    public void addCartItem(@Param("user_id") String user_id, @Param("product_id") int product_id); // 다중 파라미터, @Param 필수

    // 현재 장바구니 수량
    public int getCurrentQuantity(@Param("user_id") String user_id, @Param("product_id") int product_id); 

    // 장바구니 상품 수량 1씩 변경
    public int updateCartQuantity(@Param("user_id") String user_id, @Param("product_id") int product_id, @Param("quantity") int quantity); 

    // 장바구니 전체 가격 조회
    public int getTotalCartPrice(String user_id); 

    // 장바구니 상품 삭제
    public void deleteCartItem(@Param("user_id") String user_id, @Param("product_id") int product_id); 

    // cartNo에 해당되는 행 삭제
    public void deleteCart(@Param("chkArr") ArrayList<String> chkArr);

    // 장바구니 품절 삭제
    public void deleteSoldoutItem(String user_id); 

    // 장바구니 전체 수량 조회
    public int getTotalCartCount(String user_id); 

    // 장바구니에 동일 상품이 존재하는지 확인 
    public int checkItemInCart(@Param("product_id") int product_id, @Param("user_id") String user_id);
    //public int checkItemInCart(@Param("map") HashMap<String, Object> map); 

    // 동일 상품이 존재하지 않으면 장바구니에 추가
    public void insertCart(CartVO vo);

    // 동일 상품이 존재하면 수량만 변경
    public void updateQtyInCart(CartVO vo); 

    // 장바구니 수정 
    public void updateCart(CartVO vo);

    // 주문서에 출력할 회원 정보 알아오기
    public AccountVO getUserInfo(String user_id); 

    // 주문 정보 저장
    public void insertOrderInfo(PaymentHistoryVO paymentHistoryVO);

    // 주문 상품 정보 저장
    // public void insertOrderProduct(@Param("map") HashMap<String, Object> map); 
    public void insertOrderProduct(@Param("order_id") int order_id, @Param("user_id") String user_id); 
    
    // 주문 후 장바구니 내용 비우기(삭제)
    public void deleteCartAfterOrder(String user_id); 	

}
