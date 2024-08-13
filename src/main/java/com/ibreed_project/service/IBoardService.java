package com.ibreed_project.service;

import java.util.ArrayList;

import com.ibreed_project.model.BoardVO;

public interface IBoardService {
	 	
	 // 모든 게시판 목록 가져오기
    ArrayList<BoardVO> getAllBoards();
    
    // 특정 게시판 ID로 게시판 정보 가져오기
    BoardVO getBoardById(int boardId);
    
    // 새 게시판 추가
    void insertBoard(BoardVO board);
    
    // 게시판 정보 업데이트
    void updateBoard(BoardVO board);
    
    // 게시판 삭제
    void deleteBoard(int boardId);
}
