package com.ibreed_project.model;

import java.sql.Timestamp;

public class EmotionVO {
    public double getSentiment_fear() {
        return sentiment_fear;
    }

    public void setSentiment_fear(double sentiment_fear) {
        this.sentiment_fear = sentiment_fear;
    }

    public double getSentiment_joy() {
        return sentiment_joy;
    }

    public void setSentiment_joy(double sentiment_joy) {
        this.sentiment_joy = sentiment_joy;
    }

    public double getSentiment_sorrow() {
        return sentiment_sorrow;
    }

    public void setSentiment_sorrow(double sentiment_sorrow) {
        this.sentiment_sorrow = sentiment_sorrow;
    }

    public double getSentiment_disgusting() {
        return sentiment_disgusting;
    }

    public void setSentiment_disgusting(double sentiment_disgusting) {
        this.sentiment_disgusting = sentiment_disgusting;
    }

    public double getSentiment_angry() {
        return sentiment_angry;
    }

    public void setSentiment_angry(double sentiment_angry) {
        this.sentiment_angry = sentiment_angry;
    }

    public String getSentiment_result() {
        return sentiment_result;
    }

    public void setSentiment_result(String sentiment_result) {
        this.sentiment_result = sentiment_result;
    }

    public double getSentiment_subject() {
        return sentiment_subject;
    }

    public void setSentiment_subject(double sentiment_subject) {
        this.sentiment_subject = sentiment_subject;
    }

    public String getSentiment_content() {
        return sentiment_content;
    }

    public void setSentiment_content(String sentiment_content) {
        this.sentiment_content = sentiment_content;
    }

    double sentiment_fear;
    double sentiment_joy;
    double sentiment_sorrow;
    double sentiment_disgusting;
    double sentiment_angry;
    String sentiment_result;
    double sentiment_subject;
    String sentiment_content;


    //일단 콘텐트 겟
    public int getDiary_id() {
        return diary_id;
    }

    public void setDiary_id(int diary_id) {
        this.diary_id = diary_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getDiary_title() {
        return diary_title;
    }

    public void setDiary_title(String diary_title) {
        this.diary_title = diary_title;
    }

    public String getDiary_content() {
        return diary_content;
    }

    public void setDiary_content(String diary_content) {
        this.diary_content = diary_content;
    }

    public Timestamp getDiary_create() {
        return diary_create;
    }

    public void setDiary_create(Timestamp diary_create) {
        this.diary_create = diary_create;
    }

    public int getDiary_post_id() {
        return diary_post_id;
    }

    public void setDiary_post_id(int diary_post_id) {
        this.diary_post_id = diary_post_id;
    }

    int diary_id;
    String user_id;
    String diary_title;
    String diary_content;
    Timestamp diary_create;
    int diary_post_id;

    public int getSentiment_note_id() {
        return sentiment_note_id;
    }

    public void setSentiment_note_id(int sentiment_note_id) {
        this.sentiment_note_id = sentiment_note_id;
    }

    int sentiment_note_id;


}
