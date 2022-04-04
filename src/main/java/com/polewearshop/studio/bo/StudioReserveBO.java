package com.polewearshop.studio.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.util.StringUtils;
import com.polewearshop.calendar.bo.CalendarBO;
import com.polewearshop.studio.dao.StudioReserveDAO;
import com.polewearshop.studio.model.StudioReserve;

@Service
public class StudioReserveBO {
	
	@Autowired
	private CalendarBO calendarBO;
	
	@Autowired
	private StudioReserveDAO studioReserveDAO;
	
	public void addStudioReserve(int studioId, String visitorName, String visitorPhoneNumber, 
			String visitorDate, String visitorTime) {
		studioReserveDAO.insertStudioReserve(studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime);
	}
	
	public List<StudioReserve> generateStudioReserveList(String btnType, String date) {
		List<StudioReserve> reserveList = new ArrayList<>();
		if (StringUtils.isNullOrEmpty(date) && (StringUtils.isNullOrEmpty(btnType) || btnType.equals("notFix"))) {
			//미확정예약
			date = null;
			reserveList = getNonFixStudioReserveList();
		} else if (StringUtils.isNullOrEmpty(date) && btnType.equals("fix")) {
			//확정예약
			date = null;
			reserveList = getFixStudioReserveListByDate(date);
 		} else if (date != null && btnType.equals("fixDate")) {
 			reserveList = getFixStudioReserveListByDate(date);
 		}
		return reserveList;
	}
	
	//확정예약-날짜있으면 날짜별로, 없으면 다 가지고 온다.
	public List<StudioReserve> getFixStudioReserveListByDate(String date) {
		return studioReserveDAO.selectFixStudioReserveListByDate(date);
	}
	
	//미확정예약
	public List<StudioReserve> getNonFixStudioReserveList() {
		return studioReserveDAO.selectNonFixStudioReserveList();
	}
	
	//미확정예약 -> 확정
	public void updateNonFixReserve(int id, int studioId, String visitorName, String visitorPhoneNumber, String visitorDate,
			String visitorTime, int	price) {
		
		//calendar에 저장하기
		String date = visitorDate;
		String start =  date + " " +visitorTime.split("~")[0];	
		String end =  date + " " + visitorTime.split("~")[1];	
		calendarBO.addCalendar(visitorName, start, end);
		
		studioReserveDAO.updateNonFixReserve(id, studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime, price);
	}
	
	//예약정보 detail
	public StudioReserve getStudioReserveById(int reserveId) {
		return studioReserveDAO.selectStudioReserveById(reserveId);
	}
	
	//예약삭제
	public void deleteStudioReserveById(int id) {
		studioReserveDAO.deleteStudioReserveById(id);
	}
	
}
