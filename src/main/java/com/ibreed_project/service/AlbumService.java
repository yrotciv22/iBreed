package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IAlbumDAO;
import com.ibreed_project.model.AlbumVO;

@Service
public class AlbumService implements IAlbumService {

	@Autowired
	@Qualifier("IAlbumDAO")
	IAlbumDAO dao;

	@Override
	public ArrayList<AlbumVO> selectLatest(String user_id) {
		return dao.selectLatest(user_id);
	}
	
	@Override
	public ArrayList<AlbumVO> selectPhoto(String album_id) {
		return dao.selectPhoto(album_id);
	}
	
	@Override
	public String getAlbumName(String album_id) {
		return dao.getAlbumName(album_id);
	}
	
	@Override
	public String getUserId(String user_id) {
		return dao.getUserId(user_id);
	}
	
	@Override
	public int getDiaryId(String user_id) {
		return dao.getDiaryId(user_id);
	}
	
	@Override
	public String addAlbum(AlbumVO vo) {
		String result = "available";
		
		if(dao.albumCheck(vo) == null) {
			dao.addAlbum(vo);
		} else {
			result = "not_available";
		}
		
		return result;
	}
	
	@Override
	public void deleteAlbum(int album_id) {
		dao.deleteAlbum(album_id);
	}
	
	@Override
	public String updateAlbumName(AlbumVO vo) {
		String result = "available";
		
		if(dao.albumCheck(vo) == null) {
			dao.updateAlbumName(vo);
		} else {
			result = "not_available";
		}
		
		return result;
	}
	
	@Override
	public ArrayList<AlbumVO> albumSearch(HashMap<String, Object> map) {
		return dao.albumSearch(map);
	}
	
	@Override
	public ArrayList<AlbumVO> arrangeAlbum(HashMap<String, Object> map) {
		return dao.arrangeAlbum(map);
	}
	
	@Override
	public String updateCover(AlbumVO vo) {
		String response = "success";
		
		dao.updateCover(vo);
		
		return response;
	}
	
	@Override
	public void insertPhoto(AlbumVO vo) {
		dao.insertPhoto(vo);
	}
	
	@Override
	public void albumPhotoCount(int album_id) {
		dao.albumPhotoCount(album_id);
	}
	
	@Override
	public String deletePhoto(AlbumVO vo) {
		String response = "success";
		
		dao.deletePhoto(vo);
		
		return response;
	}
	
	@Override
	public void minusPhotoCount(int album_id) {
		dao.minusPhotoCount(album_id);
	}
}
