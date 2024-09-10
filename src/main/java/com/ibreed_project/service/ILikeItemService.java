package com.ibreed_project.service;

import java.util.Map;

import com.ibreed_project.model.LikeItemVO;

public interface ILikeItemService {
	
	// 각 상품 찜하기 버튼 확인(로그인별로)
	public String likeCheck(LikeItemVO vo);
	
	// 찜리스트 추가하기
	public void insertLike(Map map);
	
	// 찜리스트 삭제하기
	public void deleteLike(Map map);
	
	
}
