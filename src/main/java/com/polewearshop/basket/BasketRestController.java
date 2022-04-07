package com.polewearshop.basket;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/basket")
public class BasketRestController {

	@Autowired
	private BasketBO basketBO;
	
    @ApiOperation(
            value = "장바구니 목록"
            , notes = "유저가 장바구니에 담으면 상품이 목록에 들어간다.")
	@RequestMapping("/basket_list")
	public Map<String, Object> basketList(
			@ModelAttribute Basket basket,
			HttpServletRequest request
			){
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		HttpSession session = request.getSession();
		Integer number = (Integer)session.getAttribute("basketNumber");
		
		//insert basket
		basketBO.addBasket(basket);
		
		//basketNumber받아서 session에 저장
		int basketNumber = basketBO.setSessionBasketNumberUptoTheFirstOrder(number, basket.getId());
		session.setAttribute("basketNumber", basketNumber);
		
		result.put("memberId", basket.getMemberId());
		result.put("basketNumber", basketNumber);
		result.put("result", "success");
		return result;
	
	}
	
    
    @ApiOperation(
            value = "장바구니 비우기"
            , notes = "비회원이 장바구니를 비운다.")
	@DeleteMapping("/nonMember_delete_basket")
	public Map<String, Object> nonMemberDeleteBasket(
			@RequestParam("basketId") int basketId){
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");

		basketBO.deleteBasketById(basketId);
		
		result.put("result", "success");
		return result;
	}
	
}
