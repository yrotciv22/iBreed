package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.AlbumVO;

public interface IAlbumService {

	// 앨범 list 최신순으로 뽑아내기 (album_date로 파악)
	public ArrayList<AlbumVO> selectLatest();
	
	// 앨범 list 오래된 순으로 뽑아내기 (album_date로 파악)
	public ArrayList<AlbumVO> selectOld();
	
	// 앨범 list 이름순으로 뽑아내기
	public ArrayList<AlbumVO> selectSpelling();
	
	// 앨범 list 이름반대순으로 뽑아내기
	public ArrayList<AlbumVO> selectBackSpelling();
	
	// 앨범 추가하기
	public void addAlbum(AlbumVO vo);
	
	// 앨범 삭제하기
	public void deleteAlbum(int album_id);
	
	// 앨범 이름 수정하기
	public void updateAlbumName(AlbumVO vo);
}
