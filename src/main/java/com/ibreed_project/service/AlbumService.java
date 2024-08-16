package com.ibreed_project.service;

import java.util.ArrayList;

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
	public ArrayList<AlbumVO> selectOld() {
		return dao.selectOld();
	}
	
	@Override
	public ArrayList<AlbumVO> selectSpelling() {
		return dao.selectSpelling();
	}
	
	@Override
	public ArrayList<AlbumVO> selectBackSpelling() {
		return dao.selectBackSpelling();
	}
	
	@Override
	public void deleteAlbum(int album_id) {
		dao.deleteAlbum(album_id);
	}
	
	@Override
	public void updateAlbumName(int album_id) {
		dao.updateAlbumName(album_id);
	}
}
