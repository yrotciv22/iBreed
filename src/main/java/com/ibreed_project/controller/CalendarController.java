package com.ibreed_project.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ibreed_project.model.CalendarVO;
import com.ibreed_project.service.CalendarService;

@RestController
@RequestMapping("/api/events")
public class CalendarController {

	@Autowired
	CalendarService calendarService;

	@GetMapping
	public List<Calendar> getAllEvents() {
		return calendarService.getAllEvents();
	}

	@PostMapping
	public void addEvent(@RequestBody CalendarVO event) {
		calendarService.addEvent(event);
	}

	@PutMapping
	public void updateEvent(@RequestBody CalendarVO event) {
		calendarService.updateEvent(event);
	}

	   @DeleteMapping("/{CALENDAR_NO}")
	    public void deleteEvent(@PathVariable int CALENDAR_NO) {
	        calendarService.deleteEvent(CALENDAR_NO);
	    }
}
