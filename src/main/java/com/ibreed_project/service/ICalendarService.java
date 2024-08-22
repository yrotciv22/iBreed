package com.ibreed_project.service;

import java.util.Calendar;
import java.util.List;

import com.ibreed_project.model.CalendarVO;

public interface ICalendarService {
	
	public List<Calendar> getAllEvents();
	
	public void addEvent(CalendarVO event);
	
	public void updateEvent(CalendarVO event);
	
	public void deleteEvent(int CALENDAR_NO);
}
