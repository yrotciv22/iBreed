package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.MyPageVO;

public interface IMyPageDAO {

	// 마이페이지 주문횟수 표시
	public int countPayment(String user_id);

	// 주문배송조회 - user_id에 따라 주문번호, 배송정보 등 출력
	public ArrayList<MyPageVO> selectPayment(String user_id);

	// 주문배송조회 - pay_number에 따라 주문상푸므 상품금액, 수량 
	public ArrayList<MyPageVO> selectOrder(int pay_number);
}