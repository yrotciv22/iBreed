package com.ibreed_project.model;

public class CalendarVO {
	private int Key;
	private String calendar_memo;
	private String calendar_notice;
	private int diary_id;
	private String calendar_title;
	private String calendar_start;
	private String calendar_end;

	public int getKey() {
		return Key;
	}

	public void setKey(int key) {
		Key = key;
	}

	public String getCalendar_memo() {
		return calendar_memo;
	}

	public void setCalendar_memo(String calendar_memo) {
		this.calendar_memo = calendar_memo;
	}

	public String getCalendar_notice() {
		return calendar_notice;
	}

	public void setCalendar_notice(String calendar_notice) {
		this.calendar_notice = calendar_notice;
	}

	public int getDiary_id() {
		return diary_id;
	}

	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_start() {
		return calendar_start;
	}

	public void setCalendar_start(String calendar_start) {
		this.calendar_start = calendar_start;
	}

	public String getCalendar_end() {
		return calendar_end;
	}

	public void setCalendar_end(String calendar_end) {
		this.calendar_end = calendar_end;
	}

}
