package com.ibreed_project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ibreed_project.model.AlbumVO;
import com.ibreed_project.service.AlbumService;
import com.ibreed_project.service.NaverObjectStorageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlbumController {

	@Autowired
	AlbumService albumService;

	@Autowired
	NaverObjectStorageService naverObjectStorageService;
	
	@RequestMapping("/mydiary/{user_id}/photos")
	public String view_mydiary_album(@PathVariable("user_id") String user_id, Model model) {
		
		ArrayList<AlbumVO> latestList = albumService.selectLatest(user_id);
		
		model.addAttribute("latestList", latestList);
		model.addAttribute("user_id", user_id);
		
		return "diary/mydiary_photos";
	}

	@RequestMapping("/mydiary/{user_id}/detailAlbum/{album_id}")
	public String detailAlbum(@PathVariable("album_id") String album_id,
									  @PathVariable("user_id") String user_id,
									  Model model) {
		
		String album_name= albumService.getAlbumName(album_id);
		ArrayList<AlbumVO> photoList = albumService.selectPhoto(album_id);
		
		model.addAttribute("album_name", album_name);
		model.addAttribute("photoList", photoList);
		model.addAttribute("user_id", user_id);
		
		System.out.println(user_id);
		
		return "diary/photos/mydiary_DetailAlbum";
	}
	
	@ResponseBody
	@RequestMapping("/album/addAlbum")
	public String addAlbum(AlbumVO vo, HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		System.out.println("유저아이디 확인용" + user_id);
		
		vo.setDiary_id(albumService.getDiaryId(user_id));
		
		System.out.println(vo.getDiary_id());
		System.out.println("Album Name: " + vo.getAlbum_name());  // 앨범 이름 확인
		System.out.println("Album ID: " + vo.getAlbum_id());  // 앨범 ID 확인
		
		String result = albumService.addAlbum(vo);
		
		return result;
	}
	
	@RequestMapping("/album/deleteAlbum/{album_id}")
	public String deleteAlbum(@PathVariable("album_id") int album_id, HttpSession session) {
		albumService.deleteAlbum(album_id);
		
		String userId = (String) session.getAttribute("user_id");
		
		return "redirect:/mydiary/" + userId + "/photos";
	}

	@ResponseBody
	@RequestMapping("/album/updateAlbum")
	public String updateAlbum(AlbumVO vo, HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		
		vo.setUser_id(user_id);
		vo.setDiary_id(albumService.getDiaryId(user_id));
		
		System.out.println("Album Name: " + vo.getAlbum_name());  // 앨범 이름 확인
		System.out.println("Album id: " + vo.getAlbum_id());  // 앨범 이름 확인
		System.out.println("Diary ID: " + vo.getDiary_id());  // 앨범 ID 확인
		
		String result = albumService.updateAlbumName(vo);
		
		return result;
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
							   Model model, 
							   HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		map.put("user_id", user_id);
		ArrayList<AlbumVO> albumList = albumService.arrangeAlbum(map);
		
		model.addAttribute("albumList", albumList);
		model.addAttribute("userId", user_id);
		
		
		return "diary/photos/albumSearchResult";
	}
	
	@ResponseBody
	@RequestMapping("/mydiary/updateCoverImg")
	public String updateCover(AlbumVO vo) {
		
		String photoPath = vo.getPhoto_path();
		int photoId = vo.getPhoto_id();
		int albumId = vo.getAlbum_id();
		
		vo.setPhoto_id(photoId);
		vo.setPhoto_path(photoPath);
		vo.setAlbum_id(albumId);
		
		String response = albumService.updateCover(vo);
		
		return response;
	}
	
	@RequestMapping(value = "/mydiary/{user_id}/insertPhoto/{album_id}", method = RequestMethod.POST)
	public String insertPhotos(@PathVariable("user_id") String user_id, 
			@PathVariable("album_id") int album_id,
			@RequestParam("diary_profile_image") MultipartFile file,
			@ModelAttribute AlbumVO vo, 
			Model model) {
		
	    if (file != null && !file.isEmpty()) {
	    	  try {
	              String fileName = file.getOriginalFilename();
	              System.out.println("[HomeController] Received file: " + fileName);

	              // 파일을 S3에 업로드합니다.
	              String uploadedFileUrl = naverObjectStorageService.uploadPhoto(file);
	              System.out.println("[HomeController] Uploaded file URL: " + uploadedFileUrl);

	              vo.setAlbum_id(album_id);
	              vo.setPhoto_name(fileName);
	              vo.setPhoto_path(uploadedFileUrl); // URL을 새 필드에 설정
	              
	              albumService.insertPhoto(vo);
	              albumService.albumPhotoCount(album_id);

	          } catch (Exception e) {
	              e.printStackTrace();
	              model.addAttribute("message", "파일 업로드 중 오류가 발생했습니다.");
	          }
	    }
	    
		return "redirect:/mydiary/" + user_id + "/detailAlbum/" + album_id; 
	}
	
	@ResponseBody
	@RequestMapping("/mydiary/deletePhoto")
	public String deletePhoto(AlbumVO vo) {
		
		int photo_id = vo.getPhoto_id();
		int album_id = vo.getAlbum_id();
		
		vo.setPhoto_id(photo_id);
		
		String response = albumService.deletePhoto(vo);
		albumService.minusPhotoCount(album_id);		
		
		return response;
	}
}
