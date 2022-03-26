package com.polewearshop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		HttpSession session = request.getSession();
		
		if (session.getAttribute("basketNumber") == null) {
			// session에 baksetNumber가 없으면, 새롭게 저장한 basketId를 basketNumber로 저장한다.
			session.setAttribute("basketNumber", basket.getId());
			basketBO.updateBasketNumberById(basket.getId(),basket.getId());
		} else if (session.getAttribute("basketNumber") != null) {
			// session에 baksetNumber가 있으면, 그 값을 basketNumber에 저장한다.
			int basketNumber = (int)session.getAttribute("basketNumber");
			basketBO.updateBasketNumberById(basket.getId(), basketNumber);
		}
		
		result.put("result", "success");
		return result;
		
	}
}
