package com.polewearshop.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.user.dao.NonMemberDAO;
import com.polewearshop.user.model.NonMember;

@Service
public class NonMemberBO {
	
	@Autowired
	private NonMemberDAO nonMemberDAO;
	
	public NonMember getNonMemberByNameOrderNumber(String name, String orderNumber) {
		return nonMemberDAO.selectNonMemberByNameOrderNumber(name, orderNumber);
	}
	
	public void addNonMember(NonMember nonMember) {
		nonMemberDAO.insertNonMember(nonMember);
	}
	
	public NonMember getNonMemberByOrderNumber(String orderNumber) {
		return nonMemberDAO.selectNonMemberByOrderNumber(orderNumber);
	}
	
	
}
