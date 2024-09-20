package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICartDAO;
import com.ibreed_project.model.AccountVO;
import com.ibreed_project.model.CartVO;
import com.ibreed_project.model.PaymentHistoryVO;

@Service
public class CartService implements ICartService {

	@Autowired
	@Qualifier("ICartDAO")
	ICartDAO dao;

	@Override
	public ArrayList<CartVO> listAllCart(String user_id) {
		return dao.listAllCart(user_id);
	}

	@Override
	public void addCartItem(String user_id, int product_id) {
		 dao.addCartItem(user_id, product_id);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}

	@Override
	public int updateCartQuantity(String user_id, int product_id, int quantity) {
		  // 현재 장바구니에 저장된 수량을 가져옴
	   
	    // DB에서 수량 업데이트
	    dao.updateCartQuantity(user_id, product_id, quantity);

	    return dao.getCurrentQuantity(user_id, product_id);  // 새로운 수량을 반환
	    //return dao.updateCartQuantity(user_id, product_id, quantity);
	}

	@Override
	public void deleteCartItem(String user_id, int product_id) {
		dao.deleteCartItem(user_id, product_id);
	}

	@Override
	public int getTotalCartPrice(String user_id) {
		return dao.getTotalCartPrice(user_id);
	}

	// 장바구니 품절 삭제
	@Override
	public void deleteSoldoutItem(String user_id) {
		dao.deleteSoldoutItem(user_id);
	}

	// 장바구니 전체 수량 조회
	@Override
	public int getTotalCartCount(String user_id) {
		return dao.getTotalCartCount(user_id);
	}

	@Override
	public void deleteCart(ArrayList<String> chkArr) {
		dao.deleteCart(chkArr);
	}

	@Override
	public int checkItemInCart(int product_id, String user_id) {
		System.out.println("[checkItemInCart] product_id"+ product_id );
		System.out.println("[checkItemInCart] user_id"+ user_id );

		// 장바구니에 동일 상품이 존재하는지 여부 확인
		// 존재하면 mapper로부터 동일 상품 개수 반환 받아서 컨트롤러에게 반환
		// mapper에게는 매개변수가 2개인 경우에는 HashMap으로 전달해야 하기 때문에
		// prdNo와 memId를 HashMap에 넣음
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("product_id", product_id); map.put("user_id", user_id);
		 */
		
		return dao.checkItemInCart(product_id, user_id);
	}

	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public void updateQtyInCart(CartVO vo) {
		dao.updateQtyInCart(vo);
	}

	@Override
	public AccountVO getUserInfo(String user_id) {
		return dao.getUserInfo(user_id);
	}

	@Override
	public void insertOrderInfo(PaymentHistoryVO paymentHistoryVO) {
		
		// (1) 주문 정보 저장 (order_info 테이블에 저장)
		dao.insertOrderInfo(paymentHistoryVO);
		
		// (2) 주문 상품 내용 저장 (order_product 테이블에 저장)
		// mapper에서 cart 테이블에서 order_product 테이블로 저장
		// cart에서 가져오기 위해 memId와 주문번호(ordNo) 필요
		// memId와 ordNofmf HashMap에 넣어서 mapper에게 전달
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pay_id", paymentHistoryVO.getPay_id());
		map.put("user_id", paymentHistoryVO.getUser_id());
		//dao.insertOrderProduct(map); // mapper에게 전달
		
		// (3) 주문 완료 후 장바구니 비우기 : memId 전달 
		dao.deleteCartAfterOrder(paymentHistoryVO.getUser_id());
	}

	@Override
	public void insertOrderProduct(int product_id, String user_id) {
		dao.insertOrderProduct(product_id,user_id);
	}

	@Override
	public void deleteCartAfterOrder(String user_id) {
		dao.deleteCartAfterOrder(user_id);
	}

	@Override
	public int getCurrentQuantity(String user_id, int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}



}
