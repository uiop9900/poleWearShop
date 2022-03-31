package com.polewearshop.qna.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface QnaDAO {

	public void insertQna(
			@Param("category") String category, 
			@Param("subject") String subject, 
			@Param("name") String name, 
			@Param("type") String type, 
			@Param("userNumber") String userNumber, 
			@Param("productName") String productName,
			@Param("content") String content,
			@Param("password") String password); 
}
