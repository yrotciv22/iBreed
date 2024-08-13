package com.ibreed_project.dao;

import java.util.ArrayList;

import com.ibreed_project.model.BoardVO;

public interface IBoardDAO {

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
