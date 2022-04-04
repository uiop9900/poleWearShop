package com.polewearshop.calendar.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.calendar.dao.CalendarDAO;
import com.polewearshop.calendar.model.Calendar;

@Service
public class CalendarBO {

	@Autowired
	private CalendarDAO calendarDAO;
	
	private static final String CALENDAR_BACKGROUND_COLOR = "green";
	
	public void addCalendar(String title, String start, String end) {
		String backgroundColor = CALENDAR_BACKGROUND_COLOR;
		calendarDAO.insertCalendar(title, start, end, backgroundColor);
	}
	
	public List<Calendar> getCalendarList() {
		return calendarDAO.selectCalendarList();
	}
}
