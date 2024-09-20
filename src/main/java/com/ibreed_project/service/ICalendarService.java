package com.ibreed_project.service;

import java.util.List;

import com.ibreed_project.model.CalendarVO;

public interface ICalendarService {
	
	public List<CalendarVO> getAllEvents(String user_id);
	
	public String addEvent(CalendarVO event);
}
