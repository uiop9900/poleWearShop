package com.polewearshop.studio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.studio.model.StudioImages;

@Repository
public interface StudioImagesDAO {

	public void insertStudioImages(
			@Param("studioId") int studioId, 
			@Param("type") String type, 
			@Param("studioImagePath") String studioImagePath);
	
	public List<StudioImages> selectStudioImagesByStudioId(int studioId);
	
	public void deleteStudioImage(String imagePath);
}
