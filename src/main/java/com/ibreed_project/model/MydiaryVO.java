package com.ibreed_project.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MydiaryVO {
	private int diary_id;
	private String diary_sentiment;
	private String diary_title;
	private Date diary_create_date;
	private int diary_count;
	private boolean diary_public;
	private String user_id;
	private String diary_profile_text;
	private String diary_profile_image;
	public int getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}
	public String getDiary_sentiment() {
		return diary_sentiment;
	}
	public void setDiary_sentiment(String diary_sentiment) {
		this.diary_sentiment = diary_sentiment;
	}
	public String getDiary_title() {
		return diary_title;
	}
	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}
	public Date getDiary_create_date() {
		return diary_create_date;
	}
	public void setDiary_create_date(Date diary_create_date) {
		this.diary_create_date = diary_create_date;
	}
	public int getDiary_count() {
		return diary_count;
	}
	public void setDiary_count(int diary_count) {
		this.diary_count = diary_count;
	}
	public boolean isDiary_public() {
		return diary_public;
	}
	public void setDiary_public(boolean diary_public) {
		this.diary_public = diary_public;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDiary_profile_text() {
		return diary_profile_text;
	}
	public void setDiary_profile_text(String diary_profile_text) {
		this.diary_profile_text = diary_profile_text;
	}
	public String getDiary_profile_image() {
		return diary_profile_image;
	}
	public void setDiary_profile_image(String diary_profile_image) {
		this.diary_profile_image = diary_profile_image;
	} 
	
	
	
}
