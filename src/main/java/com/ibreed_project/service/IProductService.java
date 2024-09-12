package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.ProductVO;
import com.ibreed_project.model.ReviewVO;

public interface IProductService {
	
	// main 실시간 인기 top 10 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> selectTopTen();
	
	// main 신상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> selectNewItem();
	
	// main 인기상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> bestItem();
	
	// main 품절상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> soldOutItem();
	
	// 전체상품 뽑아내기
	public ArrayList<ProductVO> viewAllPrd();
	
	// 상품상세 정보 조회
	public ProductVO detailViewPrd(int product_id);
}
