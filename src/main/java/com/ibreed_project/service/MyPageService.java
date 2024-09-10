package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IMyPageDAO;
import com.ibreed_project.model.MyPageVO;

@Service
public class MyPageService implements IMyPageService {
	
	@Autowired
	IMyPageDAO dao;
	
	@Override
	public int countPayment(String user_id) {
		return dao.countPayment(user_id);
	}
	
	@Override
	public ArrayList<MyPageVO> selectPayment(String user_id) {
		return dao.selectPayment(user_id);
	}
	
	@Override
	public ArrayList<MyPageVO> selectOrder(int pay_number) {
		return dao.selectOrder(pay_number);
	}
}
