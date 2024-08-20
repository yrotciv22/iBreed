package com.ibreed_project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ibreed_project.model.AlbumVO;

public interface IAlbumDAO {
	
	public ArrayList<AlbumVO> selectLatest();
	
	public void addAlbum(AlbumVO vo);
	
	public String albumCheck(String album_name);
	
	public void deleteAlbum(int album_id);
	
	public void updateAlbumName(AlbumVO vo);
	
	public ArrayList<AlbumVO> albumSearch(HashMap<String, Object> map);
	
	public ArrayList<AlbumVO> arrangeAlbum(HashMap<String, Object> map);
}
