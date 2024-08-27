package com.ibreed_project.model;

import java.util.Date;

public class Mydiary_diaryVO {
	
	private int diaryPostId; // diary_post_id
	private int diaryId; // diary_id
	private String diaryTitle; // diary_title
	private String diaryContent; // diary_content
	private String diaryFile; // diary_file
	private Date diaryCreate; // diary_create
	private Date diaryUpdate; // diary_update
	private int diaryViews; // diary_views
	private int diaryLike; // diary_like
	private boolean diaryUploadStatus; // diary_upload_status
	private String diaryWeather; // diary_weather
	private String diaryTag; // diary_tag
	private String diaryPublic; // diary_public (ENUM('전체공개', '친구공개', '비공개'))
	private String diaryCategory; // diary_category (ENUM('임신', '출산', '육아', '산모'))
	private int commentCount; // comment_count
	private boolean isDeleted; // is_deleted
	private String userId;
	
	    public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
		public int getDiaryPostId() {
		return diaryPostId;
	}
	public void setDiaryPostId(int diaryPostId) {
		this.diaryPostId = diaryPostId;
	}
	public int getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	public String getDiaryFile() {
		return diaryFile;
	}
	public void setDiaryFile(String diaryFile) {
		this.diaryFile = diaryFile;
	}
	public Date getDiaryCreate() {
		return diaryCreate;
	}
	public void setDiaryCreate(Date diaryCreate) {
		this.diaryCreate = diaryCreate;
	}
	public Date getDiaryUpdate() {
		return diaryUpdate;
	}
	public void setDiaryUpdate(Date diaryUpdate) {
		this.diaryUpdate = diaryUpdate;
	}
	public int getDiaryViews() {
		return diaryViews;
	}
	public void setDiaryViews(int diaryViews) {
		this.diaryViews = diaryViews;
	}
	public int getDiaryLike() {
		return diaryLike;
	}
	public void setDiaryLike(int diaryLike) {
		this.diaryLike = diaryLike;
	}
	public boolean isDiaryUploadStatus() {
		return diaryUploadStatus;
	}
	public void setDiaryUploadStatus(boolean diaryUploadStatus) {
		this.diaryUploadStatus = diaryUploadStatus;
	}
	public String getDiaryWeather() {
		return diaryWeather;
	}
	public void setDiaryWeather(String diaryWeather) {
		this.diaryWeather = diaryWeather;
	}
	public String getDiaryTag() {
		return diaryTag;
	}
	public void setDiaryTag(String diaryTag) {
		this.diaryTag = diaryTag;
	}
	public String getDiaryPublic() {
		return diaryPublic;
	}
	public void setDiaryPublic(String diaryPublic) {
		this.diaryPublic = diaryPublic;
	}
	public String getDiaryCategory() {
		return diaryCategory;
	}
	public void setDiaryCategory(String diaryCategory) {
		this.diaryCategory = diaryCategory;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}



}
