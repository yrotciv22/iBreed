package com.ibreed_project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ibreed_project.model.MydiaryVO;

public interface IMydiaryDAO {
	

	public MydiaryVO viewMydiary(String user_id);

	public void updateMydiary(@Param("vo") MydiaryVO vo,@Param("category") String category);
	
	public ArrayList<MydiaryVO> selectBestDiary();
	
	public ArrayList<MydiaryVO> searchMydiary(String user_id);
}