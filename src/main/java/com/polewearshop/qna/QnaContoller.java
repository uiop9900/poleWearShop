package com.polewearshop.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.comment.bo.CommentBO;
import com.polewearshop.comment.model.Comment;
import com.polewearshop.qna.bo.QnaBO;
import com.polewearshop.qna.model.Qna;

import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("/customer")
@ApiIgnore 
public class QnaContoller {

	@Autowired
	private QnaBO qnaBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/qna_list_view")
	public String qnaListView(Model model,
			@RequestParam(value="vpage", required=false) Integer page) {

		if (page == null) {
			page = 1;
		}
		
		List<Qna> qnaList =	qnaBO.getQnaList(page);
		int qnaNumber = qnaBO.getQnaListNumber();
		int first = (page - 1) * 10;
		
		model.addAttribute("first", first);
		model.addAttribute("qnaNumber", qnaNumber);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("viewName", "customer/qna_list");
		return "template/layout";
	}
	
	@GetMapping("/qna_create_view")
	public String qnaCreateView(Model model) {
		model.addAttribute("viewName", "customer/qna_create");
		return "template/layout";
	}
	
	@GetMapping("/qna_detailed_view")
	public String qnaDetailedView(
			Model model,
			@RequestParam("qnaId") int qnaId) {
		
		Qna qna = qnaBO.getQnaById(qnaId);
		String type = "qna";
		List<Comment> commentList = commentBO.getCommentListByTypeAndBoardId(type, qnaId);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("qna", qna);
		model.addAttribute("viewName", "customer/qna_detailed");
		return "template/layout";
	}
	
}

