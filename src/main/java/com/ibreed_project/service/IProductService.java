package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.ProductVO;

public interface IProductService {
	
	// main 실시간 인기 top 10 뽑아내기 (재고로 파악)
	public ArrayList<ProductVO> selectTopTen();
}
