package com.polewearshop.order;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/order")
public class OrderController {

	@RequestMapping("/sign_in_view")
	public String orderSignInView(Model model) {
		model.addAttribute("viewName", "order/sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/order_member_view")
	public String orderMemberView(
			Model model,
			@RequestParam("baksetId") int baksetId
			) {
		return "template/layout";
	}
}
