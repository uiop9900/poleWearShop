package com.polewearshop.admin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.admin.model.Admin;

@Repository
public interface AdminDAO {
	
	public Admin selectAdmin(String loginId);
}
