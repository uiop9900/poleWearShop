package com.polewearshop.studio.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.studio.dao.StudioDAO;
import com.polewearshop.studio.model.Studio;

@Service
public class StudioBO {
	
	@Autowired
	private StudioDAO studioDAO;
	
	public Studio getStudioById(int id) {
		return studioDAO.selectStudioById(id);
	}
}
