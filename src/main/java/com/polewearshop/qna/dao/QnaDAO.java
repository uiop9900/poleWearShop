package com.polewearshop.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.qna.model.Qna;

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
	
	public int selectQnaNumber();
		
	
	public List<Qna> selectQnaList(
			@Param("first") int first, 
			@Param("number") int number);
	
	public Qna selectQnaById(int qnaId);
	
	public void deleteQnaById(int qnaId);
}
