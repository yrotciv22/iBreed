package com.ibreed_project.model;

public class LikeItemVO {
	private int wish_id;
	private String user_id;
	private int wish_item;

	private int product_id;

	public int getWish_id() {
		return wish_id;
	}

	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getWish_item() {
		return wish_item;
	}

	public void setWish_item(int wish_item) {
		this.wish_item = wish_item;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

}
