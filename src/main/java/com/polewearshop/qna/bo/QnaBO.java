package com.polewearshop.qna.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.qna.dao.QnaDAO;
import com.polewearshop.qna.model.Qna;

@Service
public class QnaBO {

	@Autowired
	private QnaDAO qnaDAO;
	
	public void addQna(String category, String subject, String name, String type, 
			String userNumber, String productName,String content, String password) {
		qnaDAO.insertQna(category, subject, name, type, userNumber, productName, content, password);
	}
	
	public List<Qna> getQnaList() {
		return qnaDAO.selectQnaList();
	}
	
	public Qna getQnaById(int qnaId) {
		return qnaDAO.selectQnaById(qnaId);
	}
	
	public void deleteQnaById(int qnaId) {
		qnaDAO.deleteQnaById(qnaId);
	}
	
	public boolean checkQnaPassword(int qnaId, String password) {
		Qna qna = getQnaById(qnaId);
		
		if (password.equals(qna.getPassword())) {
			return true;
		} 
		return false;
	}
}
