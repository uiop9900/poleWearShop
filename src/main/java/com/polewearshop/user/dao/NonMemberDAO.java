package com.polewearshop.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.user.model.NonMember;

@Repository
public interface NonMemberDAO {
	
	public void insertNonMember(NonMember nobMember);
	
	public NonMember selectNonMemberByNameOrderNumber(
			@Param("name") String name, 
			@Param("orderNumber") String orderNumber);
	
	public NonMember selectNonMemberByOrderNumber(String orderNumber);
}
