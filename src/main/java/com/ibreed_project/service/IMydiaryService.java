package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ibreed_project.model.MydiaryVO;

public interface IMydiaryService {

	
	// 마이다이어리 생성과 삭제는 회원 가입/탈퇴시 자동 
	
	// user_id에 해당하는 다이어리 조회 
	public MydiaryVO viewMydiary(String user_id);
	
	// 다이어리 등록 
	
	// 다이어리 수정
    void updateMydiary(@Param("vo") MydiaryVO vo, @Param("category") String category);
	
	// 인기 다이어리
	public ArrayList<MydiaryVO> selectBestDiary();
	
	// 다이어리 검색 ? 
	public ArrayList<MydiaryVO> searchMydiary(HashMap<String, Object> map);
	
}
