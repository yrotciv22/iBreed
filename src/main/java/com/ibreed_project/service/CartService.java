package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICartDAO;
import com.ibreed_project.model.CartVO;

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
	public void addCartPrd(CartVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCart(CartVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCartQuantity(String user_id, int product_id, int quantity) {
		dao.updateCartQuantity(user_id, product_id, quantity);
	}

	@Override
	public void deleteCartItem(String user_id, int product_id) {
		dao.deleteCartItem(user_id, product_id);

	}

	@Override
	public void deleteAllCart() {
		// TODO Auto-generated method stub

	}

	@Override
	public Double getTotalCartPrice(String user_id) {
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

}
