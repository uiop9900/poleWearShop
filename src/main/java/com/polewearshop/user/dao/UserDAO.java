package com.polewearshop.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.user.model.Member;

@Repository
public interface UserDAO {

	public Member selectMember(String loginId);
	
	public Member selectMembetById(int memberId);
	
	public Member selectMemberByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public int insertMember(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email, 
			@Param("sex") String sex, 
			@Param("address") String address, 
			@Param("birth") String birth);
	
	public void updateMileageById(
			@Param("id") int memberId, 
			@Param("mileage") int mileage);
	
}
