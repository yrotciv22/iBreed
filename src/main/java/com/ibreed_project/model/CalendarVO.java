package com.ibreed_project.model;

public class CalendarVO {
	private int CALENDAR_NO;
	private String CALENDAR_TITLE;
	private String CALENDAR_MEMO;
	private String CALENDAR_START;
	private String CALENDAR_END;
	private int diary_id;
	private String color;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getCALENDAR_NO() {
		return CALENDAR_NO;
	}

	public void setCALENDAR_NO(int cALENDAR_NO) {
		CALENDAR_NO = cALENDAR_NO;
	}

	public String getCALENDAR_TITLE() {
		return CALENDAR_TITLE;
	}

	public void setCALENDAR_TITLE(String cALENDAR_TITLE) {
		CALENDAR_TITLE = cALENDAR_TITLE;
	}

	public String getCALENDAR_MEMO() {
		return CALENDAR_MEMO;
	}

	public void setCALENDAR_MEMO(String cALENDAR_MEMO) {
		CALENDAR_MEMO = cALENDAR_MEMO;
	}

	public String getCALENDAR_START() {
		return CALENDAR_START;
	}

	public void setCALENDAR_START(String cALENDAR_START) {
		CALENDAR_START = cALENDAR_START;
	}

	public String getCALENDAR_END() {
		return CALENDAR_END;
	}

	public void setCALENDAR_END(String cALENDAR_END) {
		CALENDAR_END = cALENDAR_END;
	}

	public int getDiary_id() {
		return diary_id;
	}

	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}

}
