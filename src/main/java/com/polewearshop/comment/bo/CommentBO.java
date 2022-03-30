package com.polewearshop.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.comment.dao.CommentDAO;
import com.polewearshop.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public void addComment(String type, int boardId, String content) {
		commentDAO.insertComment(type, boardId, content);
	}
	
	public List<Comment> getCommentListByTypeAndBoardId(String type, int boardId) {
		return commentDAO.selectCommentListByTypeAndBoardId(type, boardId);
	}
	
	public void deleteCommentById(int id) {
		commentDAO.deleteCommentById(id);
	}
}
