package com.polewearshop.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	public User getUser() {
	
		return userDAO.getUser();
	}
}
