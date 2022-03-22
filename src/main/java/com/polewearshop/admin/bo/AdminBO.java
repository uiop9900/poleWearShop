package com.polewearshop.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.admin.dao.AdminDAO;
import com.polewearshop.admin.model.Admin;

@Service
public class AdminBO {

	@Autowired
	private AdminDAO adminDAO;
	
	public Admin getAdmin(String loginId) {
		return adminDAO.selectAdmin(loginId);
	}
	
}
