package com.ibreed_project.model;

import java.util.Date;

public class PostVO {
	  	private int postId;
		private String postTitle;
	    private String postContent;
	    private Date postCreate;
	    private Date postUpdate;
	    private int postCount;
	    private String postHeading;
	    private String userId;
	    private boolean postStatus;
	    private int boardId2;
	    private String postImage;
	    private String postVideo;
	    private String postUrl;
	    private String postLikes;
	    private String profileImage;
	    
		public String getProfileImage() {
			return profileImage;
		}
		public void setProfileImage(String profileImage) {
			this.profileImage = profileImage;
		}
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
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public boolean isPostStatus() {
			return postStatus;
		}
		public void setPostStatus(boolean postStatus) {
			this.postStatus = postStatus;
		}
		public int getBoardId2() {
			return boardId2;
		}
		public void setBoardId2(int boardId2) {
			this.boardId2 = boardId2;
		}
		public String getPostImage() {
			return postImage;
		}
		public void setPostImage(String postImage) {
			this.postImage = postImage;
		}
		public String getPostVideo() {
			return postVideo;
		}
		public void setPostVideo(String postVideo) {
			this.postVideo = postVideo;
		}
		public String getPostUrl() {
			return postUrl;
		}
		public void setPostUrl(String postUrl) {
			this.postUrl = postUrl;
		}
		public String getPostLikes() {
			return postLikes;
		}
		public void setPostLikes(String postLikes) {
			this.postLikes = postLikes;
		}
	    
	  	
}
