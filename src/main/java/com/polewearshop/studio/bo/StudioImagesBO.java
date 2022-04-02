package com.polewearshop.studio.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.common.FileManagerService;
import com.polewearshop.studio.dao.StudioImagesDAO;
import com.polewearshop.studio.model.StudioImages;

@Service
public class StudioImagesBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private StudioImagesDAO studioImagesDAO;
	
	public void addStudioImages(String admin, int studioId, String type, MultipartFile file) {
		String studioImagePath = fileManager.savefile(admin, file);
		studioImagesDAO.insertStudioImages(studioId, type, studioImagePath);
	}
	
	public List<StudioImages> getStudioImagesByStudioId(Integer studioId) {
		if (studioId == null) {
			studioId = 1;
		}
		return studioImagesDAO.selectStudioImagesByStudioId(studioId);
	}
	
	public void deleteStudioImage(String imagePath) {
		try {
			fileManager.deleteFile(imagePath);
		} catch (IOException e) {
			logger.error("[delete studioImage] 삭제할 스튜디오의 사진이 없습니다." + imagePath);
		}
		studioImagesDAO.deleteStudioImage(imagePath);
	}
}
