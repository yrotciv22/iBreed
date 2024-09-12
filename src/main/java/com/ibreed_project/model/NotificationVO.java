package com.ibreed_project.model;

import java.sql.Timestamp;

public class NotificationVO {
    public int getNoti_id() {
        return noti_id;
    }

    public void setNoti_id(int noti_id) {
        this.noti_id = noti_id;
    }

    public boolean isNotice_diary() {
        return notice_diary;
    }

    public void setNotice_diary(boolean notice_diary) {
        this.notice_diary = notice_diary;
    }

    public boolean isNotice_calender() {
        return notice_calender;
    }

    public void setNotice_calender(boolean notice_calender) {
        this.notice_calender = notice_calender;
    }

    public boolean isNotice_shop() {
        return notice_shop;
    }

    public void setNotice_shop(boolean notice_shop) {
        this.notice_shop = notice_shop;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    int noti_id;
    boolean notice_diary;
    boolean notice_calender;
    boolean notice_shop;
    boolean notice_message;
    Timestamp noti_time;

    public boolean isNotice_message() {
        return notice_message;
    }

    public void setNotice_message(boolean notice_message) {
        this.notice_message = notice_message;
    }

    public Timestamp getNoti_time() {
        return noti_time;
    }

    public void setNoti_time(Timestamp noti_time) {
        this.noti_time = noti_time;
    }

    String user_id;
}
