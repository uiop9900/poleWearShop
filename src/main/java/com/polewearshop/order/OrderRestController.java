package com.polewearshop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/order")
public class OrderRestController {

	@Autowired
	private BasketBO basketBO;
	
    @ApiOperation(
            value = "구매하기 버튼"
            , notes = "상품세부페이지에서 구매하기 버튼을 누르면 basket에 상품정보가 담기고 session에 basketNumber를 담는다.")
	@RequestMapping("/order/basket_list")
	public Map<String, Object> orderMember(
			HttpServletRequest request,
			@ModelAttribute Basket basket
			) {

		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		//basketBO에 객체 담고 id를 받아서 basketNumber에 담기
		basketBO.addBasket(basket);
		int basketId = basket.getId();
		
		//세션에도 baksetNumber를 담는다.
		HttpSession session = request.getSession();
		Integer number = (Integer)session.getAttribute("basketNumber");
		
		int basketNumber = basketBO.setSessionBasketNumberUptoTheFirstOrder(number, basketId);
		session.setAttribute("basketNumber", basketNumber);
		
		Integer memberId = basket.getMemberId();
		
		result.put("basketNumber", basketNumber);
		result.put("memberId", memberId);
		result.put("result", "success");
		return result;
		
	}
    
    @RequestMapping("/order_member")
    public Map<String, Object> orderMember(
    		@RequestParam("memberId") int memberId,
    		@RequestParam("basketNumber") int basketNumber,
    		@RequestParam("deliveryFee") int deliveryFee,
    		@RequestParam("deliveredName") String deliveredName,
    		@RequestParam("deliveredAddress") String deliveredAddress,
    		@RequestParam("deliveredPhoneNumber") String deliveredPhoneNumber,
    		@RequestParam(value="deliveredComment", required=false) String deliveredComment
    		) {
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	return result;
    	
    }
	
	
}
