package com.ibreed_project.dao;

import java.util.List;

import com.ibreed_project.model.CalendarVO;

public interface ICalendarDAO {
	public List<CalendarVO> getAllEvents(int diary_id);
	
	public void addEvent(CalendarVO event);
	
	public void updateEvent(CalendarVO event);
	
	public void deleteEvent(int CALENDAR_NO);
}
