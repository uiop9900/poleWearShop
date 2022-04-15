package com.polewearshop.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.order.bo.OrderProcessBO;
import com.polewearshop.order.model.OrderProductView;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/nonMember")
public class NonMemberController {

	@Autowired
	private OrderProcessBO orderProcessBO;
	
	//주문번호로 조회하기
	@ApiOperation(
            value = "비회원의 주문번호로 조회하기 결과 화면"
            , notes = "최초의 로그인 화면에서 들어올 수 있는 주문번호로 조회하기의 결과 화면")
	@GetMapping("/orderNumber_check_result_view")
	public String checkOrderNumberView(Model model,
			@RequestParam("orderNumber") String orderNumber) {
		
		List<OrderProductView> orderProductViewList = orderProcessBO.getNonMemberOrderProductByOrderNumber(orderNumber);
		
		model.addAttribute("orderProductViewList", orderProductViewList);
		model.addAttribute("viewName", "user/orderNumber_check_result");
		
		return "template/layout";
	}
}
