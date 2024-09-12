package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.ProductVO;
import com.ibreed_project.model.ReviewVO;

public interface IProductDAO {
	public ArrayList<ProductVO> selectTopTen();
	
	public ArrayList<ProductVO> selectNewItem();
	
	public ArrayList<ProductVO> bestItem();
	
	public ArrayList<ProductVO> soldOutItem();
	
	public ArrayList<ProductVO> viewAllPrd();
	
	public ProductVO detailViewPrd(int product_id);
	
}
