package com.polewearshop.studio.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.studio.dao.StudioReserveDAO;
import com.polewearshop.studio.model.StudioReserve;

@Service
public class StudioReserveBO {
	
	@Autowired
	private StudioReserveDAO studioReserveDAO;
	
	public void addStudioReserve(int studioId, String visitorName, String visitorPhoneNumber, 
			String visitorDate, String visitorTime) {
		studioReserveDAO.insertStudioReserve(studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime);
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
		studioReserveDAO.updateNonFixReserve(id, studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime, price);
	}
	
	//예약정보 detail
	public StudioReserve getStudioReserveById(int reserveId) {
		return studioReserveDAO.selectStudioReserveById(reserveId);
	}
}
