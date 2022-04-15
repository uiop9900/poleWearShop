package com.polewearshop.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.BasketView;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	@Autowired
	private BasketBO basketBO;
	
	//회원의 장바구니 화면
	@ApiOperation(
            value = "회원의 장바구니 화면"
            , notes = "회원의 장바구니 화면")
	@GetMapping("/basket/member_basket_list_view")
	public String memberBasketListView(Model model,
			@RequestParam("basketNumber") int basketNumber,
			@RequestParam("memberId") int memberId) {
		
		List<BasketView> basketViewList =  basketBO.getBasketViewListByMemberId(memberId);
		
		model.addAttribute("basketViewList", basketViewList);
		model.addAttribute("viewName", "basket/member_basket_list");
		return "template/layout";
	}
	
	//비회원의 장바구니 화면
	@ApiOperation(
            value = "비회원의 장바구니 화면"
            , notes = "비회원의 장바구니 화면")
	@GetMapping("/basket/nonMember_basket_list_view")
	public String nonMemberBasketListView(Model model,
			@RequestParam("basketNumber") int basketNumber) {
		
		List<BasketView> basketViewList =  basketBO.getBasketViewListByBasketNumber(basketNumber);
		
		model.addAttribute("basketViewList", basketViewList);
		model.addAttribute("viewName", "basket/nonMember_basket_list");
		return "template/layout";
	}
	
	//장바구니가 비었을때 화면
	@ApiOperation(
            value = "장바구니가 비었을시 화면"
            , notes = "장바구니가 비었을시 화면")
	@GetMapping("/basket/nothing_view")
	public String nonMemberBasketListView(Model model) {
		
		model.addAttribute("viewName", "basket/nothing");
		return "template/layout";
	}

}
