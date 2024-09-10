package com.ibreed_project.model;

import java.util.Date;

public class MyPageVO {
	private int pay_id;
	private int pay_number;
	private String recipient_name;
	private String Recipient_address;
	private int delivery_charge;
	private Date pay_time;
	private int total_order_amount;
	private String payment_method;
	private String user_id;

	private int order_id;
	private int product_id;
	private int quantity;
	private int product_price;
	private String product_name;
	private String product_img;

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getPay_id() {
		return pay_id;
	}

	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}

	public int getPay_number() {
		return pay_number;
	}

	public void setPay_number(int pay_number) {
		this.pay_number = pay_number;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_address() {
		return Recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		Recipient_address = recipient_address;
	}

	public int getDelivery_charge() {
		return delivery_charge;
	}

	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}

	public Date getPay_time() {
		return pay_time;
	}

	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}

	public int getTotal_order_amount() {
		return total_order_amount;
	}

	public void setTotal_order_amount(int total_order_amount) {
		this.total_order_amount = total_order_amount;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
