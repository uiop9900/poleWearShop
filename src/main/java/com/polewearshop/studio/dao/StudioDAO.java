package com.polewearshop.studio.dao;

import org.springframework.stereotype.Repository;

import com.polewearshop.studio.model.Studio;

@Repository
public interface StudioDAO {

	public Studio selectStudioById(int id);
	

}
