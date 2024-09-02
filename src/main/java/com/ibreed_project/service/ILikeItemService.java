package com.ibreed_project.service;

import com.ibreed_project.model.LikeItemVO;

public interface ILikeItemService {
	
	// 각 상품 찜하기 버튼 확인(로그인별로)
	public String likeCheck(LikeItemVO vo);
}
