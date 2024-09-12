package com.ibreed_project.model;


import java.util.Date;

public class DiaryCommentVO {

	    private int id; 
	    private String diaryCommentUserIdWrite; 
	    private String diaryCommentContent;
	    private int diaryPostId; 
	    private int parentCommentId; //대댓글위해서
	    private int likeCount; 
	    private String status; 
	    private boolean isSecret; 
	    private String mentionedUserIds; 
	    private Date createdAt; 
	    private Date updatedAt; 

	    
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getDiaryCommentUserIdWrite() {
	        return diaryCommentUserIdWrite;
	    }

	    public void setDiaryCommentUserIdWrite(String diaryCommentUserIdWrite) {
	        this.diaryCommentUserIdWrite = diaryCommentUserIdWrite;
	    }

	    public String getDiaryCommentContent() {
	        return diaryCommentContent;
	    }

	    public void setDiaryCommentContent(String diaryCommentContent) {
	        this.diaryCommentContent = diaryCommentContent;
	    }

	    public int getDiaryPostId() {
	        return diaryPostId;
	    }

	    public void setDiaryPostId(int diaryPostId) {
	        this.diaryPostId = diaryPostId;
	    }

	    public int getParentCommentId() {
	        return parentCommentId;
	    }

	    public void setParentCommentId(int parentCommentId) {
	        this.parentCommentId = parentCommentId;
	    }

	    public int getLikeCount() {
	        return likeCount;
	    }

	    public void setLikeCount(int likeCount) {
	        this.likeCount = likeCount;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    public boolean isSecret() {
	        return isSecret;
	    }

	    public void setSecret(boolean isSecret) {
	        this.isSecret = isSecret;
	    }

	    public String getMentionedUserIds() {
	        return mentionedUserIds;
	    }

	    public void setMentionedUserIds(String mentionedUserIds) {
	        this.mentionedUserIds = mentionedUserIds;
	    }

	    public Date getCreatedAt() {
	        return createdAt;
	    }

	    public void setCreatedAt(Date createdAt) {
	        this.createdAt = createdAt;
	    }

	    public Date getUpdatedAt() {
	        return updatedAt;
	    }

	    public void setUpdatedAt(Date updatedAt) {
	        this.updatedAt = updatedAt;
	    }
	
}
