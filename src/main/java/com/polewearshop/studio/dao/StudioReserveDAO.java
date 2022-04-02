package com.polewearshop.studio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.studio.model.StudioReserve;

@Repository
public interface StudioReserveDAO {

	public void insertStudioReserve(
			@Param("studioId") int studioId, 
			@Param("visitorName") String visitorName, 
			@Param("visitorPhoneNumber") String visitorPhoneNumber, 
			@Param("visitorDate") String visitorDate, 
			@Param("visitorTime") String visitorTime);
	
	public StudioReserve selectStudioReserveById(int reserveId);
	
	public List<StudioReserve> selectFixStudioReserveListByDate(String date);
	
	public List<StudioReserve> selectNonFixStudioReserveList();
	
	public void updateNonFixReserve(
			@Param("id") int id, 
			@Param("studioId") int studioId, 
			@Param("visitorName") String visitorName, 
			@Param("visitorPhoneNumber") String visitorPhoneNumber, 
			@Param("visitorDate") String visitorDate,
			@Param("visitorTime") String visitorTime, 
			@Param("price") int	price);
	
}
