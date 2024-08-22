


package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IMydiaryDAO;
import com.ibreed_project.model.MydiaryVO;

@Service
public class MydiaryService implements IMydiaryService {

	
	@Autowired
	@Qualifier("IMydiaryDAO")
	IMydiaryDAO dao;
	
	@Override
	public MydiaryVO viewMydiary(String user_id) {
		return dao.viewMydiary(user_id);
	}

	@Override
	public void updateMydiary(MydiaryVO vo, String category) {

		System.out.println("MydiaryService category= " +category);

		dao.updateMydiary(vo,category);
	}
	
	@Override
	public ArrayList<MydiaryVO> selectBestDiary() {
		return dao.selectBestDiary();
	}

	@Override
	public ArrayList<MydiaryVO> searchMydiary(HashMap<String, Object> map) {
		return null;
	}

	

}
