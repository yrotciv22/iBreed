package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IProductDAO;
import com.ibreed_project.model.ProductVO;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	@Qualifier("IProductDAO")
	IProductDAO dao;
	
	@Override
	public ArrayList<ProductVO> selectTopTen() {
		return dao.selectTopTen();
	}

	@Override
	public ArrayList<ProductVO> selectNewItem() {
		return dao.selectNewItem();
	}
	
	@Override
	public ArrayList<ProductVO> bestItem() {
		return dao.bestItem();
	}
	
	@Override
	public ArrayList<ProductVO> soldOutItem() {
		return dao.soldOutItem();
	}
	
	@Override
	public ArrayList<ProductVO> viewAllPrd() {
		return dao.viewAllPrd();
	}
}
