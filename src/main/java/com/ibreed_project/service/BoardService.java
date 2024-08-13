package com.ibreed_project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IBoardDAO;
import com.ibreed_project.model.BoardVO;
@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private IBoardDAO boardDAO;

	@Override
	public ArrayList<BoardVO> getAllBoards() {
		// TODO Auto-generated method stub
		return boardDAO.getAllBoards();
	}
	 @Override
	    public BoardVO getBoardById(int boardId) {
	        return boardDAO.getBoardById(boardId);
	    }

	    @Override
	    public void insertBoard(BoardVO board) {
	        boardDAO.insertBoard(board);
	    }

	    @Override
	    public void updateBoard(BoardVO board) {
	        boardDAO.updateBoard(board);
	    }

	    @Override
	    public void deleteBoard(int boardId) {
	        boardDAO.deleteBoard(boardId);
	    }
	}