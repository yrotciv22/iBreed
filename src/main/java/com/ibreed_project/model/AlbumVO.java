package com.ibreed_project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AlbumVO {
	private int album_id;
	private String album_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date album_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date album_update;
	private int album_public;
	private int diary_id;
	private int photo_count;
	private String album_cover_img;

	private int photo_id;
	private String photo_name;
	private String user_id;

	public String getAlbum_cover_img() {
		return album_cover_img;
	}

	public void setAlbum_cover_img(String album_cover_img) {
		this.album_cover_img = album_cover_img;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPhoto_count() {
		return photo_count;
	}

	public void setPhoto_count(int photo_count) {
		this.photo_count = photo_count;
	}

	private Date photo_date;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")

	public int getAlbum_id() {
		return album_id;
	}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	public Date getPhoto_date() {
		return photo_date;
	}

	public void setPhoto_date(Date photo_date) {
		this.photo_date = photo_date;
	}

	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}

	public String getAlbum_name() {
		return album_name;
	}

	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}

	public Date getAlbum_date() {
		return album_date;
	}

	public void setAlbum_date(Date album_date) {
		this.album_date = album_date;
	}

	public Date getAlbum_update() {
		return album_update;
	}

	public void setAlbum_update(Date album_update) {
		this.album_update = album_update;
	}

	public int getAlbum_public() {
		return album_public;
	}

	public void setAlbum_public(int album_public) {
		this.album_public = album_public;
	}

	public int getDiary_id() {
		return diary_id;
	}

	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}

}
