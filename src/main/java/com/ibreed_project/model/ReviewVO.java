package com.ibreed_project.model;

import java.time.LocalDateTime;
import java.util.Date;

public class ReviewVO {

	@Override
	public String toString() {
		return "ReviewVO{" +
				"review_id=" + review_id +
				", review_title='" + review_title + '\'' +
				", review_coment='" + review_coment + '\'' +
				", review_rating=" + review_rating +
				", review_time=" + review_time +
				", user_id='" + user_id + '\'' +
				", img='" + img + '\'' +
				", product_id=" + product_id +
				", user_name='" + user_name + '\'' +
				", product_name='" + product_name + '\'' +
				'}';
	}

	private int review_id;
	private String review_title;
	private String review_coment;
	private int review_rating;

	public LocalDateTime getReview_time() {
		return review_time;
	}

	public void setReview_time(LocalDateTime review_time) {
		this.review_time = review_time;
	}

	private LocalDateTime review_time;
	private String user_id;
	private String img;
	private int product_id;

	private String user_name;
	private String product_name;

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_coment() {
		return review_coment;
	}

	public void setReview_coment(String review_coment) {
		this.review_coment = review_coment;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

}
