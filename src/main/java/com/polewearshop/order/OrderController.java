package com.polewearshop.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.basket.bo.BasketBO;

@Controller
@RequestMapping("/order")
public class OrderController {

	
	@Autowired
	private BasketBO basketBO;
	
	@RequestMapping("/sign_in_view")
	public String orderSignInView(Model model) {
		model.addAttribute("viewName", "order/sign_in");
		return "template/layout";
	}
	
	//비회원-구매하기-로그인-멤버구매
	@RequestMapping("/order_member_view")
	public String orderMemberView(
			Model model,
			@RequestParam("basketNumber") int basketNumber,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int memberId = (int)session.getAttribute("memberId");
		
		basketBO.updateMemberIdByBasketNumber(memberId, basketNumber);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("viewName", "order/order_member");
		model.addAttribute("basketNumber", basketNumber);
		
		return "template/layout";
	}
	
	@RequestMapping("/order_nonMember_view")
	public String orderNonMemberView(
			Model model,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int basketNumber = (int)session.getAttribute("basketNumber");
		
		
		model.addAttribute("basketNumber", basketNumber);
		model.addAttribute("viewName", "order/order_nonMember");
		return "template/layout";
	}
}
