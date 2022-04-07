package com.polewearshop.studio.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.polewearshop.studio.dao.StudioDAO;
import com.polewearshop.studio.model.Studio;

@Service
public class StudioBO {
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 

	@Autowired
	private StudioDAO studioDAO;
	
	@Transactional
	public Studio getStudioById(int id) {
		logger.debug("[select studio] 스튜디오pk를 통해 스튜디오 정보를 select합니다. + studioId:" + id);
		return studioDAO.selectStudioById(id);
	}
	

}
