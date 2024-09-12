package com.ibreed_project.model;

import java.util.Date;

public class CommentVO {
	
	private int comment_id;
	private String comment_id_write;
	private String comment_content;
	private Date comment_create;
	private Date comment_update;
	private boolean comment_secret;
	private int post_id;
	private Integer parent_comment_id;
	
	
	public Integer getParent_comment_id() {
		return parent_comment_id;
	}
	public void setParent_comment_id(Integer parent_comment_id) {
		this.parent_comment_id = parent_comment_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_id_write() {
		return comment_id_write;
	}
	public void setComment_id_write(String comment_id_write) {
		this.comment_id_write = comment_id_write;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_create() {
		return comment_create;
	}
	public void setComment_create(Date comment_create) {
		this.comment_create = comment_create;
	}
	public Date getComment_update() {
		return comment_update;
	}
	public void setComment_update(Date comment_update) {
		this.comment_update = comment_update;
	}
	public boolean isComment_secret() {
		return comment_secret;
	}
	public void setComment_secret(boolean comment_secret) {
		this.comment_secret = comment_secret;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	

}
