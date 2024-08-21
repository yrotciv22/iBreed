package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.FriendVO;


public interface IFriendDAO {
	
	// 친구 리스트
	public ArrayList<FriendVO> getFriendList(String user_id);
	
	// 친구 1명 상세정보
	public FriendVO getFriendInfo(String user_id1, String user_id2);
	
	// 친구 추가
	public void addFriend (String user_id1, String user_id2);
	
	// 친구 삭제
	public void deleteFriend (String user_id, String friend_id);

}
