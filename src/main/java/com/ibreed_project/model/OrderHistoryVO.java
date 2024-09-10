package com.ibreed_project.model;

public class OrderHistoryVO {


    @Override
    public String toString() {
        return "OrderHistoryVO{" +
                "order_id='" + order_id + '\'' +
                ", pay_number=" + pay_number +
                ", product_id=" + product_id +
                ", quantity=" + quantity +
                ", user_id='" + user_id + '\'' +
                ", product_name='" + product_name + '\'' +
                ", product_discount=" + product_discount +
                ", product_price=" + product_price +
                ", product_img='" + product_img + '\'' +
                ", product_stock=" + product_stock +
                ", product_sales=" + product_sales +
                ", product_coment=" + product_coment +
                '}';
    }

    String order_id;
    int pay_number;
    int product_id;
    int quantity;
    String user_id;
    String product_name;
    int product_discount;
    int product_price;
    String product_img;
    int product_stock;
    int product_sales;

    public String getProduct_coment() {
        return product_coment;
    }

    public void setProduct_coment(String product_coment) {
        this.product_coment = product_coment;
    }

    String product_coment;


    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public int getPay_number() {
        return pay_number;
    }

    public void setPay_number(int pay_number) {
        this.pay_number = pay_number;
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

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
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

    public int getProduct_stock() {
        return product_stock;
    }

    public void setProduct_stock(int product_stock) {
        this.product_stock = product_stock;
    }

    public int getProduct_sales() {
        return product_sales;
    }

    public void setProduct_sales(int product_sales) {
        this.product_sales = product_sales;
    }
}
