package com.polewearshop.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.basket.model.Basket;
import com.polewearshop.user.bo.NonMemberBO;

@Controller
@RequestMapping("/nonMember")
public class NonMemberController {

	@Autowired
	private NonMemberBO nonMemberBO;
	
	@RequestMapping("/orderNumber_check_result_view")
	public String checkOrderNumberView(Model model,
			@RequestParam("orderNumber") String orderNumber) {
		
		List<Basket> basketList = nonMemberBO.generateNonMemberOrderByBasketNumber(orderNumber);
		
		model.addAttribute("basketList", basketList);
		model.addAttribute("viewName", "user/orderNumber_check_result");
		
		return "template/layout";
	}
}
