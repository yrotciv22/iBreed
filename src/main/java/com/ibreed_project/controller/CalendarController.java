package com.ibreed_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibreed_project.model.CalendarVO;
import com.ibreed_project.service.CalendarService;

@RestController
@RequestMapping("/api/events")
public class CalendarController {

	@Autowired
	CalendarService calendarService;

    @PostMapping("/add")
    public String addEvent(@RequestBody CalendarVO event) {
        calendarService.addEvent(event);
        return "Event added successfully";
    }
}
