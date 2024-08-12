package com.ibreed_project.service;

import java.util.Date;

public class PostVO {
	  	private int postId;
		private String postTitle;
	    private String postContent;
	    private Date postCreate;
	    private Date postUpdate;
	    private int postCount;
	    private String postHeading;
	    private boolean postStatus;
	    private String userId;
	    private int boardId2;
	  	
	  	
	  	
	  	
	    public int getPostId() {
			return postId;
		}
		public void setPostId(int postId) {
			this.postId = postId;
		}
		public String getPostTitle() {
			return postTitle;
		}
		public void setPostTitle(String postTitle) {
			this.postTitle = postTitle;
		}
		public String getPostContent() {
			return postContent;
		}
		public void setPostContent(String postContent) {
			this.postContent = postContent;
		}
		public Date getPostCreate() {
			return postCreate;
		}
		public void setPostCreate(Date postCreate) {
			this.postCreate = postCreate;
		}
		public Date getPostUpdate() {
			return postUpdate;
		}
		public void setPostUpdate(Date postUpdate) {
			this.postUpdate = postUpdate;
		}
		public int getPostCount() {
			return postCount;
		}
		public void setPostCount(int postCount) {
			this.postCount = postCount;
		}
		public String getPostHeading() {
			return postHeading;
		}
		public void setPostHeading(String postHeading) {
			this.postHeading = postHeading;
		}
		public boolean isPostStatus() {
			return postStatus;
		}
		public void setPostStatus(boolean postStatus) {
			this.postStatus = postStatus;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public int getBoardId2() {
			return boardId2;
		}
		public void setBoardId2(int boardId2) {
			this.boardId2 = boardId2;
		}


}
