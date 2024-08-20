package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IFriendDAO;
import com.ibreed_project.model.FriendVO;

@Service
public class FriendService implements IFriendService {
	
	@Autowired
	@Qualifier("IFriendDAO")
	private IFriendDAO dao;

	@Override
	public ArrayList<FriendVO> getFriendList(String user_id) {
		return dao.getFriendList(user_id);
	}

	@Override
	public FriendVO getFriendInfo(String user_id1, String user_id2) {
		return dao.getFriendInfo(user_id1, user_id2);
	}

	@Override
	public void addFriend(String user_id1, String user_id2) {
		dao.addFriend(user_id1, user_id2);
	}

	@Override
	public void deleteFriend(String user_id1, String user_id2) {
		dao.deleteFriend(user_id1, user_id2);
	}

}
