package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.AlbumVO;

public interface IAlbumDAO {
	
	public ArrayList<AlbumVO> selectLatest();
	
	public ArrayList<AlbumVO> selectOld();
	
	public ArrayList<AlbumVO> selectSpelling();
	
	public ArrayList<AlbumVO> selectBackSpelling();
	
	public void deleteAlbum(int album_id);
	
	public void updateAlbumName(int album_id);
}
