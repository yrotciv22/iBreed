package com.ibreed_project.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class AccountVO {


    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_password() {
        return User_password;
    }

    public void setUser_password(String user_password) {
        User_password = user_password;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public boolean isUser_gender() {
        return user_gender;
    }

    public void setUser_gender(boolean user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_phone_number() {
        return user_phone_number;
    }

    public void setUser_phone_number(String user_phone_number) {
        this.user_phone_number = user_phone_number;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public Date getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(Date user_birth) {
        this.user_birth = user_birth;
    }

    public String getUser_kids_select() {
        return user_kids_select;
    }

    public void setUser_kids_select(String user_kids_select) {
        this.user_kids_select = user_kids_select;
    }

    public int getUser_fetus_old() {
        return user_fetus_old;
    }

    public void setUser_fetus_old(int user_fetus_old) {
        this.user_fetus_old = user_fetus_old;
    }

    public int getUser_kids_old() {
        return user_kids_old;
    }

    public void setUser_kids_old(int user_kids_old) {
        this.user_kids_old = user_kids_old;
    }

    public boolean isUser_location_agree() {
        return user_location_agree;
    }

    public void setUser_location_agree(boolean user_location_agree) {
        this.user_location_agree = user_location_agree;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getUser_address_detail() {
        return user_address_detail;
    }

    public void setUser_address_detail(String user_address_detail) {
        this.user_address_detail = user_address_detail;
    }

    public String getUser_auth_address() {
        return user_auth_address;
    }

    public void setUser_auth_address(String user_auth_address) {
        this.user_auth_address = user_auth_address;
    }

    public String getUser_hint() {
        return user_hint;
    }

    public void setUser_hint(String user_hint) {
        this.user_hint = user_hint;
    }

    public String getUser_hint_sub() {
        return user_hint_sub;
    }

    public void setUser_hint_sub(String user_hint_sub) {
        this.user_hint_sub = user_hint_sub;
    }

    public String getUser_rate() {
        return user_rate;
    }

    public void setUser_rate(String user_rate) {
        this.user_rate = user_rate;
    }

    public String getUeer_profile_image() {
        return ueer_profile_image;
    }

    public void setUeer_profile_image(String ueer_profile_image) {
        this.ueer_profile_image = ueer_profile_image;
    }

    public Date getUser_timestamp() {
        return User_timestamp;
    }

    public void setUser_timestamp(Date user_timestamp) {
        User_timestamp = user_timestamp;
    }

    private String user_id;
    private String User_password;
    private String user_nickname;
    private String user_name;
    private boolean user_gender;
    private String user_phone_number;
    private String user_email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date user_birth;
    private String user_kids_select;
    private int user_fetus_old;
    private int user_kids_old;
    private boolean user_location_agree;
    private String user_address;
    private String user_address_detail;
    private String user_auth_address;
    private String user_hint;
    private String user_hint_sub;
    private String user_rate;
    private String ueer_profile_image;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date User_timestamp;

    public String getEmailDomain() {
        return emailDomain;
    }

    public void setEmailDomain(String emailDomain) {
        this.emailDomain = emailDomain;
    }

    private String emailDomain;
}
