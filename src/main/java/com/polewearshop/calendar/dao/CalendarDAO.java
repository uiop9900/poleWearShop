package com.polewearshop.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.calendar.model.Calendar;

@Repository
public interface CalendarDAO {

	public void insertCalendar(
			@Param("title") String title,
			@Param("start") String start,
			@Param("end") String end, 
			@Param("backgroundColor") String backgroundColor,
			@Param("studioId") int studioId); 
	
	public List<Calendar> selectCalendarList(int studioId);
}
