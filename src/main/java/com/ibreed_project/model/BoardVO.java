package com.ibreed_project.model;

import java.util.Date;

public class BoardVO {
	private int boardId;
    private String boardName;
    private String boardDescription;
    private Date boardCreate;
    private Date boardUpdate;
    
    
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardDescription() {
		return boardDescription;
	}
	public void setBoardDescription(String boardDescription) {
		this.boardDescription = boardDescription;
	}
	public Date getBoardCreate() {
		return boardCreate;
	}
	public void setBoardCreate(Date boardCreate) {
		this.boardCreate = boardCreate;
	}
	public Date getBoardUpdate() {
		return boardUpdate;
	}
	public void setBoardUpdate(Date boardUpdate) {
		this.boardUpdate = boardUpdate;
	}
}
