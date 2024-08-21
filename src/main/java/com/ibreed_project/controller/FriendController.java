package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.FriendVO;
import com.ibreed_project.service.FriendService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FriendController {

	@Autowired
	FriendService friendService;

	// 친구 리스트
	@RequestMapping("/mydiary/{user_id}/friends")
	public String view_mydiary_friendList(@PathVariable("user_id") String user_id, Model model) {

		ArrayList<FriendVO> friendList = friendService.getFriendList(user_id);
		model.addAttribute("friendList", friendList);
		model.addAttribute("user_id", user_id);

		return "diary/mydiary_friends";
	}

	// 친구 삭제
	@RequestMapping("/mydiary/{user_id}/deleteFriend/{friend_id}")
	public String deleteFriend(HttpSession session, @PathVariable("friend_id") String friend_id) {

		String user_id = (String) session.getAttribute("user_id");

		if (user_id != null) {
			friendService.deleteFriend(user_id, friend_id);
			return "redirect:/mydiary/{user_id}/friends";
		} else {
			// user_id가 세션에 없는 경우 처리 (예: 로그인 페이지로 리다이렉트)
			return "redirect:/account/login";
		}
	}

}
