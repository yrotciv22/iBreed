package com.ibreed_project.model;

import java.sql.Date;

public class ChatbotVO {

    public Date getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(Date user_birth) {
        this.user_birth = user_birth;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
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

    Date user_birth;
    String user_nickname;
    String user_kids_select;
    int user_fetus_old;
    int user_kids_old;
}
