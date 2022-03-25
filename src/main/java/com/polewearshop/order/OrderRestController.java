package com.polewearshop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;

@RestController
@RequestMapping("/order")
public class OrderRestController {

	@Autowired
	private BasketBO basketBO;
	
	@RequestMapping("/order_member")
	public Map<String, Object> orderMember(
			HttpServletRequest request,
			@ModelAttribute Basket basket
			) {

		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		//basketBO에 객체 담고 id를 받아서 basketNumber에 담기
		basketBO.addBasket(basket);
		//세션에도 baksetNumber를 담는다.
		basketBO.updateBasketNumberById(basket.getId());
		
		result.put("result", "success");
		return result;
		
	}
}
