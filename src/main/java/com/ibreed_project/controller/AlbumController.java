package com.ibreed_project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ibreed_project.model.AlbumVO;
import com.ibreed_project.service.AlbumService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlbumController {

	@Autowired
	AlbumService albumService;

	@RequestMapping("/mydiary/{user_id}/photos")
	public String view_mydiary_album(@PathVariable("user_id") String user_id, Model model) {
		
		ArrayList<AlbumVO> latestList = albumService.selectLatest(user_id);
		
		model.addAttribute("latestList", latestList);
		model.addAttribute("user_id", user_id);
		
		return "diary/mydiary_photos";
	}

	@RequestMapping("/mydiary/detailAlbum/{album_id}")
	public String detailAlbum(@PathVariable("album_id") String album_id,
							  Model model) {
		
		String album_name= albumService.getAlbumName(album_id);
		ArrayList<AlbumVO> photoList = albumService.selectPhoto(album_id);
		
		model.addAttribute("album_name", album_name);
		model.addAttribute("photoList", photoList);
		
		return "diary/photos/mydiary_DetailAlbum";
	}
	
	@ResponseBody
	@RequestMapping("/album/addAlbum")
	public String addAlbum(AlbumVO vo,  HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		vo.setUser_id(user_id);
		
		String result = albumService.addAlbum(vo);
		
		System.out.println("유저 아이디는 " + vo.getUser_id());
		
		return result;
	}
	
	@RequestMapping("/album/deleteAlbum/{album_id}")
	public String deleteAlbum(@PathVariable("album_id") int album_id, HttpSession session) {
		albumService.deleteAlbum(album_id);
		
		String userId = (String) session.getAttribute("user_id");
		
		return "redirect:/mydiary/" + userId + "/photos";
	}

	@RequestMapping("/album/updateAlbum")
	public String updateAlbum(AlbumVO vo, HttpSession session) {
		albumService.updateAlbumName(vo);
		
		String userId = (String) session.getAttribute("user_id");
		
		return "redirect:/mydiary/" + userId + "/photos";
	}

	@RequestMapping("/mydiary/albumSearch")
	public String albumSearch(@RequestParam HashMap<String, Object> map,
										  Model model) {
		ArrayList<AlbumVO> albumList = albumService.albumSearch(map);
		model.addAttribute("albumList", albumList);
		return "diary/photos/albumSearchResult";
	}
	
	@RequestMapping("/mydiary/arrangeAlbum")
	public String arrangeAlbum(@RequestParam HashMap<String, Object> map,
			Model model) {
		ArrayList<AlbumVO> albumList = albumService.arrangeAlbum(map);
		model.addAttribute("albumList", albumList);
		return "diary/photos/albumSearchResult";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public String imageFileUpload(@RequestParam("uploadFile") MultipartFile file) throws IOException {
		
		String uploadPath = "C:/iBreedWorkspace/images/";
		
		// 이 부분에서 이름을 고쳐줘야함
		String originalFileName = file.getOriginalFilename();
		
		File sendFile = new File(uploadPath + originalFileName);
		
		file.transferTo(sendFile);
		
		String result = "success";
		
		return result;
	}
	
}
