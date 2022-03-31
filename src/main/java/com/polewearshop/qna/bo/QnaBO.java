package com.polewearshop.qna.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.qna.dao.QnaDAO;

@Service
public class QnaBO {

	@Autowired
	private QnaDAO qnaDAO;
	
	public void addQna(String category, String subject, String name, String type, 
			String userNumber, String productName,String content, String password) {
		qnaDAO.insertQna(category, subject, name, type, userNumber, productName, content, password);
	}
}
