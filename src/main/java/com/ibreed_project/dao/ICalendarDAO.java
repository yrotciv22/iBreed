package com.ibreed_project.dao;

import java.util.List;

import com.ibreed_project.model.CalendarVO;

public interface ICalendarDAO {
	
	public List<CalendarVO> getAllEvents(int diary_id);
	
	public String addEvent(CalendarVO event);
}
