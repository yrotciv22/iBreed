package com.ibreed_project.service;

import java.util.Calendar;
import java.util.List;

public interface ICalendarService {
	
	public List<Calendar> getAllEvents();
	
	public void addEvent(Calendar event);
	
	public void updateEvent(Calendar event);
	
	public void deleteEvent(int CALENDAR_NO);
}
