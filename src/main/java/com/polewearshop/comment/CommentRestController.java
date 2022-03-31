package com.polewearshop.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.comment.bo.CommentBO;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/comment")
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@ApiOperation(
            value = "리뷰 코멘트 저장"
            , notes = "admin이 작성한 comment를 작성한다.")
	@RequestMapping("/comment_list")
	public Map<String, Object> reviewComment(
			@RequestParam("type") String type,
			@RequestParam("boardId") int boardId,
			@RequestParam("content") String content
			) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		commentBO.addComment(type, boardId, content);
		
		result.put("result", "success");
		return result;
	}
	
	@ApiOperation(
            value = "리뷰 코멘트 삭제"
            , notes = "commentId를 받아서 삭제한다.")
	@DeleteMapping("/review_comment_delete")
	public Map<String, Object> reviewCommentDelete(
			@RequestParam("commentId") int commentId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		commentBO.deleteCommentById(commentId);
		result.put("result", "success");
		return result;
	}
	
}
