package com.ibreed_project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibreed_project.model.AlbumVO;
import com.ibreed_project.service.AlbumService;

@Controller
public class AlbumController {

	@Autowired
	AlbumService albumService;

	@RequestMapping("/mydiary/photos")
	public String view_mydiary_album(Model model) {

		ArrayList<AlbumVO> latestList = albumService.selectLatest();
		ArrayList<AlbumVO> orderList = albumService.selectOld();
		ArrayList<AlbumVO> spellingList = albumService.selectSpelling();
		ArrayList<AlbumVO> backSpellingList = albumService.selectBackSpelling();

		model.addAttribute("latestList", latestList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("spellingList", spellingList);
		model.addAttribute("backSpellingList", backSpellingList);

		return "diary/mydiary_photos";
	}
	
	@RequestMapping("/album/addAlbum")
	public String addAlbum(AlbumVO vo) {
		albumService.addAlbum(vo);
		return "redirect:/mydiary/photos";
	}

	@RequestMapping("/album/deleteAlbum/{album_id}")
	public String deleteAlbum(@PathVariable("album_id") int album_id) {
		albumService.deleteAlbum(album_id);
		return "redirect:/mydiary/photos";
	}
	
	@RequestMapping("/album/updateAlbum")
	public String updateAlbum(AlbumVO vo) {
		albumService.updateAlbumName(vo);
		return "redirect:/mydiary/photos";
	}
	
	@RequestMapping("/mydiary/photos/앨범1")
	public String viewDetatilPhoto() {
		return "diary/photos/detail_photos";
	}
}
