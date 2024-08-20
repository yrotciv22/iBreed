package com.ibreed_project.model;

import java.time.LocalDateTime;

public class DiaryCommentVO {

	   private int id; // id
	    private String diaryCommentUserIdWrite; // diary_comment_user_id_write
	    private String diaryCommentContent; // diary_comment_content
	    private int diaryPostId; // diary_post_id
	    private int parentCommentId; // parent_comment_id
	    private int likeCount; // like_count
	    private String status; // status (ENUM('active', 'inactive', 'reported'))
	    private boolean isSecret; // is_secret
	    private String mentionedUserIds; // mentioned_user_ids
	    private LocalDateTime createdAt; // created_at
	    private LocalDateTime updatedAt; // updated_at

	    
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

	    public LocalDateTime getCreatedAt() {
	        return createdAt;
	    }

	    public void setCreatedAt(LocalDateTime createdAt) {
	        this.createdAt = createdAt;
	    }

	    public LocalDateTime getUpdatedAt() {
	        return updatedAt;
	    }

	    public void setUpdatedAt(LocalDateTime updatedAt) {
	        this.updatedAt = updatedAt;
	    }
	
}
