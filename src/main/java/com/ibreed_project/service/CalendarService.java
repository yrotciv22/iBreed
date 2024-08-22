package com.ibreed_project.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICalendarDAO;
import com.ibreed_project.model.CalendarVO;

@Service
public class CalendarService implements ICalendarService {
	
	@Autowired
	ICalendarDAO dao;
	
	@Override
	public List<Calendar> getAllEvents() {
		return dao.getAllEvents();
	}
	
	@Override
	public void addEvent(CalendarVO event) {
		dao.addEvent(event);
	}
	
	@Override
	public void updateEvent(CalendarVO event) {
		dao.updateEvent(event);
	}
	
	@Override
	public void deleteEvent(int CALENDAR_NO) {
		dao.deleteEvent(CALENDAR_NO);
	}
	
}
