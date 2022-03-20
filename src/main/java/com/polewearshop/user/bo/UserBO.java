package com.polewearshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.user.dao.UserDAO;
import com.polewearshop.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public User getUser(String loginId) {
		return userDAO.selectUser(loginId);
	}
	
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	
	public int addUser(String loginId, String password, String name, String phoneNumber
			, String email, String sex, String address, String birth) {
		return userDAO.insertUser(loginId, password, name, phoneNumber, email, sex, address, birth);
	}
	
	
}
