package com.ibreed_project.model;

public class ProductVO {
	private int product_id;
	private String product_name;
	private int product_discount;
	private int product_price;
	private String product_img;
	private String product_coment;
	private int product_stock;
	private String product_main_category;
	private int product_sales;
	private String product_sub_category;
	private String product_detail_img;

	public String getProduct_detail_img() {
		return product_detail_img;
	}

	public void setProduct_detail_img(String product_detail_img) {
		this.product_detail_img = product_detail_img;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_sales() {
		return product_sales;
	}

	public void setProduct_sales(int product_sales) {
		this.product_sales = product_sales;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getProduct_coment() {
		return product_coment;
	}

	public void setProduct_coment(String product_coment) {
		this.product_coment = product_coment;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_main_category() {
		return product_main_category;
	}

	public void setProduct_main_category(String product_main_category) {
		this.product_main_category = product_main_category;
	}

	public String getProduct_sub_category() {
		return product_sub_category;
	}

	public void setProduct_sub_category(String product_sub_category) {
		this.product_sub_category = product_sub_category;
	}

}
