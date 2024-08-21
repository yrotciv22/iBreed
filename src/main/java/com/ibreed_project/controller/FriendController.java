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


@Controller
public class FriendController {

		@Autowired
		FriendService friendService;
		
		
		@RequestMapping("/mydiary/{user_id}/friends")
	    public String view_mydiary_friendList(@PathVariable("user_id") String user_id, Model model) {


	        ArrayList<FriendVO> friendList  = friendService.getFriendList(user_id);
	        model.addAttribute("friendList", friendList);
	        model.addAttribute("user_id", user_id);
	        	        
			return "diary/mydiary_friends"; 
		}
		
		 @PostMapping("/deleteFriend")
		    @ResponseBody
		    public  Map<String, Object> deleteFriend(@RequestBody Map<String, String> payload) {
		        String user_id = payload.get("user_id");
		        String friend_id = payload.get("friend_id");
		        
				System.out.println("user_id? "+user_id);
				System.out.println("friend_id? "+friend_id);

			    Map<String, Object> response = new HashMap<>();

			    try {
			        friendService.deleteFriend(user_id, friend_id);
			        response.put("success", true);
			    } catch (Exception e) {
			        response.put("success", false);
			        response.put("error", e.getMessage());
			    }

			    return response;
		    }
	
}
