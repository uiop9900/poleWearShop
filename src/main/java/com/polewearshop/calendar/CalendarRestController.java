package com.polewearshop.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.calendar.bo.CalendarBO;
import com.polewearshop.calendar.model.Calendar;

@RestController
public class CalendarRestController {

	@Autowired
	private CalendarBO calendarBO;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/studio/reserve_calendar")
	public JSONArray studioCalendar() {
		
		List<Calendar> calendarList = calendarBO.getCalendarList();
        
		JSONArray jsonArray = new JSONArray();
		 for (Calendar calendar : calendarList) {
			 Map<String, Object> oneReserve = new HashMap<>();
				oneReserve.put("title", calendar.getTitle());
				oneReserve.put("start", calendar.getStart());
				oneReserve.put("end", calendar.getEnd());
				oneReserve.put("backgroundColor", calendar.getBackgroundColor());
				JSONObject jsonObj = new JSONObject(oneReserve);
				jsonArray.add(jsonObj);
		 }
		 
        return jsonArray;
	}

}
