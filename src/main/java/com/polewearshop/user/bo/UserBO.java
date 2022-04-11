package com.polewearshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.user.dao.UserDAO;
import com.polewearshop.user.model.Member;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public Member getMember(String loginId) {
		return userDAO.selectMember(loginId);
	}
	
	public Member getMembetById(int memberId) {
		return userDAO.selectMembetById(memberId);
	}
	
	public Member getMemberByLoginIdPassword(String loginId, String password) {
		return userDAO.selectMemberByLoginIdPassword(loginId, password);
	}
	
	
	public int addMember(String loginId, String password, String name, String phoneNumber
			, String email, String sex, String address, String birth) {
		return userDAO.insertMember(loginId, password, name, phoneNumber, email, sex, address, birth);
	}
	
	//기존의 마일리지와 사용된 마일리지 계산
	public void updateMileageById(int memberId, int temMileage, int mileage) {
		Member member = getMembetById(memberId);
		mileage = member.getMileage() - mileage + temMileage;
		userDAO.updateMileageById(memberId, mileage);
	}
	
	public void updateMemberInfoById(int memberId, String name, String address, String phoneNumber, String email) {
		userDAO.updateMemberInfoById(memberId, name, address, phoneNumber, email);
	}
}
