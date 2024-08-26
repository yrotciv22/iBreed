package com.ibreed_project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.ibreed_project.model.AlbumVO;

public interface IAlbumService {

	// 앨범 list 최신순으로 뽑아내기
	public ArrayList<AlbumVO> selectLatest(String user_id);

	// 앨범 상세 페이지에 앨범이름 가져오기
	public String getAlbumName(String album_id);
	
	// 앨범 상세 페이지에 유저이름 가져오기
	public String getUserId(String user_id);
	
	// 
	public int getDiaryId(String user_id);
	
	// 사진 뽑아내기
	public ArrayList<AlbumVO> selectPhoto(String album_id);
	
	// 앨범 추가하기
	public String addAlbum(AlbumVO vo);

	// 앨범 삭제하기
	public void deleteAlbum(int album_id);

	// 앨범 이름 수정하기
	public void updateAlbumName(AlbumVO vo);

	// 앨범 이름으로 검색하기
	public ArrayList<AlbumVO> albumSearch(HashMap<String, Object> map);

	// 앨범 정렬하기
	public ArrayList<AlbumVO> arrangeAlbum(HashMap<String, Object> map);
}
