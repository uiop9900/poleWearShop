package com.polewearshop.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.order.bo.OrderProcessBO;
import com.polewearshop.order.model.OrderProductView;

import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("/nonMember")
@ApiIgnore 
public class NonMemberController {

	@Autowired
	private OrderProcessBO orderProcessBO;
	
	//주문번호로 조회하기
	@RequestMapping("/orderNumber_check_result_view")
	public String checkOrderNumberView(Model model,
			@RequestParam("orderNumber") String orderNumber) {
		
		List<OrderProductView> orderProductViewList = orderProcessBO.getNonMemberOrderProductByOrderNumber(orderNumber);
		
		model.addAttribute("orderProductViewList", orderProductViewList);
		model.addAttribute("viewName", "user/orderNumber_check_result");
		
		return "template/layout";
	}
}
