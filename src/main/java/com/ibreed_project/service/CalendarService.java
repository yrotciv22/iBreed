package com.ibreed_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.IAlbumDAO;
import com.ibreed_project.dao.ICalendarDAO;
import com.ibreed_project.model.CalendarVO;

@Service
public class CalendarService implements ICalendarService {

	@Autowired
	ICalendarDAO dao;

	// diary_id 알아오기 위해서 IAlbumDAO의 getDiaryId() 사용
	@Autowired
	@Qualifier("IAlbumDAO")
	IAlbumDAO albumDao;

	@Override
	public List<CalendarVO> getAllEvents(String user_id) {
		int diary_id = albumDao.getDiaryId(user_id);
		return dao.getAllEvents(diary_id);
	}

	@Override
	public String addEvent(CalendarVO event) {
		return dao.addEvent(event);
	}
}
