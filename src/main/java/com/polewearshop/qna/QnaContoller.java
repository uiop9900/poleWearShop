package com.polewearshop.qna;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class QnaContoller {

	@RequestMapping("/qna_list_view")
	public String qnaListView(Model model) {
		model.addAttribute("viewName", "customer/qna_list");
		return "template/layout";
	}
	
	@RequestMapping("/qna_create_view")
	public String qnaCreateView(Model model) {
		model.addAttribute("viewName", "customer/qna_create");
		return "template/layout";
	}
	
}

