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
	
	private static final int QNA_MAX_SIZE = 10;
	
	public void addQna(String category, String subject, String name, String type, 
			String userNumber, String productName,String content, String password) {
		qnaDAO.insertQna(category, subject, name, type, userNumber, productName, content, password);
	}
	
	public int getQnaListNumber() {
		return qnaDAO.selectQnaNumber();
	}
	
	public List<Qna> getQnaList(int page) {
		int first = (page - 1) * 10;
		return qnaDAO.selectQnaList(first, QNA_MAX_SIZE);
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
