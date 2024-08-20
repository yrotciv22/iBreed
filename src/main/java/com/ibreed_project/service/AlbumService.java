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
	public ArrayList<AlbumVO> selectLatest() {
		return dao.selectLatest();
	}
	
	@Override
	public String addAlbum(AlbumVO vo) {
		String result = "available";
		
		if(dao.albumCheck(vo.getAlbum_name()) == null) {
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
	public void updateAlbumName(AlbumVO vo) {
		dao.updateAlbumName(vo);
	}
	
	@Override
	public ArrayList<AlbumVO> albumSearch(HashMap<String, Object> map) {
		return dao.albumSearch(map);
	}
	
	@Override
	public ArrayList<AlbumVO> arrangeAlbum(HashMap<String, Object> map) {
		return dao.arrangeAlbum(map);
	}
}
