package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.MydiaryVO;

public interface IMydiaryDAO {
	

	public MydiaryVO viewMydiary(String user_id);

	public void updateMydiary(MydiaryVO vo);
	
	public ArrayList<MydiaryVO> selectBestDiary();
	
	public ArrayList<MydiaryVO> searchMydiary(String user_id);
}
