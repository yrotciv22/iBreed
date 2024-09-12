package com.ibreed_project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ibreed_project.model.MyPageVO;

@Mapper
public interface IMyPageDAO {

	// 마이페이지 주문횟수 표시
	public int countPayment(String user_id);

	// 주문배송조회 - user_id에 따라 주문번호, 배송정보 등 출력
	public ArrayList<MyPageVO> selectPayment(String user_id);

	// 주문배송 리스트 조회 - pay_number에 따라 주문상푸므 상품금액, 수량 
	public ArrayList<MyPageVO> selectOrder(int pay_number);
	
	// 찜리스트 조회 - user_id에 따라 상품 가격, 이름 등 
	public ArrayList<MyPageVO> selectLikeItemList(String user_id);
	
	// 찜리스트 개별 삭제 버튼 
	public void deleteItem(int product_id);
	
	// 최근본상품 조회 - 쿠키에서 상품 번호 추출
	public List<MyPageVO> getProductsByIds(List<Integer> product_id);


}