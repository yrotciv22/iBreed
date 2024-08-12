package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.ProductVO;

public interface IProductService {
	
	// main 실시간 인기 top 10 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> selectTopTen();
	
	// main 신상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> selectNewItem();
	
	// main 인기상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> bestItem();
	
	// main 품절상품 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> soldOutItem();
}
