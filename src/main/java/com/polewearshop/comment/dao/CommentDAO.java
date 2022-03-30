package com.polewearshop.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void insertComment(
			@Param("type") String type, 
			@Param("boardId")int boardId, 
			@Param("content")String content);
	
	public List<Comment> selectCommentListByTypeAndBoardId(
			@Param("type") String type, 
			@Param("boardId") int boardId);
	
	public void deleteCommentById(int id);
}
